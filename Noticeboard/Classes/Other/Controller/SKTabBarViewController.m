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
#import "SKNavigationController.h"
@interface SKTabBarViewController ()

@end

@implementation SKTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    SKHomeViewController *homeVc = [[SKHomeViewController alloc]init];
    // It is not a good idea to create a navigation controller here and add it to tabbar controller. Because you can not set the title for navigation items.
    [self setUpChildVc:homeVc title:@"Home" image:@"tabBar_essence_icon" selectedImage:@"tabBar_essence_click_icon"];
    
    SKNewViewController *newVc = [[SKNewViewController alloc]init];
    [self setUpChildVc:newVc title:@"New" image:@"tabBar_new_icon" selectedImage:@"tabBar_new_click_icon"];
    
    SKContactsViewController *contactsVc = [[SKContactsViewController alloc]init];
    [self setUpChildVc:contactsVc title:@"Contacts" image:@"tabBar_friendTrends_icon" selectedImage:@"tabBar_friendTrends_click_icon"];
    
    SKMeViewController *meVc = [[SKMeViewController alloc]init];
    [self setUpChildVc:meVc title:@"Me" image:@"tabBar_me_icon" selectedImage:@"tabBar_me_click_icon"];
    
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
    SKNavigationController *nav = [[SKNavigationController alloc]initWithRootViewController:vc];
    vc.navigationItem.title = title;
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = [UIImage imageNamed:image];
    vc.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
    vc.view.backgroundColor = [UIColor colorWithRed:125/255.0 green:125/255.0 blue:125/255.0  alpha:1];
    [self addChildViewController:nav];
}

@end
