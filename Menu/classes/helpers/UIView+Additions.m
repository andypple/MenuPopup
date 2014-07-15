//
//  UIView+Additions.m
//  Menu
//
//  Created by Phat, Le Tan on 7/15/14.
//  Copyright (c) 2014 FourFi. All rights reserved.
//

#import "UIView+Additions.h"

@implementation UIView (Additions)

- (void)setLeft:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (UIImage *)screenShot
{
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, self.opaque, 0.0f);
    [self drawViewHierarchyInRect:self.bounds afterScreenUpdates:NO];
    UIImage * snapshotImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return snapshotImage;
}

@end
