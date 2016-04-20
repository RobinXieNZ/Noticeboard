//
//  SKTabBar.m
//  Noticeboard
//
//  Created by Shengkun Xie on 23/03/16.
//  Copyright © 2016 TIME LIMITED. All rights reserved.
//

#import "SKTabBar.h"
@interface SKTabBar()

/** Publish button */
@property (nonatomic, strong) UIButton *publishButton;

@end
@implementation SKTabBar
- (instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        UIButton *publishButton = [[UIButton alloc]init];
        [publishButton setBackgroundImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
        [publishButton setBackgroundImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateHighlighted];
        [self addSubview:publishButton];
        self.publishButton = publishButton;
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    CGFloat height = self.frame.size.height;
    CGFloat width = self.frame.size.width/5;
    CGFloat y = 0;
    // set up the fream for publish button
    self.publishButton.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
    self.publishButton.size = self.publishButton.currentBackgroundImage.size;
    
    NSInteger index = 0;
    for (UIView *button in self.subviews) {
        if(![button isKindOfClass:NSClassFromString(@"UITabBarButton")]) continue;
        button.y = y;
        button.width = width;
        button.height = height;
        button.x = width*((index <= 1)?(index):(index + 1));
        index ++;
    }
}
@end
