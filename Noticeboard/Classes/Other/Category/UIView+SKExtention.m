//
//  UIView+SKExtention.m
//  Noticeboard
//
//  Created by Shengkun Xie on 24/03/16.
//  Copyright © 2016 TIME LIMITED. All rights reserved.
//

#import "UIView+SKExtention.h"

@implementation UIView (SKExtention)
/**
 *  Set hight
 */
- (void)setHight:(CGFloat)hight{
    CGRect fream = self.frame;
    fream.size.height = hight;
    self.frame = fream;
}
/**
 *  Set width
 */
- (void)setWidth:(CGFloat)width{
    CGRect fream = self.frame;
    fream.size.width = width;
    self.frame = fream;
}
/**
 *  Set x
 */
- (void)setX:(CGFloat)x{
    CGRect fream = self.frame;
    fream.origin.x = x;
    self.frame = fream;
}
/**
 *  Set y
 */
- (void)setY:(CGFloat)y{
    CGRect fream = self.frame;
    fream.origin.y = y;
    self.frame = fream;
}
/**
 *  Set size
 */
- (void)setSize:(CGSize)size{
    CGRect fream = self.frame;
    fream.size = size;
    self.frame = fream;
}
/**
 *  Get hight
 */
- (CGFloat)hight{
    return  self.frame.size.height;
}
/**
 *  Get width
 */
- (CGFloat)width{
    return self.frame.size.width;
}
/**
 *  Get size
 */
- (CGSize)size{
    return self.frame.size;
}
/**
 *  Get x
 */
- (CGFloat)x{
    return self.frame.origin.x;
}
/**
 *  Get y
 */
- (CGFloat)y{
    return self.frame.origin.y;
}
@end
