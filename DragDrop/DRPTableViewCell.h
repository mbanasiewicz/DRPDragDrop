//
// Created by Maciej Banasiewicz on 18/06/14.
// Copyright (c) 2014 Maciej. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DRPDraggableImageView;

static NSString *DRPTableViewCellReuseIdentifier = @"DRPTableViewCellReuseIdentifier";
@interface DRPTableViewCell : UITableViewCell
@property (strong, nonatomic) DRPDraggableImageView *cellImageView;
@end