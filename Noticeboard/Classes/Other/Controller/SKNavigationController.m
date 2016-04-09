//
//  SKNavigationController.m
//  Noticeboard
//
//  Created by Shengkun Xie on 7/04/16.
//  Copyright © 2016 TIME LIMITED. All rights reserved.
//

#import "SKNavigationController.h"

@implementation SKNavigationController

+ (void)initialize {
    // Change background for all navagation bars.
    UINavigationBar *bar = [UINavigationBar appearanceWhenContainedIn:[self class], nil];
    [bar setBackgroundImage:[UIImage imageNamed:@"navigationbarBackgroundWhite"] forBarMetrics:UIBarMetricsDefault];
}

- (void)viewDidLoad {
    
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
        if(self.childViewControllers.count > 0){
        UIButton *backButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 70, 30)];
        [backButton setTitle:@"Back" forState:UIControlStateNormal];
        [backButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [backButton setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
        [backButton setImage:[UIImage imageNamed:@"navigationButtonReturn"] forState:UIControlStateNormal];
        [backButton setImage:[UIImage imageNamed:@"navigationButtonReturnClick"] forState:UIControlStateHighlighted];
        [backButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        backButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        backButton.contentEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0);
        UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithCustomView:backButton];
        viewController.navigationItem.leftBarButtonItem = item;
            viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}
- (void)back {
    [self popViewControllerAnimated:YES];
}
@end
