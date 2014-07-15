//
//  UIView+Nib.m
//  Menu
//
//  Created by Phat, Le Tan on 7/15/14.
//  Copyright (c) 2014 FourFi. All rights reserved.
//

#import "UIView+Nib.h"

@implementation UIView (Nib)

+ (UINib *)nib
{
    return [UINib nibWithNibName:NSStringFromClass(self) bundle:nil];
}

@end
