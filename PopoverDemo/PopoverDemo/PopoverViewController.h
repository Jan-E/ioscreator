//
//  PopoverViewController.h
//  PopoverDemo
//
//  Created by Arthur Knopper on 16-05-13.
//  Copyright (c) 2013 Arthur Knopper. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PopoverViewController : UITableViewController
@property (nonatomic, strong) NSMutableArray *cellNames;
@property (nonatomic) NSInteger cellSelected;

@end
