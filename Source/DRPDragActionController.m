//
// Created by Maciej Banasiewicz on 18/06/14.
// Copyright (c) 2014 Maciej. All rights reserved.
//

#import "DRPDragActionController.h"
#import "DRPDraggableImageView.h"
#import "POPAnimation.h"
#import "POPSpringAnimation.h"
#import "DRPDraggableView.h"
#import "DRPOverlayView.h"

CGPoint CGPointAdd(CGPoint p1, CGPoint p2) {
    return CGPointMake(p1.x + p2.x, p1.y + p2.y);
}

@interface DRPDragActionController ()
@property (strong, nonatomic) DRPDraggableView *currentDraggableView;
@end

@implementation DRPDragActionController
- (void)insertReferencingViewOverlay {
    NSAssert(self.referencingViewOverlay, @"You must provide referencing view overlay subclass");
    [self.referencingView addSubview:self.referencingViewOverlay];
    
    [self.referencingView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_referencingViewOverlay]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_referencingViewOverlay)]];
    [self.referencingView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_referencingViewOverlay]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_referencingViewOverlay)]];
    
    [UIView animateWithDuration:0.5f animations:^{
        self.referencingViewOverlay.alpha = 1.0f;
    }];
}

- (void)removeReferencingViewOverlay {
    [UIView animateWithDuration:0.5f animations:^{
        self.referencingViewOverlay.alpha = 0.0f;
    } completion:^(BOOL finished) {
        [self.referencingViewOverlay removeFromSuperview];
    }];
}

- (void)didPressImageView:(UILongPressGestureRecognizer *)longPressGestureRecognizer {

    static CGPoint initialPoint;
    DRPDraggableImageView *draggableImageView = (DRPDraggableImageView *) longPressGestureRecognizer.view;
    CGPoint viewOffset = self.viewOffset;
    [self insertReferencingViewOverlay];
    switch (longPressGestureRecognizer.state) {
        case UIGestureRecognizerStatePossible:break;
        case UIGestureRecognizerStateBegan: {
            initialPoint = [longPressGestureRecognizer locationInView:self.referencingView];
            self.currentDraggableView = [[DRPDraggableView alloc] initWithFrame:CGRectMake(0.0, 0.0, 65.0f, 65.0f)];
            self.currentDraggableView.backgroundColor = [UIColor clearColor];
            self.currentDraggableView.center = initialPoint;
            self.currentDraggableView.imageView.image = draggableImageView.image;
            self.currentDraggableView.alpha = 0.0f;
            [self.referencingViewOverlay addSubview:self.currentDraggableView];

            [UIView animateWithDuration:0.3f animations:^{
                self.currentDraggableView.alpha = 1.0f;
            }];
            break;
        }
        case UIGestureRecognizerStateChanged:{
            CGPoint newPoint = [longPressGestureRecognizer locationInView:self.referencingView];
            CGPoint newPosition = CGPointAdd(newPoint, viewOffset);
            _currentDraggableView.center = newPosition;
            break;
        }
        case UIGestureRecognizerStateEnded:
        case UIGestureRecognizerStateCancelled:
        case UIGestureRecognizerStateFailed:{

            CGPoint draggableViewDestination = initialPoint;
            BOOL isNearBottom = _currentDraggableView.layer.frame.origin.y > self.referencingView.bounds.size.height / 2.0f;
            if (isNearBottom) {
                draggableViewDestination = self.referencingViewOverlay.targetPoint;
            }



            POPSpringAnimation *positionAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPosition];
            positionAnimation.dynamicsTension = 5;
            positionAnimation.dynamicsFriction = 5.0f;
            positionAnimation.springBounciness = 20.0f;
            positionAnimation.toValue = [NSValue valueWithCGPoint:draggableViewDestination];
            positionAnimation.completionBlock = ^(POPAnimation *anim, BOOL finished) {
                if (finished) {
                    [UIView animateWithDuration:0.3f animations:^{
                         _currentDraggableView.alpha = 0.0f;
                    } completion:^(BOOL finished) {
                        [_currentDraggableView removeFromSuperview];
                        _currentDraggableView = nil;
                        [self removeReferencingViewOverlay];
                        if (self.completion) {
                            self.completion(isNearBottom);
                        }
                    }];
                }
            };
            [_currentDraggableView.layer pop_addAnimation:positionAnimation forKey:@"positionAnimation"];

            break;
        }
    }
}


@end