//
//  PopoverViewController.h
//  PopoverDemo
//
//  Created by Arthur Knopper on 16-05-13.
//  Copyright (c) 2013 Arthur Knopper. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol UpdatePresentingViewControllerWithData <NSObject>

-(void)updateViewWithSelectedData:(NSString *)selectedString;
-(void)updateViewWithChosenData;

@end

@interface PopoverViewController : UITableViewController <UITextFieldDelegate>

@property (nonatomic, strong) NSMutableArray *cellNames;
@property (nonatomic, strong) NSString *senderButton;
@property (nonatomic) NSInteger cellSelected;
@property (nonatomic) NSInteger textFieldEnabled;
@property (nonatomic) UITextField *myTextField;
@property (nonatomic) NSInteger textFieldLoaded;
@property (nonatomic, assign) id<UpdatePresentingViewControllerWithData> delegateid;

@end
