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
    popVC.cellNames = [[NSMutableArray alloc] init];
    [popVC.cellNames addObject:[NSString stringWithFormat:@"Project Alpha"]];
    [popVC.cellNames addObject:[NSString stringWithFormat:@"Project Beta"]];
    popVC.preferredContentSize = CGSizeMake(280, (popVC.cellNames.count<10 ? 45*popVC.cellNames.count : 450));
    
    popNav.modalPresentationStyle = UIModalPresentationPopover;
    popNav.navigationBarHidden = YES;
    _popOverP = popNav.popoverPresentationController;
    //_popOverP.delegate = self;
    _popOverP.sourceView = self.view;
    _popOverP.sourceRect = sender.frame;
    _popOverP.permittedArrowDirections = UIPopoverArrowDirectionDown;
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
    [popVC.cellNames addObject:[NSString stringWithFormat:@"Case Alpha - 3"]];
    [popVC.cellNames addObject:[NSString stringWithFormat:@"Case Alpha - 4"]];
    [popVC.cellNames addObject:[NSString stringWithFormat:@"Case Alpha - 5"]];
    [popVC.cellNames addObject:[NSString stringWithFormat:@"Case Alpha - 6"]];
    [popVC.cellNames addObject:[NSString stringWithFormat:@"Case Alpha - 7"]];
    [popVC.cellNames addObject:[NSString stringWithFormat:@"Case Alpha - 8"]];
    [popVC.cellNames addObject:[NSString stringWithFormat:@"Case Alpha - 9"]];
    [popVC.cellNames addObject:[NSString stringWithFormat:@"Case Alpha - 10"]];
    [popVC.cellNames addObject:[NSString stringWithFormat:@"Case Alpha - 11"]];
    [popVC.cellNames addObject:[NSString stringWithFormat:@"Case Alpha - 12"]];
    [popVC.cellNames addObject:[NSString stringWithFormat:@"Case Alpha - 13"]];
    [popVC.cellNames addObject:[NSString stringWithFormat:@"Case Alpha - 14"]];
    [popVC.cellNames addObject:[NSString stringWithFormat:@"Case Alpha - 15"]];
    [popVC.cellNames addObject:[NSString stringWithFormat:@"Case Alpha - 16"]];
    [popVC.cellNames addObject:[NSString stringWithFormat:@"Case Alpha - 17"]];
    [popVC.cellNames addObject:[NSString stringWithFormat:@"Case Alpha - 18"]];
    [popVC.cellNames addObject:[NSString stringWithFormat:@"Case Alpha - 19"]];
    [popVC.cellNames addObject:[NSString stringWithFormat:@"Case Alpha - 20"]];
    [popVC.cellNames addObject:[NSString stringWithFormat:@"Case Alpha - 21"]];
    [popVC.cellNames addObject:[NSString stringWithFormat:@"Case Alpha - 22"]];
    [popVC.cellNames addObject:[NSString stringWithFormat:@"Case Alpha - 23"]];
    [popVC.cellNames addObject:[NSString stringWithFormat:@"Case Alpha - 24"]];
    [popVC.cellNames addObject:[NSString stringWithFormat:@"Case Alpha - 25"]];
    [popVC.cellNames addObject:[NSString stringWithFormat:@"Case Alpha - 26"]];
    [popVC.cellNames addObject:[NSString stringWithFormat:@"Case Alpha - 27"]];
    [popVC.cellNames addObject:[NSString stringWithFormat:@"Case Alpha - 28"]];
    [popVC.cellNames addObject:[NSString stringWithFormat:@"Case Alpha - 29"]];
    [popVC.cellNames addObject:[NSString stringWithFormat:@"Case Alpha - 30"]];
    popVC.preferredContentSize = CGSizeMake(280, (popVC.cellNames.count<10 ? 45*popVC.cellNames.count : 450));
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
    popVC.cellNames = [[NSMutableArray alloc] init];
    [popVC.cellNames addObject:[NSString stringWithFormat:@"Session 1"]];
    [popVC.cellNames addObject:[NSString stringWithFormat:@"Session 2"]];
    [popVC.cellNames addObject:[NSString stringWithFormat:@"Session 3"]];
    [popVC.cellNames addObject:[NSString stringWithFormat:@"Session 4"]];
    [popVC.cellNames addObject:[NSString stringWithFormat:@"Session 5"]];
    [popVC.cellNames addObject:[NSString stringWithFormat:@"Session 6"]];
    [popVC.cellNames addObject:[NSString stringWithFormat:@"Session 7"]];
    [popVC.cellNames addObject:[NSString stringWithFormat:@"Session 8"]];
    [popVC.cellNames addObject:[NSString stringWithFormat:@"Session 9"]];
    [popVC.cellNames addObject:[NSString stringWithFormat:@"Session 10"]];
    [popVC.cellNames addObject:[NSString stringWithFormat:@"Session 11"]];
    [popVC.cellNames addObject:[NSString stringWithFormat:@"Session 12"]];
    [popVC.cellNames addObject:[NSString stringWithFormat:@"Please rename me"]];
    popVC.preferredContentSize = CGSizeMake(280, (popVC.cellNames.count<10 ? 45*popVC.cellNames.count : 450));
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
