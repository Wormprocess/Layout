//
//  UIView+TExtension.m
//  NSLayoutConstraintDemo
//
//  Created by dome on 2017/12/14.
//  Copyright © 2017年 Tsunami. All rights reserved.
//

#import "UIView+TExtension.h"


@implementation UIView (TExtension)

- (CGFloat)sd_height
{
    return self.frame.size.height;
}

- (void)setSd_height:(CGFloat)sd_height
{
    CGRect temp = self.frame;
    temp.size.height = sd_height;
    self.frame = temp;
}

- (CGFloat)sd_width
{
    return self.frame.size.width;
}

- (void)setSd_width:(CGFloat)sd_width
{
    CGRect temp = self.frame;
    temp.size.width = sd_width;
    self.frame = temp;
}


@end
