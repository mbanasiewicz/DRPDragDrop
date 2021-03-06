//
//  StyleKitName.m
//  ProjectName
//
//  Created by AuthorName on 18/06/14.
//  Copyright (c) 2014 CompanyName. All rights reserved.
//
//  Generated by PaintCode (www.paintcodeapp.com)
//

#import "StyleKitName.h"


@implementation StyleKitName

#pragma mark Initialization

+ (void)initialize
{
}

#pragma mark Drawing Methods

+ (void)drawCanvas1;
{
    //// Color Declarations
    UIColor* color = [UIColor colorWithRed: 0.796 green: 0.114 blue: 0.969 alpha: 1];

    //// InnerCircle Drawing
    UIBezierPath* innerCirclePath = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(6, 6, 54, 54)];
    [color setStroke];
    innerCirclePath.lineWidth = 3;
    [innerCirclePath stroke];


    //// OuterCircle Drawing
    UIBezierPath* outerCirclePath = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(4, 4, 57.5, 57.5)];
    [UIColor.whiteColor setStroke];
    outerCirclePath.lineWidth = 3;
    [outerCirclePath stroke];
}

@end
