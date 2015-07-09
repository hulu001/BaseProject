//
//  BaseViewController.m
//  BaseProject
//
//  Created by zhupetter on 15/6/29.
//  Copyright (c) 2015年 zhupetter. All rights reserved.
//
#import "YWBaseViewController.h"

@interface YWBaseViewController ()

@end

@implementation YWBaseViewController
@synthesize universalDelegate;

- (id)init
{
    self = [super init];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)loadView{
    [super loadView];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //设置不超出边界，only support ios7
    if ([self respondsToSelector:@selector(edgesForExtendedLayout)])
        self.edgesForExtendedLayout = UIRectEdgeNone;
    
    self.view.backgroundColor = [UIColor whiteColor];

}

- (BOOL)prefersStatusBarHidden
{
    return NO;
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}
 
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

@implementation UIViewController(UIViewControllerExtensions)

-(void)loadViewController:(YWBaseViewController *)viewController;
{
    self.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:viewController animated:YES];
    self.hidesBottomBarWhenPushed = YES;
}

-(void)loadViewControllerBottomBarHideBackShow:(YWBaseViewController *)viewController;
{
    self.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:viewController animated:YES];
    self.hidesBottomBarWhenPushed = NO;
}


- (UIButton *)createButtonWithImage:(UIImage *)image
                        highlighted:(UIImage *)hlimage
                             action:(SEL)sel
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setFrame:CGRectMake(0,0,44, 44)];
    [btn setImage:image forState:UIControlStateNormal];
    [btn setImage:hlimage forState:UIControlStateHighlighted];
    [btn setBackgroundColor:[UIColor clearColor]];
    [btn setContentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter];
    [btn addTarget:self action:sel forControlEvents:UIControlEventTouchUpInside];
    return btn;
}


-(void)setTitle:(NSString *)title
     backButton:(BOOL)showBackButton
{
    //Custom back button
    self.navigationItem.backBarButtonItem = nil;
    if (showBackButton){
        self.navigationItem.leftBarButtonItem.title = @"";
        UIButton *btn = [self createButtonWithImage:Image(@"pc_nav_btn_back_img")
                                        highlighted:Image(@"pc_nav_btn_back_img_hl")
                                             action:@selector(back:)];
        CGFloat offset = -25.0;
        [btn setContentEdgeInsets:UIEdgeInsetsMake(0,offset, 0, 0)];
        UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
        self.navigationItem.leftBarButtonItem = leftItem;
    }else{
        self.navigationItem.hidesBackButton = YES;
        [self.navigationItem setLeftBarButtonItem:nil animated:YES];
    }
    
    //Create title label
    if (title && [title isKindOfClass:[NSString class]] && [title length]>0){
        UILabel *titleLbl = [UILabel createLable:CGRectMake(0, 0, 190, 44)];
        [titleLbl setTextAlignment:ALIGN_CENTER];
        titleLbl.textColor = RGB(172,80,82,1);
        titleLbl.text = title;
//        titleLbl.shadowColor = RGB(0, 0, 0, 1);
//        titleLbl.shadowOffset = CGSizeMake(0, 1);
        titleLbl.font= SYSTEMFONT(VMargin18);
        titleLbl.backgroundColor = [UIColor clearColor];

        self.navigationItem.titleView = titleLbl;
    }
}


- (void)setLeftItem:(NSString *)imagename
{
    if (!isValidString(imagename)) {
        self.navigationItem.leftBarButtonItem = nil;
    }
    UIButton *leftBtn = [self createButtonWithImage:Image(imagename)
                                         highlighted:Image([imagename stringByAppendingString:@"_hl"])
                                              action:@selector(back:)];
    CGFloat offset = -25.0;
    [leftBtn setContentEdgeInsets:UIEdgeInsetsMake(0,offset,0,0)];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:leftBtn];
}


- (void)setRightItem:(NSString *)imagename
{
    if (!isValidString(imagename)) {
        self.navigationItem.rightBarButtonItem = nil;
    }
    UIButton *rightBtn = [self createButtonWithImage:Image(imagename)
                                    highlighted:Image([imagename stringByAppendingString:@"_hl"])
                                         action:@selector(rightBarButtonItemAction:)];
    CGFloat offset = -25.0;
    [rightBtn setContentEdgeInsets:UIEdgeInsetsMake(0,0,0,offset)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:rightBtn];
}


-(void)rightBarButtonItemAction:(UIButton *)btn
{
    
}

-(void)back:(UIButton *)btn{
    
    if(![self.navigationController popViewControllerAnimated:YES]){
        [self.navigationController dismissViewControllerAnimated:YES completion:nil];
    }
}


@end


