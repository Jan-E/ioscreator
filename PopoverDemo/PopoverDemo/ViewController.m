//
//  ViewController.m
//  PopoverDemo
//
//  Created by Arthur Knopper on 16-05-13.
//  Copyright (c) 2013 Arthur Knopper. All rights reserved.
//

#import "ViewController.h"
#import "PopoverViewController.h"

@interface ViewController () <UIPopoverPresentationControllerDelegate>

//@property (nonatomic,strong) UIPopoverController *popOver;
@property (nonatomic,retain) UIPopoverPresentationController *popOverP;
@property (nonatomic,retain) PopoverViewController *popVC;
@property (weak, nonatomic) IBOutlet UIButton *projectButton;
@property (weak, nonatomic) IBOutlet UIButton *caseButton;
@property (weak, nonatomic) IBOutlet UIButton *sessionButton;

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
    self.popVC = [[PopoverViewController alloc] initWithNibName:nil bundle:nil];
    self.popVC.senderButton = @"Project";
    // http://stackoverflow.com/a/26944036
    UINavigationController *popNav = [[UINavigationController alloc] initWithRootViewController:self.popVC];
    self.popVC.cellNames = [[NSMutableArray alloc] init];
    [self.popVC.cellNames addObject:[NSString stringWithFormat:@"Project Alpha"]];
    [self.popVC.cellNames addObject:[NSString stringWithFormat:@"Project Beta"]];
    self.popVC.preferredContentSize = CGSizeMake(280, (self.popVC.cellNames.count<10 ? 45*self.popVC.cellNames.count : 450));
    NSLog(@"self.popVC.cellSelected %ld", (long)self.popVC.cellSelected);
    self.popVC.cellSelected = 1;
    
    popNav.modalPresentationStyle = UIModalPresentationPopover;
    popNav.navigationBarHidden = YES;
    self.popOverP = popNav.popoverPresentationController;
    self.popOverP.delegate = self;
    self.popOverP.sourceView = self.view;
    self.popOverP.sourceRect = sender.frame;
    self.popOverP.permittedArrowDirections = UIPopoverArrowDirectionDown;
    [self presentViewController:popNav animated:YES completion:nil];
}

- (IBAction)casePopover:(UIButton *)sender {
    self.popVC = [[PopoverViewController alloc] initWithNibName:nil bundle:nil];
    self.popVC.senderButton = @"Case";
    // http://stackoverflow.com/a/26944036
    UINavigationController *popNav = [[UINavigationController alloc] initWithRootViewController:self.popVC];
    self.popVC.preferredContentSize = CGSizeMake(280,450);
    self.popVC.cellNames = [[NSMutableArray alloc] init];
    [self.popVC.cellNames addObject:[NSString stringWithFormat:@"Case Alpha - 1"]];
    [self.popVC.cellNames addObject:[NSString stringWithFormat:@"Case Alpha - 2"]];
    [self.popVC.cellNames addObject:[NSString stringWithFormat:@"Case Alpha - 3"]];
    [self.popVC.cellNames addObject:[NSString stringWithFormat:@"Case Alpha - 4"]];
    [self.popVC.cellNames addObject:[NSString stringWithFormat:@"Case Alpha - 5"]];
    [self.popVC.cellNames addObject:[NSString stringWithFormat:@"Case Alpha - 6"]];
    [self.popVC.cellNames addObject:[NSString stringWithFormat:@"Case Alpha - 7"]];
    [self.popVC.cellNames addObject:[NSString stringWithFormat:@"Case Alpha - 8"]];
    [self.popVC.cellNames addObject:[NSString stringWithFormat:@"Case Alpha - 9"]];
    [self.popVC.cellNames addObject:[NSString stringWithFormat:@"Case Alpha - 10"]];
    [self.popVC.cellNames addObject:[NSString stringWithFormat:@"Case Alpha - 11"]];
    [self.popVC.cellNames addObject:[NSString stringWithFormat:@"Case Alpha - 12"]];
    [self.popVC.cellNames addObject:[NSString stringWithFormat:@"Case Alpha - 13"]];
    [self.popVC.cellNames addObject:[NSString stringWithFormat:@"Case Alpha - 14"]];
    [self.popVC.cellNames addObject:[NSString stringWithFormat:@"Case Alpha - 15"]];
    [self.popVC.cellNames addObject:[NSString stringWithFormat:@"Case Alpha - 16"]];
    [self.popVC.cellNames addObject:[NSString stringWithFormat:@"Case Alpha - 17"]];
    [self.popVC.cellNames addObject:[NSString stringWithFormat:@"Case Alpha - 18"]];
    [self.popVC.cellNames addObject:[NSString stringWithFormat:@"Case Alpha - 19"]];
    [self.popVC.cellNames addObject:[NSString stringWithFormat:@"Case Alpha - 20"]];
    [self.popVC.cellNames addObject:[NSString stringWithFormat:@"Case Alpha - 21"]];
    [self.popVC.cellNames addObject:[NSString stringWithFormat:@"Case Alpha - 22"]];
    [self.popVC.cellNames addObject:[NSString stringWithFormat:@"Case Alpha - 23"]];
    [self.popVC.cellNames addObject:[NSString stringWithFormat:@"Case Alpha - 24"]];
    [self.popVC.cellNames addObject:[NSString stringWithFormat:@"Case Alpha - 25"]];
    [self.popVC.cellNames addObject:[NSString stringWithFormat:@"Case Alpha - 26"]];
    [self.popVC.cellNames addObject:[NSString stringWithFormat:@"Case Alpha - 27"]];
    [self.popVC.cellNames addObject:[NSString stringWithFormat:@"Case Alpha - 28"]];
    [self.popVC.cellNames addObject:[NSString stringWithFormat:@"Case Alpha - 29"]];
    [self.popVC.cellNames addObject:[NSString stringWithFormat:@"Case Alpha - 30"]];
    self.popVC.preferredContentSize = CGSizeMake(280, (self.popVC.cellNames.count<10 ? 45*self.popVC.cellNames.count : 450));
    NSLog(@"self.popVC.cellSelected %ld", (long)self.popVC.cellSelected);
    self.popVC.cellSelected = 14;
    popNav.modalPresentationStyle = UIModalPresentationPopover;
    popNav.navigationBarHidden = YES;
    self.popOverP = popNav.popoverPresentationController;
    self.popOverP.delegate = self;
    self.popOverP.sourceView = self.view;
    self.popOverP.sourceRect = sender.frame;
    self.popOverP.permittedArrowDirections = UIPopoverArrowDirectionUp;
    [self presentViewController:popNav animated:YES completion:nil];
}

- (IBAction)sessionPopover:(UIButton *)sender {
    self.popVC = [[PopoverViewController alloc] initWithNibName:nil bundle:nil];
    self.popVC.senderButton = @"Session";
    // http://stackoverflow.com/a/26944036
    UINavigationController *popNav = [[UINavigationController alloc] initWithRootViewController:self.popVC];
    NSLog(@"self.popVC.cellSelected %ld", (long)self.popVC.cellSelected);
    self.popVC.cellNames = [[NSMutableArray alloc] init];
    [self.popVC.cellNames addObject:[NSString stringWithFormat:@"Session 1"]];
    [self.popVC.cellNames addObject:[NSString stringWithFormat:@"Session 2"]];
    [self.popVC.cellNames addObject:[NSString stringWithFormat:@"Session 3"]];
    [self.popVC.cellNames addObject:[NSString stringWithFormat:@"Session 4"]];
    [self.popVC.cellNames addObject:[NSString stringWithFormat:@"Session 5"]];
    [self.popVC.cellNames addObject:[NSString stringWithFormat:@"Session 6"]];
    [self.popVC.cellNames addObject:[NSString stringWithFormat:@"Session 7"]];
    [self.popVC.cellNames addObject:[NSString stringWithFormat:@"Session 8"]];
    [self.popVC.cellNames addObject:[NSString stringWithFormat:@"Session 9"]];
    [self.popVC.cellNames addObject:[NSString stringWithFormat:@"Session 10"]];
    [self.popVC.cellNames addObject:[NSString stringWithFormat:@"Session 11"]];
    [self.popVC.cellNames addObject:[NSString stringWithFormat:@"Session 12"]];
    [self.popVC.cellNames addObject:[NSString stringWithFormat:@"Please rename me"]];
    self.popVC.preferredContentSize = CGSizeMake(280, (self.popVC.cellNames.count<10 ? 45*self.popVC.cellNames.count : 450));
    popNav.modalPresentationStyle = UIModalPresentationPopover;
    popNav.navigationBarHidden = YES;
    self.popOverP = popNav.popoverPresentationController;
    self.popOverP.delegate = self;
    self.popOverP.sourceView = self.view;
    self.popOverP.sourceRect = sender.frame;
    self.popOverP.permittedArrowDirections = UIPopoverArrowDirectionDown;
    [self presentViewController:popNav animated:YES completion:nil];
}

# pragma mark - Popover Presentation Controller Delegate

- (void)popoverPresentationControllerDidDismissPopover:(UIPopoverPresentationController *)popoverPresentationController {
    //NSLog(@"called when a Popover is dismissed");
    NSLog(@"dismissed - self.popVC.cellSelected %ld %@", (long)self.popVC.cellSelected, self.popVC.senderButton);
    UITextField *editableCell = self.popVC.myTextField;
    if (self.popVC.cellSelected > 0 || ![editableCell.text isEqual: @""]) {
        if ([self.popVC.senderButton isEqual: @"Project"]) {
            NSInteger i = self.popVC.cellSelected - 1;
            NSString *s = [NSString stringWithFormat:@"%@", [self.popVC.cellNames objectAtIndex:i]];
            [self.projectButton setTitle:s forState:UIControlStateNormal];
            NSLog(@"projectButton %ld %@", (long)i, s);
        }
        if ([self.popVC.senderButton isEqual: @"Case"]) {
            NSInteger i = self.popVC.cellSelected - 1;
            NSString *s = [NSString stringWithFormat:@"%@", [self.popVC.cellNames objectAtIndex:i]];
            [self.caseButton setTitle:s forState:UIControlStateNormal];
            NSLog(@"caseButton %ld %@", (long)i, s);
        }
        if ([self.popVC.senderButton  isEqual: @"Session"]) {
            NSLog(@"editableCell %@", editableCell.text);
            NSInteger i;
            NSString *s;
            if (editableCell.text && ![editableCell.text isEqual: @""]) {
                i = self.popVC.cellNames.count - 1;
                s = editableCell.text;
            } else {
                i = self.popVC.cellSelected - 1;
                s = [NSString stringWithFormat:@"%@", [self.popVC.cellNames objectAtIndex:i]];
            }
            [self.sessionButton setTitle:s forState:UIControlStateNormal];
            NSLog(@"sessionButton %ld %@", (long)i, s);
        }
    }
}

- (BOOL)popoverPresentationControllerShouldDismissPopover:(UIPopoverPresentationController *)popoverPresentationController {
    //NSLog(@"return if a Popover should (not) dismissed");
    NSLog(@"should dismiss - self.popVC.cellSelected %ld", (long)self.popVC.cellSelected);
    
    // return YES if the Popover should be dismissed
    // return NO if the Popover should not be dismissed
    return YES;
}

- (void)popoverPresentationController:(UIPopoverPresentationController *)popoverPresentationController willRepositionPopoverToRect:(inout CGRect *)rect inView:(inout UIView *__autoreleasing  _Nonnull *)view {
    NSLog(@"called when the Popover changes position");
    NSLog(@"self.popVC.cellSelected %ld", (long)self.popVC.cellSelected);
}

@end
