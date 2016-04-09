//
//  SKContactsViewController.m
//  Noticeboard
//
//  Created by Shengkun Xie on 23/03/16.
//  Copyright © 2016 TIME LIMITED. All rights reserved.
//

#import "SKContactsViewController.h"

@interface SKContactsViewController ()

@end

@implementation SKContactsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithImage:@"friendsRecommentIcon" highLightedImage:@"friendsRecommentIcon-click" target:self action:@selector(friendsClick)];
}

- (void)friendsClick {
    NSLog(@"MainTagSubIcon");
}



@end
