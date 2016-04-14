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
 *  Set centerX
 */
- (void)setCenterX:(CGFloat)centerX{
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}
/**
 *  Set centerY
 */
- (void)setCenterY:(CGFloat)centerY{
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
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
/**
 *  Get centerX
 */
- (CGFloat)centerX{
    return self.center.x;
}
/**
 *  Get centerY
 */
- (CGFloat)centerY{
    return self.center.y;
}
@end
