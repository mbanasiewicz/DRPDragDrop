//
// Created by Maciej Banasiewicz on 18/06/14.
// Copyright (c) 2014 Maciej. All rights reserved.
//

#import "DRPTableViewCell.h"
#import "DRPDraggableImageView.h"


@implementation DRPTableViewCell {

}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.cellImageView = [[DRPDraggableImageView alloc] initWithFrame:self.contentView.bounds];
        self.cellImageView.translatesAutoresizingMaskIntoConstraints = NO;
        self.cellImageView.contentMode = UIViewContentModeScaleAspectFit;
        [self.contentView addSubview:self.cellImageView];
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_cellImageView]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_cellImageView)]];
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_cellImageView]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_cellImageView)]];
        NSLog(@"self.contentView = %@", self.contentView);
    }
    return self;
}


- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        NSLog(@"%s", sel_getName(_cmd));

    }
    return self;
}

- (id)init {
    if (self = [super init]) {
        NSLog(@"%s", sel_getName(_cmd));
    }
    return self;
}

- (NSString *)reuseIdentifier {
    return DRPTableViewCellReuseIdentifier;
}
@end