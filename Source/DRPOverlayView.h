//
//  DRPOverlayView.h
//  DragDrop
//
//  Created by Maciej Banasiewicz on 18/06/14.
//  Copyright (c) 2014 Maciej. All rights reserved.
//



@interface DRPOverlayView : UIView
@property (strong, nonatomic) UIImageView *imageView;
- (instancetype)initWithImage:(UIImage *)image;
- (CGPoint)targetPoint;
@end
