//
//  CYLTabBarControllerConfig.m
//  SZSSV1
//
//  Created by DaLei on 2017/4/1.
//  Copyright © 2017年 DaLei. All rights reserved.
//

#import "CYLTabBarControllerConfig.h"
#import "HomeViewController.h"
#import "FindViewController.h"
#import "SendViewController.h"
#import "MessageViewController.h"
#import "MineViewController.h"
#import "SSBaseNavigationController.h"
#import "SSConfig.h"

@interface CYLTabBarControllerConfig ()

@property (nonatomic, readwrite, strong) CYLTabBarController *tabBarController;

@end

@implementation CYLTabBarControllerConfig

- (CYLTabBarController *)tabBarController {
    if (_tabBarController == nil) {
        CYLTabBarController *tabBarController = [CYLTabBarController tabBarControllerWithViewControllers:self.viewControllers tabBarItemsAttributes:self.tabBarItemsAttributesForController];
        [self customizeTabBarAppearance:tabBarController];
        _tabBarController = tabBarController;
    }
    return _tabBarController;
}

- (NSArray *)viewControllers {
    HomeViewController *firstVC = [[HomeViewController alloc] init];
    UIViewController *firstVCN = [[SSBaseNavigationController alloc] initWithRootViewController:firstVC];
    FindViewController *secondVC = [[FindViewController alloc] init];
    UIViewController *secondVCN = [[SSBaseNavigationController alloc] initWithRootViewController:secondVC];
    MessageViewController *thirdVC = [[MessageViewController alloc] init];
    UIViewController *thirdVCN = [[SSBaseNavigationController alloc] initWithRootViewController:thirdVC];
    MineViewController *fourthVC = [[MineViewController alloc] init];
    UIViewController *fourthVCN = [[SSBaseNavigationController alloc] initWithRootViewController:fourthVC];
    NSArray *viewControllers = @[firstVCN,secondVCN,thirdVCN,fourthVCN];
    return viewControllers;
}

- (NSArray *)tabBarItemsAttributesForController {
    NSDictionary *firstTabBarItemsAttributes = @{CYLTabBarItemTitle : @"首页",
                                                 CYLTabBarItemImage : @"tab_shouye",
                                                 CYLTabBarItemSelectedImage : @"tab_shouye_light",};
    NSDictionary *secondTabBarItemsAttributes = @{CYLTabBarItemTitle : @"发现",
                                                  CYLTabBarItemImage : @"tab_faxian",
                                                  CYLTabBarItemSelectedImage : @"tab_faxian_light",};
    NSDictionary *thirdTabBarItemsAttributes = @{CYLTabBarItemTitle : @"消息",
                                                 CYLTabBarItemImage : @"tab_xiaoxi",
                                                 CYLTabBarItemSelectedImage : @"tab_xiaoxi_light",};
    NSDictionary *fourthTabBarItemsAttributes = @{CYLTabBarItemTitle : @"我的",
                                                  CYLTabBarItemImage : @"tab_wode",
                                                  CYLTabBarItemSelectedImage : @"tab_wode_light"};
    NSArray *tabBarItemsAttributes = @[firstTabBarItemsAttributes,
                                       secondTabBarItemsAttributes,
                                       thirdTabBarItemsAttributes,
                                       fourthTabBarItemsAttributes];
    return tabBarItemsAttributes;
}

- (void)customizeTabBarAppearance:(CYLTabBarController *)tabBarController {
    // 自定义TabBar高度
     tabBarController.tabBarHeight = 44.f;
    
    // 普通状态下的文字属性
    NSMutableDictionary *normalAttrs = [NSMutableDictionary dictionary];
    normalAttrs[NSForegroundColorAttributeName] = SSTabNomalColor;
    normalAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:10];
    
    // 选中状态下的文字属性
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSForegroundColorAttributeName] = SSTabSelectColor;
    selectedAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    
    // 设置文字属性
    UITabBarItem *tabBar = [UITabBarItem appearance];
    [tabBar setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
    [tabBar setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
    
    // 设置TabBar阴影
    [[UITabBar appearance] setBackgroundImage:[[UIImage alloc] init]];
    [[UITabBar appearance] setBackgroundColor:[UIColor whiteColor]];
    [[UITabBar appearance] setShadowImage:[UIImage imageNamed:@"tab_yinying"]];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
