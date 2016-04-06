//
//  UIBarButtonItem+SKExtention.m
//  Noticeboard
//
//  Created by Shengkun Xie on 6/04/16.
//  Copyright © 2016 TIME LIMITED. All rights reserved.
//

#import "UIBarButtonItem+SKExtention.h"
// Customize barButtonItem
@implementation UIBarButtonItem (SKExtention)
+ (instancetype)itemWithImage:(NSString *)image highLightedImage:(NSString *)highLightedImage target:(id)target action:(SEL)action{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:highLightedImage] forState:UIControlStateHighlighted];
    button.size = button.currentBackgroundImage.size;
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return [[self alloc]initWithCustomView:button];
}
@end
