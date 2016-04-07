//
//  ViewController.m
//  PopoverDemo
//
//  Created by Arthur Knopper on 16-05-13.
//  Copyright (c) 2013 Arthur Knopper. All rights reserved.
//

#import "ViewController.h"
#import "PopoverViewController.h"
#import "UIColor+BFPaperColors.h"

@interface ViewController () <UIPopoverPresentationControllerDelegate>

//@property (nonatomic,strong) UIPopoverController *popOver;
//@property (nonatomic,retain) UIPopoverPresentationController *popOverP;
@property (nonatomic,retain) PopoverViewController *popVC;
@property (nonatomic) NSInteger projectIndex;
@property (nonatomic) NSInteger caseIndex;
@property (nonatomic) NSInteger sessionIndex;
@property (nonatomic) NSString *sessionTitle;
@property (weak, nonatomic) IBOutlet UIButton *projectButton;
@property (weak, nonatomic) IBOutlet UIButton *caseButton;
@property (weak, nonatomic) IBOutlet UIButton *sessionButton;
@property (nonatomic) IBOutlet BFPaperCheckbox *certCheckbox;
@property (nonatomic) IBOutlet UILabel *paperCheckboxLabel;

- (IBAction)projectPopover:(UIButton *)sender;
- (IBAction)casePopover:(UIButton *)sender;
- (IBAction)sessionPopover:(UIButton *)sender;
- (IBAction)certToggle:(UIButton *)sender;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.certCheckbox.delegate = self;
    
    // For the demo
    // self.projectIndex = 1;
    // self.caseIndex = 14;
    // self.sessionIndex = 10;
    // NSLog(@"Preselections for demo: %ld %ld %ld", (long)self.projectIndex, (long)self.caseIndex, (long)self.sessionIndex);
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
    self.popVC.textFieldEnabled = 0;
    self.popVC.cellNames = [[NSMutableArray alloc] init];
    [self.popVC.cellNames addObject:[NSString stringWithFormat:@"Alpha"]];
    [self.popVC.cellNames addObject:[NSString stringWithFormat:@"Beta"]];
    self.popVC.preferredContentSize = CGSizeMake(280, (self.popVC.cellNames.count<16 ? 41*self.popVC.cellNames.count : 666));
    self.popVC.cellSelected = self.projectIndex;
    NSLog(@"self.popVC.cellSelected %ld", (long)self.popVC.cellSelected);
    self.popVC.delegateid = self;
    
    popNav.modalPresentationStyle = UIModalPresentationPopover;
    popNav.navigationBarHidden = YES;
    self.popOverP = popNav.popoverPresentationController;
    self.popOverP.delegate = self;
    self.popOverP.sourceView = self.projectButton;
    self.popOverP.sourceRect = self.projectButton.bounds;
    self.popOverP.permittedArrowDirections = UIPopoverArrowDirectionRight;

    [self presentViewController:popNav animated:YES completion:nil];
}

- (IBAction)casePopover:(UIButton *)sender {
    self.popVC = [[PopoverViewController alloc] initWithNibName:nil bundle:nil];
    self.popVC.senderButton = @"Case";
    // http://stackoverflow.com/a/26944036
    UINavigationController *popNav = [[UINavigationController alloc] initWithRootViewController:self.popVC];
    self.popVC.preferredContentSize = CGSizeMake(280,450);
    self.popVC.textFieldEnabled = 0;
    self.popVC.cellNames = [[NSMutableArray alloc] init];
    [self.popVC.cellNames addObject:[NSString stringWithFormat:@"Alpha - 1"]];
    [self.popVC.cellNames addObject:[NSString stringWithFormat:@"Alpha - 2"]];
    [self.popVC.cellNames addObject:[NSString stringWithFormat:@"Alpha - 3"]];
    [self.popVC.cellNames addObject:[NSString stringWithFormat:@"Alpha - 4"]];
    [self.popVC.cellNames addObject:[NSString stringWithFormat:@"Alpha - 5"]];
    [self.popVC.cellNames addObject:[NSString stringWithFormat:@"Alpha - 6"]];
    [self.popVC.cellNames addObject:[NSString stringWithFormat:@"Alpha - 7"]];
    [self.popVC.cellNames addObject:[NSString stringWithFormat:@"Alpha - 8"]];
    [self.popVC.cellNames addObject:[NSString stringWithFormat:@"Alpha - 9"]];
    [self.popVC.cellNames addObject:[NSString stringWithFormat:@"Alpha - 10"]];
    [self.popVC.cellNames addObject:[NSString stringWithFormat:@"Alpha - 11"]];
    [self.popVC.cellNames addObject:[NSString stringWithFormat:@"Alpha - 12"]];
    [self.popVC.cellNames addObject:[NSString stringWithFormat:@"Alpha - 13"]];
    [self.popVC.cellNames addObject:[NSString stringWithFormat:@"Alpha - 14"]];
    [self.popVC.cellNames addObject:[NSString stringWithFormat:@"Alpha - 15"]];
    [self.popVC.cellNames addObject:[NSString stringWithFormat:@"Alpha - 16"]];
    [self.popVC.cellNames addObject:[NSString stringWithFormat:@"Alpha - 17"]];
    [self.popVC.cellNames addObject:[NSString stringWithFormat:@"Alpha - 18"]];
    [self.popVC.cellNames addObject:[NSString stringWithFormat:@"Alpha - 19"]];
    [self.popVC.cellNames addObject:[NSString stringWithFormat:@"Alpha - 20"]];
    [self.popVC.cellNames addObject:[NSString stringWithFormat:@"Alpha - 21"]];
    [self.popVC.cellNames addObject:[NSString stringWithFormat:@"Alpha - 22"]];
    [self.popVC.cellNames addObject:[NSString stringWithFormat:@"Alpha - 23"]];
    [self.popVC.cellNames addObject:[NSString stringWithFormat:@"Alpha - 24"]];
    [self.popVC.cellNames addObject:[NSString stringWithFormat:@"Alpha - 25"]];
    [self.popVC.cellNames addObject:[NSString stringWithFormat:@"Alpha - 26"]];
    [self.popVC.cellNames addObject:[NSString stringWithFormat:@"Alpha - 27"]];
    [self.popVC.cellNames addObject:[NSString stringWithFormat:@"Alpha - 28"]];
    [self.popVC.cellNames addObject:[NSString stringWithFormat:@"Alpha - 29"]];
    [self.popVC.cellNames addObject:[NSString stringWithFormat:@"Alpha - 30"]];
    self.popVC.preferredContentSize = CGSizeMake(280, (self.popVC.cellNames.count<16 ? 41*self.popVC.cellNames.count : 666));
    self.popVC.cellSelected = self.caseIndex;
    NSLog(@"self.popVC.cellSelected %ld", (long)self.popVC.cellSelected);
    self.popVC.delegateid = self;
    
    popNav.modalPresentationStyle = UIModalPresentationPopover;
    popNav.navigationBarHidden = YES;
    self.popOverP = popNav.popoverPresentationController;
    self.popOverP.delegate = self;
    self.popOverP.sourceView = self.caseButton;
    self.popOverP.sourceRect = self.caseButton.bounds;
    self.popOverP.permittedArrowDirections = UIPopoverArrowDirectionRight;
    [self presentViewController:popNav animated:YES completion:nil];
}

- (IBAction)sessionPopover:(UIButton *)sender {
    self.popVC = [[PopoverViewController alloc] initWithNibName:nil bundle:nil];
    self.popVC.senderButton = @"Session";
    // http://stackoverflow.com/a/26944036
    UINavigationController *popNav = [[UINavigationController alloc] initWithRootViewController:self.popVC];
    self.popVC.textFieldEnabled = 1;
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
    [self.popVC.cellNames addObject:[NSString stringWithFormat:@"%@", (self.sessionTitle ? self.sessionTitle : @"")]];
    self.popVC.preferredContentSize = CGSizeMake(280, (self.popVC.cellNames.count<16 ? 41*self.popVC.cellNames.count : 666));
    self.popVC.cellSelected = self.sessionIndex;
    NSLog(@"self.popVC.cellSelected %ld", (long)self.popVC.cellSelected);
    self.popVC.delegateid = self;
    
    popNav.modalPresentationStyle = UIModalPresentationPopover;
    popNav.navigationBarHidden = YES;
    self.popOverP = popNav.popoverPresentationController;
    self.popOverP.delegate = self;
    self.popOverP.sourceView = self.sessionButton;
    self.popOverP.sourceRect = self.sessionButton.bounds;
    self.popOverP.permittedArrowDirections = UIPopoverArrowDirectionRight;
    [self presentViewController:popNav animated:YES completion:nil];
}

- (IBAction)certToggle:(UIButton *)sender
{
    BOOL animate = 1;
    // (1) Swap paperCheckbox's state with the 'switchStates...' method:
    [self.certCheckbox switchStatesAnimated:animate];
}

#pragma mark - BFPaperCheckbox Delegate
- (void)paperCheckboxChangedState:(BFPaperCheckbox *)checkbox
{
    NSLog(@"checkbox.tag %ld", (long)checkbox.tag);
    if (checkbox.tag == 1001) {      // First box
        self.paperCheckboxLabel.text = self.certCheckbox.isChecked ? @"[ON]" : @"[OFF]";
    }
    else if (checkbox.tag == 1002) { // Second box
    }
}

#pragma UpdatePresentingViewControllerWithData

-(void)updateViewWithSelectedData:(NSString *)selectedString {
    NSLog(@"Delegate called with string '%@'", selectedString);
    [self updateViewWithChosenData];
    [self dismissViewControllerAnimated:YES completion:nil];
}

# pragma mark - Popover Presentation Controller Delegate

- (void)popoverPresentationControllerDidDismissPopover:(UIPopoverPresentationController *)popoverPresentationController {
    //NSLog(@"called when a Popover is dismissed");
    NSLog(@"dismissed %@, self.popVC.cellSelected = %ld", self.popVC.senderButton, (long)self.popVC.cellSelected);
    [self updateViewWithChosenData];
}

-(void)updateViewWithChosenData {
    UITextField *editableCell = self.popVC.myTextField;
    if ((self.popVC.cellSelected > 0 && self.popVC.cellSelected <= self.popVC.cellNames.count)
        || ([self.popVC.senderButton isEqual: @"Session"] && ![editableCell.text isEqual: @""])) {
        if ([self.popVC.senderButton isEqual: @"Project"]) {
            NSInteger i = self.popVC.cellSelected - 1;
            NSString *s = [NSString stringWithFormat:@"%@", [self.popVC.cellNames objectAtIndex:i]];
            [self.projectButton setTitle:s forState:UIControlStateNormal];
            self.projectIndex = i + 1;
            NSLog(@"projectButton := %@ (row %ld)", s, (long)i);
        }
        if ([self.popVC.senderButton isEqual: @"Case"]) {
            NSInteger i = self.popVC.cellSelected - 1;
            NSString *s = [NSString stringWithFormat:@"%@", [self.popVC.cellNames objectAtIndex:i]];
            [self.caseButton setTitle:s forState:UIControlStateNormal];
            self.caseIndex = i + 1;
            NSLog(@"caseButton := %@ (row %ld)", s, (long)i);
        }
        if ([self.popVC.senderButton  isEqual: @"Session"]) {
            NSLog(@"editableCell %@", editableCell.text);
            NSInteger i;
            NSString *s;
            if (editableCell.text && ![editableCell.text isEqual: @""]) {
                i = self.popVC.cellNames.count - 1;
                s = editableCell.text;
                self.sessionTitle = s;
            } else {
                i = self.popVC.cellSelected - 1;
                s = [NSString stringWithFormat:@"%@", [self.popVC.cellNames objectAtIndex:i]];
            }
            [self.sessionButton setTitle:s forState:UIControlStateNormal];
            self.sessionIndex = i + 1;
            NSLog(@"sessionButton := %@ (row %ld)", s, (long)i);
        }
    }
}

- (BOOL)popoverPresentationControllerShouldDismissPopover:(UIPopoverPresentationController *)popoverPresentationController {
    //NSLog(@"return if a Popover should (not) dismissed");
    NSLog(@"should (or not) dismiss %@, self.popVC.cellSelected = %ld", self.popVC.senderButton, (long)self.popVC.cellSelected);
    
    // return YES if the Popover should be dismissed
    // return NO if the Popover should not be dismissed
    return YES;
}

- (void)popoverPresentationController:(UIPopoverPresentationController *)popoverPresentationController willRepositionPopoverToRect:(inout CGRect *)rect inView:(inout UIView *__autoreleasing  _Nonnull *)view {
    NSLog(@"called when the Popover changes position");
    NSLog(@"self.popVC.cellSelected %ld", (long)self.popVC.cellSelected);
}

@end
