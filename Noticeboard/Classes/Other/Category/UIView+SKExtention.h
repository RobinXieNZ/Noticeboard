//
//  UIView+SKExtention.h
//  Noticeboard
//
//  Created by Shengkun Xie on 24/03/16.
//  Copyright © 2016 TIME LIMITED. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (SKExtention)
/** Hight of view */
@property (nonatomic, assign) CGFloat height;
/** Width of view */
@property (nonatomic, assign) CGFloat width;
/** x of view */
@property (nonatomic, assign) CGFloat x;
/** y of view */
@property (nonatomic, assign) CGFloat y;
/** size of view */
@property (nonatomic, assign) CGSize size;
/** center X of view */
@property (nonatomic, assign) CGFloat centerX;
/** center Y of view */
@property (nonatomic, assign) CGFloat centerY;
/** center of view */
@property (nonatomic, assign) CGPoint center;
@end
