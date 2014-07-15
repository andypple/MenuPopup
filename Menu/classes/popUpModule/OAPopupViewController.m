//
//  OAPopupViewController.m
//  Menu
//
//  Created by Phat, Le Tan on 7/15/14.
//  Copyright (c) 2014 FourFi. All rights reserved.
//

#import "OAPopupViewController.h"
#import <FXBlurView.h>

static NSInteger close_button_x = 15;
static NSInteger close_button_y = 30;
static NSInteger close_button_width = 44;
static NSInteger close_button_height = 44;

@interface OAPopupViewController ()

@property (strong, nonatomic) UIViewController *contentViewController;
@property (strong, nonatomic) UIView *contentView;
@property (strong, nonatomic) UIButton *closeButton;
@property (strong, nonatomic) UIImageView *blurImageView;

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

- (UIImageView *)blurImageView
{
    if (!_blurImageView) {
        _blurImageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    }
    return _blurImageView;
}


- (void)showInView:(UIView *)aView animated:(BOOL)animated
{
    dispatch_async(dispatch_get_main_queue(), ^{
        self.blurImageView.image = [[aView screenShot] blurredImageWithRadius:10 iterations:12 tintColor:nil];
        [self.view insertSubview:self.blurImageView belowSubview:self.contentView];

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

- (UIButton *)closeButton
{
    if (!_closeButton) {
        _closeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_closeButton setBackgroundImage:[UIImage imageNamed:@"close-button"] forState:UIControlStateNormal];
        _closeButton.frame = CGRectMake(close_button_x, close_button_y, close_button_width, close_button_height);
        [_closeButton addTarget:self action:@selector(closeAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _closeButton;
}

- (void)setupView
{
    [self.view addSubview:self.contentView];
    [self.view addSubview:self.closeButton];
}

- (void)closeAction
{
    [self dismissWithAnimation];
}

@end
