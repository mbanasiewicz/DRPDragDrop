//
//  DRPViewController.m
//  DragDrop
//
//  Created by Maciej Banasiewicz on 18/06/14.
//  Copyright (c) 2014 Maciej. All rights reserved.
//

#import "DRPViewController.h"
#import "DRPTableViewCell.h"
#import "DRPDraggableImageView.h"
#import "DRPDragActionController.h"
#import "DRPOverlayView.h"

@interface DRPViewController () <UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) DRPDragActionController *dragActionController;
@end

@implementation DRPViewController

- (void)loadView {
    [super loadView];
    self.tableView = [[UITableView alloc] init];
    self.tableView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:self.tableView];
}

- (void)updateViewConstraints {
    [super updateViewConstraints];
    NSArray *xConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_tableView]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_tableView)];
    NSArray *yConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_tableView]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_tableView)];
    [self.view addConstraints:xConstraints];
    [self.view addConstraints:yConstraints];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.tableView registerClass:DRPTableViewCell.class forCellReuseIdentifier:DRPTableViewCellReuseIdentifier];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;

    DRPOverlayView *referencingViewOverlay = [[DRPOverlayView alloc] initWithImage:[UIImage imageNamed:@"DragDropGem"]];
    referencingViewOverlay.backgroundColor = [UIColor colorWithWhite:0.5f alpha:0.6f];
    
    self.dragActionController = [[DRPDragActionController alloc] init];
    self.dragActionController.referencingView = [[[UIApplication sharedApplication] windows] objectAtIndex:0];
    self.dragActionController.referencingViewOverlay = referencingViewOverlay;
    self.dragActionController.completion = ^(BOOL didSelect, NSDictionary *customData) {
        NSLog(@"didSelect = %d", didSelect);
        NSLog(@"%@", customData);
    };
    self.dragActionController.viewOffset = CGPointMake(-5, 0);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DRPTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:DRPTableViewCellReuseIdentifier forIndexPath:indexPath];
    UIImage *image = [UIImage imageNamed:@"535972-418x500.jpg"];
    NSLog(@"image = %@", image);
    cell.cellImageView.image = image;
    cell.cellImageView.customData = @{@"A": @"B"};
    cell.cellImageView.dragActionController = self.dragActionController;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100.0f;
}


@end
