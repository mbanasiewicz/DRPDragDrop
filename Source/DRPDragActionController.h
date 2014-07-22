//
// Created by Maciej Banasiewicz on 18/06/14.
// Copyright (c) 2014 Maciej. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DRPDraggableImageView;


typedef void (^DRPDragActionControllerCompletion)(BOOL didSelect);
@interface DRPDragActionController : NSObject
@property (weak, nonatomic) UIView *referencingView;
@property (nonatomic) CGPoint viewOffset;
@property (strong, nonatomic) DRPDragActionControllerCompletion completion;
- (void)didPressImageView:(UILongPressGestureRecognizer *)longPressGestureRecognizer;
@end