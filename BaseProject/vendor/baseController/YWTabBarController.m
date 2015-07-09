//
//  PCTabBarController.m
//  PinkDiary
//
//  Created by heyuan on 14/11/21.
//
//

#import "YWTabBarController.h"

@interface YWTabBarController ()

@end

@implementation YWTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置不超出边界，only support ios7
    if ([self respondsToSelector:@selector(edgesForExtendedLayout)])
        self.edgesForExtendedLayout = UIRectEdgeNone;
    [self initTabViewController];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//初始化tabViewConroller
-(void)initTabViewController
{
    _homeVC = [[YWHomeViewController alloc] init];
    YWNavigationController *homeNav = [[YWNavigationController alloc] initWithRootViewController:_homeVC];
    _homeVC.tabBarItem = [self createTabBarItem:VString(@"逛逛") normalImage:@"tab_item_1" selectedImage:@"tab_item_1_selected" itemTag:0];
    _homeVC.tabBarItem.imageInsets = UIEdgeInsetsMake(5, 0, -5, 0);

    _disCoverVC = [[YWDiscoverViewController alloc] init];
    YWNavigationController *categoryNav = [[YWNavigationController alloc] initWithRootViewController:_disCoverVC];
    _disCoverVC.tabBarItem = [self createTabBarItem:VString(@"发现") normalImage:@"tab_item_2" selectedImage:@"tab_item_2_selected" itemTag:1];
    _disCoverVC.tabBarItem.imageInsets = UIEdgeInsetsMake(5, 0, -5, 0);
    
    _messageVC = [[YWMessageViewController alloc] init];
    YWNavigationController *messageNav = [[YWNavigationController alloc] initWithRootViewController:_messageVC];
    _messageVC.tabBarItem = [self createTabBarItem:VString(@"消息") normalImage:@"tab_item_4" selectedImage:@"tab_item_4_selected" itemTag:3];
    _messageVC.tabBarItem.imageInsets = UIEdgeInsetsMake(5, 0, -5, 0);
    
    _meVC = [[YWMeViewController alloc] init];
    YWNavigationController *meNav = [[YWNavigationController alloc] initWithRootViewController:_meVC];
    _meVC.tabBarItem = [self createTabBarItem:VString(@"我的") normalImage:@"tab_item_5" selectedImage:@"tab_item_5_selected" itemTag:4];
    _meVC.tabBarItem.imageInsets = UIEdgeInsetsMake(5, 0, -5, 0);

    NSArray *tabItems = [NSArray arrayWithObjects:homeNav,categoryNav,messageNav,meNav, nil];
    self.viewControllers = tabItems;
    
    [self.tabBar setBackgroundImage:Image(@"tab_bg")];
     self.tabBar.selectionIndicatorImage = Image(@"transparentBackground");
    [self.tabBar setBarStyle:UIBarStyleBlackOpaque];

}



- (UITabBarItem *) createTabBarItem:(NSString *)strTitle
                        normalImage:(NSString *)strNormalImg
                      selectedImage:(NSString *)strSelectedImg
                            itemTag:(NSInteger)intTag
{
    UITabBarItem *item = [[UITabBarItem alloc] initWithTitle:@"" image:nil tag:intTag];
    [item setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor], NSForegroundColorAttributeName, nil]
                        forState:UIControlStateNormal];
    [item setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:RGB(246, 115, 143, 1.0), NSForegroundColorAttributeName, nil] forState:UIControlStateSelected];
    [item setTitlePositionAdjustment:UIOffsetMake(0,-4)];
    
    [item setImage:[[UIImage imageNamed:strNormalImg] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [item setSelectedImage:[[UIImage imageNamed:strSelectedImg] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    return item;
}

@end
















