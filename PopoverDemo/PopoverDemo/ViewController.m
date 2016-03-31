//
//  ViewController.m
//  PopoverDemo
//
//  Created by Arthur Knopper on 16-05-13.
//  Copyright (c) 2013 Arthur Knopper. All rights reserved.
//

#import "ViewController.h"
#import "PopoverViewController.h"

@interface ViewController ()

//@property (nonatomic,strong) UIPopoverController *popOver;
@property (nonatomic,retain) UIPopoverPresentationController *popOverP;

- (IBAction)projectPopover:(UIButton *)sender;
- (IBAction)casePopover:(UIButton *)sender;
- (IBAction)sessionPopover:(UIButton *)sender;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)projectPopover:(UIButton *)sender {
    
    PopoverViewController *popVC =[[PopoverViewController alloc] initWithNibName:nil bundle:nil];
    // http://stackoverflow.com/a/26944036
    UINavigationController *popNav = [[UINavigationController alloc] initWithRootViewController:popVC];
    popVC.preferredContentSize = CGSizeMake(280,450);
    popVC.cellNames = [[NSMutableArray alloc] init];
    [popVC.cellNames addObject:[NSString stringWithFormat:@"Project Alpha"]];
    [popVC.cellNames addObject:[NSString stringWithFormat:@"Project Beta"]];
    
    popNav.modalPresentationStyle = UIModalPresentationPopover;
    popNav.navigationBarHidden = YES;
    _popOverP = popNav.popoverPresentationController;
    //_popOverP.delegate = self;
    _popOverP.sourceView = self.view;
    _popOverP.sourceRect = sender.frame;
    _popOverP.permittedArrowDirections = UIPopoverArrowDirectionUp;
    [self presentViewController:popNav animated:YES completion:nil];
}

- (IBAction)casePopover:(UIButton *)sender {
    PopoverViewController *popVC =[[PopoverViewController alloc] initWithNibName:nil bundle:nil];
    // http://stackoverflow.com/a/26944036
    UINavigationController *popNav = [[UINavigationController alloc] initWithRootViewController:popVC];
    popVC.preferredContentSize = CGSizeMake(280,450);
    popVC.cellNames = [[NSMutableArray alloc] init];
    [popVC.cellNames addObject:[NSString stringWithFormat:@"Case Alpha - 1"]];
    [popVC.cellNames addObject:[NSString stringWithFormat:@"Case Alpha - 2"]];
    [popVC.cellNames addObject:[NSString stringWithFormat:@"Case Beta - 1"]];
    [popVC.cellNames addObject:[NSString stringWithFormat:@"Case Beta - 2"]];
    [popVC.cellNames addObject:[NSString stringWithFormat:@"Case Beta - 3"]];
    popNav.modalPresentationStyle = UIModalPresentationPopover;
    popNav.navigationBarHidden = YES;
    _popOverP = popNav.popoverPresentationController;
    //_popOverP.delegate = self;
    _popOverP.sourceView = self.view;
    _popOverP.sourceRect = sender.frame;
    _popOverP.permittedArrowDirections = UIPopoverArrowDirectionUp;
    [self presentViewController:popNav animated:YES completion:nil];
}

- (IBAction)sessionPopover:(UIButton *)sender {
    PopoverViewController *popVC =[[PopoverViewController alloc] initWithNibName:nil bundle:nil];
    // http://stackoverflow.com/a/26944036
    UINavigationController *popNav = [[UINavigationController alloc] initWithRootViewController:popVC];
    popVC.preferredContentSize = CGSizeMake(280,450);
    popVC.cellNames = [[NSMutableArray alloc] init];
    [popVC.cellNames addObject:[NSString stringWithFormat:@"Session 1"]];
    [popVC.cellNames addObject:[NSString stringWithFormat:@"Session 2"]];
    popNav.modalPresentationStyle = UIModalPresentationPopover;
    popNav.navigationBarHidden = YES;
    _popOverP = popNav.popoverPresentationController;
    //_popOverP.delegate = self;
    _popOverP.sourceView = self.view;
    _popOverP.sourceRect = sender.frame;
    _popOverP.permittedArrowDirections = UIPopoverArrowDirectionDown;
    [self presentViewController:popNav animated:YES completion:nil];
}

@end
