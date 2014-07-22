//
//  DRPOverlayView.m
//  DragDrop
//
//  Created by Maciej Banasiewicz on 18/06/14.
//  Copyright (c) 2014 Maciej. All rights reserved.
//

#import "DRPOverlayView.h"

@implementation DRPOverlayView
- (instancetype)initWithImage:(UIImage *)image {
    if (self = [super init]) {
        self.imageView = [[UIImageView alloc] initWithImage:image];
        self.imageView.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:self.imageView];
        self.translatesAutoresizingMaskIntoConstraints = NO;
        self.alpha = 0;
    }
    return self;
}

- (void)updateConstraints {
    [super updateConstraints];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_imageView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1.0f constant:0.0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_imageView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1.0f constant:-50.0]];
}

- (CGPoint)targetPoint {
    return self.imageView.center;
}
@end
