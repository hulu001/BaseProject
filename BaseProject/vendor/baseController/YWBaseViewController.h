//
//  YWBaseViewController.h
//  BaseProject
//
//  Created by zhupetter on 15/6/29.
//  Copyright (c) 2015年 zhupetter. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol YWUniversalDelegate <NSObject>

@optional

-(void)didFinishAciton:(id)obj1;

-(void)didFinishAciton:(id)obj1 withInfo:(id)info;

-(void)didFinishAciton:(id)action withObject:(id)obj2 withInfo:(id)info;

@end

@interface YWBaseViewController : UIViewController
{
    __unsafe_unretained id<YWUniversalDelegate>universalDelegate;
    UIImageView *bgImageView;
}
@property (nonatomic,assign)id<YWUniversalDelegate>universalDelegate;

@end

@interface UIViewController(UIViewControllerExtensions)

- (void)setTitle:(NSString *)title backButton:(BOOL)showBackButton;

-(void)loadViewController:(YWBaseViewController *)viewController;

-(void)loadViewControllerBottomBarHideBackShow:(YWBaseViewController *)viewController;

- (void)setLeftItem:(NSString *)imagename;
- (void)setRightItem:(NSString *)imagename;

-(void)rightBarButtonItemAction:(UIButton *)btn;

-(void)back:(UIButton *)btn;

@end