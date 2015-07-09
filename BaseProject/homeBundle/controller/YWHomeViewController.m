//
//  YWHomeViewController.m
//  BaseProject
//
//  Created by zhupetter on 15/6/30.
//  Copyright (c) 2015年 zhupetter. All rights reserved.
//

#import "YWHomeViewController.h"
#import "YWPushViewController.h"
#import "TMOTableView.h"
#import "YWNetworkManager.h"

@interface YWHomeViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic)TMOTableView *tableView;

@end

@implementation YWHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"首页" backButton:NO];
    [self setRightItem:@"nav_btn_cancel_img"];
    NSLog(@"self.frame:%@",self.view);
    self.tableView = [[TMOTableView alloc] initWithFrame:CGRectMake(0, 0,kScreenWidth, kScreenHeight-kTopBarHeight)];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
    
    [self.tableView firstLoadWithBlock:^(TMOTableView *tableView, YWHomeViewController *viewController) {
//        //do something load data jobs
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//                [tableView.myFirstLoadControl fail];
//        });
        
    [[YWNetworkManager shareManager] requstGETPath:@"stream/0/posts/stream/global" parameter:nil callbackBlock:^(BOOL success, id result, NSURLSessionTask *task) {
            if (success) {
                HYLog(@"result:%@", result);
                [tableView.myFirstLoadControl done];
            }else{
                [tableView.myFirstLoadControl fail];
            }
        }];
       // [task cancel];
    } withLoadingView:nil withFailView:nil];
    
    self.tableView.myFirstLoadControl.allowRetry = YES;//set YES makes failView can response user tap retry.
    
    [self.tableView refreshWithCallback:^(TMOTableView *tableView, YWHomeViewController *viewController) {
        [tableView.myRefreshControl done];
    } withDelay:1.5];
    
    [self.tableView loadMoreWithCallback:^(TMOTableView *tableView, id viewController) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            if (arc4random() % 10 < 4) {
                //try to fail
                [tableView.myLoadMoreControl fail];
            }
            else {
                [tableView.myLoadMoreControl done];
            }
        });
    } withDelay:0.0];
}

- (void)rightBarButtonItemAction:(UIButton *)btn
{
    YWPushViewController *pushViewConttroller = [[YWPushViewController alloc] init];
    //UITableViewController *pushViewController = [[UITableViewController alloc] init];
    [self loadViewControllerBottomBarHideBackShow:pushViewConttroller];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

static NSString *const cellIdentifier  = @"staticCell";
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"static cell %@",@(indexPath.row)];
    return cell;
}

@end
