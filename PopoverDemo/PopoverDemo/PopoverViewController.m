//
//  PopoverViewController.m
//  PopoverDemo
//
//  Created by Arthur Knopper on 16-05-13.
//  Copyright (c) 2013 Arthur Knopper. All rights reserved.
//

#import "PopoverViewController.h"

@interface PopoverViewController ()

@end

@implementation PopoverViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // registerClass http://stackoverflow.com/a/25835438
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"editableCell"];
    self.tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    
    // Uncomment the following line to preserve selection between presentations.
    self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.myTextField = [[UITextField alloc] initWithFrame:CGRectMake(0,0,self.preferredContentSize.width-32,45)];
    self.myTextField.adjustsFontSizeToFitWidth = NO;
    self.myTextField.backgroundColor = [UIColor colorWithRed:1.000 green:1.000 blue:0.666 alpha:0.3];
    self.myTextField.autocorrectionType = UITextAutocorrectionTypeNo;
    self.myTextField.autocapitalizationType = UITextAutocapitalizationTypeWords;
    self.myTextField.keyboardType = UIKeyboardTypeDefault;
    self.myTextField.returnKeyType = UIReturnKeyDone;
    self.myTextField.clearButtonMode = UITextFieldViewModeNever;
    self.myTextField.placeholder = @"Enter text here";
    self.myTextField.text = [NSString stringWithFormat:@"%@", [self.cellNames objectAtIndex:(self.cellNames.count-1)]];
    //self.myTextField.delegate = self;
    
    //NSLog(@"self %@, tV %@, tV.del %@", self, self.tableView, self.tableView.delegate);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated
{
    if (self.cellSelected > 0) {
        NSInteger i = self.cellSelected - 1;
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:i inSection:0];
        [self.tableView selectRowAtIndexPath:indexPath animated:YES scrollPosition:UITableViewScrollPositionNone];
        [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:i inSection:0] atScrollPosition:UITableViewScrollPositionMiddle animated:YES];
        NSLog(@"scrollToRowAtIndexPath %ld", (long)i);
    }
    int64_t delayInSeconds = 1;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [self.tableView flashScrollIndicators];
    });
}

- (void)dismissMe {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.cellNames.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //NSLog(@"indexPath.section = %d, indexPath.row = %d", indexPath.section, indexPath.row);
    UITableViewCell *cell = nil;
    
    // Configure the cell...
    if (self.textFieldEnabled && indexPath.row == (self.cellNames.count - 1)) {
        // use different identifier http://stackoverflow.com/a/15350437
        cell = [tableView dequeueReusableCellWithIdentifier:@"editableCell" forIndexPath:indexPath];
        if (!self.textFieldLoaded) {
            self.myTextField.delegate = self;
            cell.accessoryView = self.myTextField;
            // prevent more next accessoryViews:
            self.textFieldLoaded += 1;
            NSLog(@"accessoryView row %ld", (long)indexPath.row);
        }
        cell.textLabel.text = [NSString stringWithFormat:@"%@", self.myTextField.text];
        NSLog(@"last row %ld := %@", (long)indexPath.row, cell.textLabel.text);
    } else {
        cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
        cell.textLabel.text = [NSString stringWithFormat:@"%@", [self.cellNames objectAtIndex:indexPath.row]];
        NSLog(@"row %ld := %@", (long)indexPath.row, cell.textLabel.text);
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - UITextField delegate

- (void)textFieldDidEndEditing:(UITextField *)textField {
    NSLog(@"textFieldDidEndEditing %@", textField.text);
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField == self.myTextField && ![textField.text isEqual: @""]) {
        if (self.delegateid && [self.delegateid respondsToSelector:@selector(updateViewWithSelectedData:)]) {
            self.cellSelected = self.cellNames.count - 1;
            [self.delegateid updateViewWithSelectedData:textField.text];
        }
    }
    NSLog(@"textFieldShouldReturn %@", textField.text);
    return YES;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger i = indexPath.row;
    self.cellSelected = i + 1;
    NSLog(@"didSelectRowAtIndexPath %ld, self.cellSelected = %ld", (long)indexPath.row, (long)self.cellSelected);
    if (![self.cellNames[i] isEqual: @""]) {
        self.myTextField.text = @"";
        [self.myTextField resignFirstResponder];
        if (self.delegateid && [self.delegateid respondsToSelector:@selector(updateViewWithSelectedData:)]) {
            [self.delegateid updateViewWithSelectedData:self.cellNames[i]];
        }
    }
    
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    if (cell.selected) {
        // ... Uncheck
        [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    }
    NSLog(@"didDeselectRowAtIndexPath %ld", (long)indexPath.row);
}

@end
