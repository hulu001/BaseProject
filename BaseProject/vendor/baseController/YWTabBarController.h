//
//  PCTabBarController.h
//  PinkDiary
//
//  Created by heyuan on 14/11/21.
//
//

#import <UIKit/UIKit.h>
#import "YWNavigationController.h"
#import "YWHomeViewController.h"
#import "YWDiscoverViewController.h"
#import "YWMessageViewController.h"
#import "YWMeViewController.h"

@interface YWTabBarController : UITabBarController

@property (strong, nonatomic) YWHomeViewController *homeVC;
@property (strong, nonatomic) YWDiscoverViewController *disCoverVC;
@property (strong, nonatomic) YWMessageViewController *messageVC;
@property (strong, nonatomic) YWMeViewController *meVC;

@end
