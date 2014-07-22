//
//  DRPOverlayView.m
//  DragDrop
//
//  Created by Maciej Banasiewicz on 18/06/14.
//  Copyright (c) 2014 Maciej. All rights reserved.
//

#import "DRPOverlayView.h"

@implementation DRPOverlayView
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.imageView = [[UIImageView alloc] init];
        self.imageView.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:self.imageView];

        self.overlayCopyLabel = [[UILabel alloc] init];
        self.overlayCopyLabel.preferredMaxLayoutWidth = 200.0f;
        self.overlayCopyLabel.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:self.overlayCopyLabel];

    }
    return self;
}

- (void)updateConstraints {
    [super updateConstraints];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_overlayCopyLabel]-(10)-[_imageView]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_overlayCopyLabel, _imageView)]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:_overlayCopyLabel attribute:NSLayoutAttributeCenterX multiplier:1.0f constant:0.0f]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[_imageView(60)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_imageView)]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:_imageView attribute:NSLayoutAttributeCenterX multiplier:1.0f constant:0.0f]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_imageView(50)]-(10)-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_imageView)]];
}
@end
