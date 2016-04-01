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

    // Uncomment the following line to preserve selection between presentations.
    self.clearsSelectionOnViewWillAppear = NO;
 
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    [self.tableView selectRowAtIndexPath:indexPath animated:NO scrollPosition:UITableViewScrollPositionMiddle];
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    //NSLog(@"self %@, tV %@, tV.del %@", self, self.tableView, self.tableView.delegate);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    static NSString *CellIdentifier = @"Cell";
    NSInteger i = indexPath.row;
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    if (i < self.cellNames.count) {
        if ([[self.cellNames objectAtIndex:i] isEqual: @"Please rename me"]) {
            //NSLog(@"height %f", tableView.frame.size.width);
            self.myTextField = [[UITextField alloc] initWithFrame:CGRectMake(0,10,(tableView.frame.size.width-32),25)];
            self.myTextField.adjustsFontSizeToFitWidth = NO;
            self.myTextField.backgroundColor = [UIColor clearColor];
            self.myTextField.autocorrectionType = UITextAutocorrectionTypeNo;
            self.myTextField.autocapitalizationType = UITextAutocapitalizationTypeWords;
            self.myTextField.keyboardType = UIKeyboardTypeDefault;
            self.myTextField.returnKeyType = UIReturnKeyDone;
            self.myTextField.clearButtonMode = UITextFieldViewModeNever;
            self.myTextField.placeholder = [self.cellNames objectAtIndex:i];
            //self.myTextField.delegate = self;
            cell.accessoryView = self.myTextField;
        } else {
            cell.textLabel.text = [NSString stringWithFormat:@"%@", [self.cellNames objectAtIndex:i]];
        }
    } else {
        cell.textLabel.text = [NSString stringWithFormat:@"Row %ld", (long)indexPath.row];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger i = indexPath.row;
    if (self.cellSelected > 0 && i == self.cellSelected-1) {
        //[cell setSelected:YES animated:NO];
    } else {
        //[cell setSelected:NO animated:NO];
    }
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

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    if (cell.selected) {
        // ... Uncheck
        //[tableView deselectRowAtIndexPath:indexPath animated:YES];
        //[self.tableView deselectRowAtIndexPath:self.tableView.indexPathForSelectedRow animated:YES];
    }
    NSInteger i = indexPath.row;
    self.cellSelected = i + 1;
    NSLog(@"didSelectRowAtIndexPath %ld, self.cellSelected = %ld", (long)indexPath.row, (long)self.cellSelected);
    self.myTextField.text = @"";
    //[self dismissViewControllerAnimated:YES completion:nil];
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
    NSLog(@"didSelectRowAtIndexPath %ld", (long)indexPath.row);
}

- (void)dismissMe {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
