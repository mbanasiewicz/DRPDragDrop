//
// Created by Maciej Banasiewicz on 18/06/14.
// Copyright (c) 2014 Maciej. All rights reserved.
//

#import "DRPDraggableView.h"


@implementation DRPDraggableView
- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _imageView = [[UIImageView alloc] initWithFrame:self.bounds];
        [self addSubview:_imageView];
    }
    return self;
}



- (void)drawRect:(CGRect)frame {

    //// Color Declarations
    UIColor* color = [UIColor colorWithRed: 0.796 green: 0.114 blue: 0.969 alpha: 1];


    //// Subframes
    CGRect group = CGRectMake(CGRectGetMinX(frame) + 4, CGRectGetMinY(frame) + 4, CGRectGetWidth(frame) - 8.5, CGRectGetHeight(frame) - 8.5);


    //// Group
    {
        //// InnerCircle Drawing
        UIBezierPath* innerCirclePath = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(CGRectGetMinX(group) + floor(CGRectGetWidth(group) * 0.03478 + 0.5), CGRectGetMinY(group) + floor(CGRectGetHeight(group) * 0.03478) + 0.5, floor(CGRectGetWidth(group) * 0.97391 + 0.5) - floor(CGRectGetWidth(group) * 0.03478 + 0.5), floor(CGRectGetHeight(group) * 0.97391) - floor(CGRectGetHeight(group) * 0.03478))];
        [color setStroke];
        innerCirclePath.lineWidth = 3;
        [innerCirclePath stroke];


        //// OuterCircle Drawing
        UIBezierPath* outerCirclePath = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(CGRectGetMinX(group) + floor(CGRectGetWidth(group) * 0.00000 + 0.5), CGRectGetMinY(group) + floor(CGRectGetHeight(group) * 0.00000 + 0.5), floor(CGRectGetWidth(group) * 1.00000) - floor(CGRectGetWidth(group) * 0.00000 + 0.5) + 0.5, floor(CGRectGetHeight(group) * 1.00000) - floor(CGRectGetHeight(group) * 0.00000 + 0.5) + 0.5)];
        [UIColor.whiteColor setStroke];
        outerCirclePath.lineWidth = 3;
        [outerCirclePath stroke];

        CAShapeLayer *maskLayer = [CAShapeLayer layer];
        maskLayer.path = innerCirclePath.CGPath;
        _imageView.layer.mask = maskLayer;
    }



}
@end