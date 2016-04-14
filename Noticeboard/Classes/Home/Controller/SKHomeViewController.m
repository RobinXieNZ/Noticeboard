//
//  SKHomeViewController.m
//  Noticeboard
//
//  Created by Shengkun Xie on 23/03/16.
//  Copyright © 2016 TIME LIMITED. All rights reserved.
//

#import "SKHomeViewController.h"
@interface SKHomeViewController ()

/** indicator of titles view */
@property (nonatomic, weak) UIView *indicatorView;
/** selected button of titles view */
@property (weak, nonatomic) UIButton *selectedButton;

@end

@implementation SKHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpNavigationBar];
    [self setUpTitlesView];
}

- (void)setUpNavigationBar {
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"MainTagSubIcon" highLightedImage:@"MainTagSubIconClick" target:self action:@selector(mainTagClick)];
}

- (void)setUpTitlesView{
    // init titles bar
    UIView *titleView = [[UIView alloc]init];
    titleView.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.7];
    titleView.width = self.view.width;
    titleView.hight = 35;
    titleView.y = 64;
    [self.view addSubview:titleView];
    
    // init indicator view
    UIView *indicatorView = [[UIView alloc]init];
    indicatorView.backgroundColor = [UIColor redColor];
    indicatorView.hight = 2;
    indicatorView.y = titleView.hight - indicatorView.hight;
    self.indicatorView = indicatorView;
    [titleView addSubview:indicatorView];
    
    // add titles into titles bar
    NSArray *titles = @[@"News",@"Sell",@"Buy",@"Fun",@"Date"];
    CGFloat width = titleView.width / titles.count;
    CGFloat hight = titleView.hight;
    
    for (NSInteger i = 0; i < titles.count; i++) {
        UIButton *button = [[UIButton alloc]init];
        button.width = width;
        button.hight = hight;
        button.x = width * i;
        [button setTitle:titles[i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
        button.titleLabel.font = [UIFont systemFontOfSize:14];
        [button addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
        [titleView addSubview:button];
        
        // Set first title button be default option.
        if (i == 0) {
            self.selectedButton = button;
            button.enabled = NO;
            [button.titleLabel sizeToFit];
            // set size of view first then set the position of view
            self.indicatorView.width = button.titleLabel.width;
            self.indicatorView.centerX = button.centerX;
        }
    }
}

- (void)titleClick:(UIButton *)button{
    self.selectedButton.enabled = YES;
    button.enabled = NO;
    self.selectedButton = button;
        [UIView animateWithDuration:0.25 animations:^{
            // set size of view first then set the position of view
            self.indicatorView.width = button.titleLabel.width;
            self.indicatorView.centerX = button.centerX;
        }];
}

- (void)mainTagClick {
    UIViewController *vc = [[UIViewController alloc]init];
    [vc.view setBackgroundColor:[UIColor greenColor]];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
