//
//  UIBarButtonItem+SKExtention.h
//  Noticeboard
//
//  Created by Shengkun Xie on 6/04/16.
//  Copyright © 2016 TIME LIMITED. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (SKExtention)
+ (instancetype)itemWithImage:(NSString *)image highLightedImage:(NSString *)highLightedImage target:(id)target action:(SEL)action;
@end
