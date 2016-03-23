//
//  SKTabBarViewController.m
//  Noticeboard
//
//  Created by Shengkun Xie on 23/03/16.
//  Copyright © 2016 TIME LIMITED. All rights reserved.
//

#import "SKTabBarViewController.h"
#import "SKHomeViewController.h"
#import "SKNewViewController.h"
#import "SKMeViewController.h"
#import "SKContactsViewController.h"
#import "SKTabBar.h"
@interface SKTabBarViewController ()

@end

@implementation SKTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    SKHomeViewController *homeVc = [[SKHomeViewController alloc]init];
    UINavigationController *homeNav = [[UINavigationController alloc]initWithRootViewController:homeVc];
    [self setUpChildVc:homeNav title:@"Home" image:@"tabBar_essence_icon" selectedImage:@"tabBar_essence_click_icon"];
    
    SKNewViewController *newVc = [[SKNewViewController alloc]init];
    UINavigationController *newNav = [[UINavigationController alloc]initWithRootViewController:newVc];
    [self setUpChildVc:newNav title:@"New" image:@"tabBar_new_icon" selectedImage:@"tabBar_new_click_icon"];
    
    SKContactsViewController *contactsVc = [[SKContactsViewController alloc]init];
    UINavigationController *contactsNav = [[UINavigationController alloc]initWithRootViewController:contactsVc];
    [self setUpChildVc:contactsNav title:@"Contacts" image:@"tabBar_friendTrends_icon" selectedImage:@"tabBar_friendTrends_click_icon"];
    
    SKMeViewController *meVc = [[SKMeViewController alloc]init];
    UINavigationController *meNav = [[UINavigationController alloc]initWithRootViewController:meVc];
    [self setUpChildVc:meNav title:@"Me" image:@"tabBar_me_icon" selectedImage:@"tabBar_me_click_icon"];
    
    // Set the font and color for tabbar items and cancle rendering of tabbar items title.
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSAttachmentAttributeName] = [UIFont systemFontOfSize:10.0];
    attrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSAttachmentAttributeName] = attrs[NSAttachmentAttributeName];
    selectedAttrs[NSForegroundColorAttributeName] = [UIColor darkGrayColor];
    
    UITabBarItem *item = [UITabBarItem appearance];
    [item setTitleTextAttributes:attrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
    
    // Customize tabBar
    [self setValue:[[SKTabBar alloc]init] forKey:@"tabBar"];
}

- (void)setUpChildVc:(UIViewController *)vc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage{
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = [UIImage imageNamed:image];
    vc.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
    vc.view.backgroundColor = [UIColor colorWithRed:arc4random_uniform(100)/100.0 green:arc4random_uniform(100)/100.0 blue:arc4random_uniform(100)/100.0 alpha:1];
    [self addChildViewController:vc];
}

@end
