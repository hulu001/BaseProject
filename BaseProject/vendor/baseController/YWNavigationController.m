//
//  YWNavigationController.m
//  BaseProject
//
//  Created by zhupetter on 15/6/29.
//  Copyright (c) 2015年 zhupetter. All rights reserved.
//

#import "YWNavigationController.h"

@interface YWNavigationController ()

@end

@implementation YWNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    if ([UINavigationBar instancesRespondToSelector:@selector(setShadowImage:)])[[UINavigationBar appearance] setShadowImage:[[UIImage alloc] init]];
    [[UINavigationBar appearance]setBackgroundColor:[UIColor clearColor]];
    //self.view.backgroundColor = [UIColor whiteColor];
    [self.navigationBar setBackgroundImage:Image(@"pc_nav_bar_bg_ios7") forBarMetrics:UIBarMetricsDefault];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
