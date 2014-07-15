//
//  OAHomeViewController.m
//  Menu
//
//  Created by Phat, Le Tan on 7/15/14.
//  Copyright (c) 2014 FourFi. All rights reserved.
//

#import "OAHomeViewController.h"
#import "OAPopupViewController.h"
#import "OAMenuViewController.h"

@interface OAHomeViewController ()

@property (strong, nonatomic) OAPopupViewController *popUpViewController;

@end

@implementation OAHomeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)menuAction:(id)sender
{
    [self popUpMenu];
}

- (void)popUpMenu
{
    self.popUpViewController = [[OAPopupViewController alloc] initWithViewControllerContent:[[OAMenuViewController alloc] init]];
    [self.popUpViewController showInView:self.view animated:YES];
}

@end
