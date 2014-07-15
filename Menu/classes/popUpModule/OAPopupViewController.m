//
//  OAPopupViewController.m
//  Menu
//
//  Created by Phat, Le Tan on 7/15/14.
//  Copyright (c) 2014 FourFi. All rights reserved.
//

#import "OAPopupViewController.h"

@interface OAPopupViewController ()

@property (strong, nonatomic) UIViewController *contentViewController;
@property (strong, nonatomic) UIView *contentView;

@end

@implementation OAPopupViewController

- (instancetype)initWithViewControllerContent:(UIViewController *)contentViewController
{
    if (self = [super init]) {
        _contentViewController = contentViewController;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupView];
}

- (void)showInView:(UIView *)aView animated:(BOOL)animated
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [aView addSubview:self.view];
        
        if (animated) {
            [self showWithAnimation];
        }
    });
}

- (UIView *)contentView
{
    if (!_contentView) {
        _contentView = self.contentViewController.view;
        _contentView.center = self.view.center;
    }
    return _contentView;
}

- (void)setupView
{
    [self.view addSubview:self.contentView];
}

@end
