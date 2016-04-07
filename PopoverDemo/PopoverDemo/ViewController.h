//
//  ViewController.h
//  PopoverDemo
//
//  Created by Arthur Knopper on 16-05-13.
//  Copyright (c) 2013 Arthur Knopper. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BFPaperCheckbox.h"
#import "PopoverViewController.h"

@interface ViewController : UIViewController <BFPaperCheckboxDelegate, UIPopoverPresentationControllerDelegate, UpdatePresentingViewControllerWithData>
@property (nonatomic,retain) UIPopoverPresentationController *popOverP;

@end
