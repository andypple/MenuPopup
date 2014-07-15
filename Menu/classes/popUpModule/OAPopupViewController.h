//
//  OAPopupViewController.h
//  Menu
//
//  Created by Phat, Le Tan on 7/15/14.
//  Copyright (c) 2014 FourFi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OAPopupViewController : UIViewController

- (instancetype)initWithViewControllerContent:(UIViewController *)contentViewController;
- (void)showInView:(UIView *)aView animated:(BOOL)animated;

@end
