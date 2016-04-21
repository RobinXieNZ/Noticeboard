//
//  SKHomeViewController.m
//  Noticeboard
//
//  Created by Shengkun Xie on 23/03/16.
//  Copyright © 2016 TIME LIMITED. All rights reserved.
//

#import "SKHomeViewController.h"
#import "SKNewsViewController.h"
#import "SKSellViewController.h"
#import "SKBuyViewController.h"
#import "SKFunViewController.h"
#import "SKDateViewController.h"

@interface SKHomeViewController ()<UIScrollViewDelegate>

/** indicator of titles view */
@property (nonatomic, weak) UIView *indicatorView;
/** title view which contents all titles */
@property (nonatomic, strong) UIView *titleView;
/** selected button of titles view */
@property (weak, nonatomic) UIButton *selectedButton;
/** content view */
@property (nonatomic, weak) UIScrollView *contentView;

@end

@implementation SKHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpNavigationBar];
    [self setUpTitleView];
    [self setUpChildViews];
    [self setUpContentView];
}

- (void)setUpNavigationBar {
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"MainTagSubIcon" highLightedImage:@"MainTagSubIconClick" target:self action:@selector(mainTagClick)];
}

- (void)setUpTitleView{
    // init titles bar
    UIView *titleView = [[UIView alloc]init];
    titleView.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.7];
    titleView.width = self.view.width;
    titleView.height = 35;
    titleView.y = 64;
    [self.view addSubview:titleView];
    self.titleView = titleView;
    
  
    
    // add titles into titles bar
    NSArray *titles = @[@"News",@"Sell",@"Buy",@"Fun",@"Date"];
    CGFloat width = titleView.width / titles.count;
    CGFloat hight = titleView.height;
    
    for (NSInteger i = 0; i < titles.count; i++) {
        UIButton *button = [[UIButton alloc]init];
        button.tag = i;
        button.width = width;
        button.height = hight;
        button.x = width * i;
        [button setTitle:titles[i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor redColor] forState:UIControlStateDisabled];
        button.titleLabel.font = [UIFont systemFontOfSize:14];
        [button addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
        [titleView addSubview:button];
        
        // Set first title button be default option.
        if (i == 0) {
            self.selectedButton = button;
            button.enabled = NO;
            [button.titleLabel sizeToFit];
            // Must set size of view first, then set the position of view
            self.indicatorView.width = button.titleLabel.width;
            self.indicatorView.centerX = button.centerX;
        }
    }
    // Add indicator view aftet the addition of title buttons to make sure the index of childviews equals the order of title buttons
    // init indicator view
    UIView *indicatorView = [[UIView alloc]init];
    indicatorView.backgroundColor = [UIColor redColor];
    indicatorView.height = 2;
    indicatorView.y = titleView.height - indicatorView.height;
    self.indicatorView = indicatorView;
    [titleView addSubview:indicatorView];
}

- (void)titleClick:(UIButton *)button{
    self.selectedButton.enabled = YES;
    button.enabled = NO;
    self.selectedButton = button;
    
    // set animations for button click
    [UIView animateWithDuration:0.25 animations:^{
        // set size of view first then set the position of view
        self.indicatorView.width = button.titleLabel.width;
        self.indicatorView.centerX = button.centerX;
    }];
    
    // scall the content view
    CGPoint offSet = self.contentView.contentOffset;
    offSet.x = button.tag * self.contentView.width;
//    NSLog(@"%zd ----- %f",button.tag,offSet.x);
    [self.contentView setContentOffset:offSet animated:YES];
}

- (void)setUpChildViews {
// It is not a good idea to set content inset of tableviews here, because until after the viewdidload method tabbar at bottom will be initialized. So a batter way is to set content inset in the scrollViewDidEndScrollingAnimation method, or in the viewdidload method of each child view controller.

    UITableViewController *newsVc = [[SKNewsViewController alloc]init];
    [self addChildViewController:newsVc];
    
    UITableViewController *sellVc = [[SKSellViewController alloc]init];
    [self addChildViewController:sellVc];
    
    UITableViewController *buyVc = [[SKBuyViewController alloc]init];
    [self addChildViewController:buyVc];
    
    UITableViewController *funVc = [[SKFunViewController alloc]init];
    [self addChildViewController:funVc];
    
    UITableViewController *dateVc = [[SKDateViewController alloc]init];
    [self addChildViewController:dateVc];
}

- (void)setUpContentView {
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    UIScrollView *contentView = [[UIScrollView alloc]init];
    contentView.frame = self.view.bounds;
    contentView.delegate = self;
    contentView.pagingEnabled = YES;
    
    // add content view at bottom
    [self.view insertSubview:contentView atIndex:0];
    
    // set content width
    contentView.contentSize = CGSizeMake(contentView.size.width * self.childViewControllers.count, 0);
    self.contentView = contentView;
    [self scrollViewDidEndScrollingAnimation:contentView];
}

- (void)mainTagClick {
    UIViewController *vc = [[UIViewController alloc]init];
    [vc.view setBackgroundColor:[UIColor greenColor]];
    [self.navigationController pushViewController:vc animated:YES];
}

/**
 *  Delegate method of scrollview
 *
 *  To synchronise the scroll view and the title view
 */
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    [self scrollViewDidEndScrollingAnimation:scrollView];
    
    NSInteger index = scrollView.contentOffset.x / scrollView.width;
    [self titleClick:self.titleView.subviews[index]];
}

/**
 *  Delegate method of scrollview
 *  
 *  Add subview to content view.
 */
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    // get current index
    NSInteger index = scrollView.contentOffset.x / scrollView.width;
    
    UITableViewController *vc = self.childViewControllers[index];
    // you need set y and height for the view, otherwise they will be set as defult which is y = 20, and hight = (height of window - 20).
    vc.view.x = scrollView.contentOffset.x;
    vc.view.y = 0;
    vc.view.height = scrollView.height;
//    NSLog(@"%@",self.tabBarController.tabBar);
    CGFloat bottom = 49.0;//self.tabBarController.tabBar.height;
//    NSLog(@"%f",bottom);
    CGFloat top = CGRectGetMaxY(self.titleView.frame);
    vc.tableView.contentInset = UIEdgeInsetsMake(top, 0, bottom, 0);
    [self.contentView addSubview:vc.view];
}

@end
