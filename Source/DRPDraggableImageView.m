//
// Created by Maciej Banasiewicz on 18/06/14.
// Copyright (c) 2014 Maciej. All rights reserved.
//

#import "DRPDraggableImageView.h"
#import "DRPDragActionController.h"


@interface DRPDraggableImageView () <UIGestureRecognizerDelegate>
@property (strong, nonatomic) UILongPressGestureRecognizer *longPressGestureRecognizer;
@end
@implementation DRPDraggableImageView {
    
}

- (id)initWithImage:(UIImage *)image {
    if (self = [super init]) {
        [self setup];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}

- (id)init {
    if (self = [super init]) {
        [self setup];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setup];
}

- (void)setup {
    self.userInteractionEnabled = YES;
    // Long press to detect it
    self.longPressGestureRecognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(onLongPressGestureRecognized:)];
    self.longPressGestureRecognizer.delegate = self;
    [self addGestureRecognizer:self.longPressGestureRecognizer];
}

- (void)onLongPressGestureRecognized:(UILongPressGestureRecognizer *)longPressGestureRecognizer  {
    if (self.dragActionController) {
        [self.dragActionController didPressImageView:longPressGestureRecognizer];
    }
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    return YES;
}

@end