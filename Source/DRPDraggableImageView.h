//
// Created by Maciej Banasiewicz on 18/06/14.
// Copyright (c) 2014 Maciej. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DRPDragActionController;


@interface DRPDraggableImageView : UIImageView
@property (weak, nonatomic) DRPDragActionController *dragActionController;
@end