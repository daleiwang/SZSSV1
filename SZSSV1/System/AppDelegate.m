//
//  AppDelegate.m
//  SZSSV1
//
//  Created by DaLei on 2017/3/30.
//  Copyright © 2017年 DaLei. All rights reserved.
//

#import "AppDelegate.h"
#import "AFNetworking.h"
#import "CYLTabBarControllerConfig.h"
#import "CYLPlusButtonSubclass.h"
#import "SRNewFeaturesViewController.h"
#import "SSConfig.h"
#import <AFNetworking.h>

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    // 设置主窗口,并设置根控制器
    self.window = [[UIWindow alloc]init];
    self.window.frame = [UIScreen mainScreen].bounds;
    
    //TabBar初始化
    [CYLPlusButtonSubclass registerPlusButton];
    CYLTabBarControllerConfig *tabBarControllerConfig = [[CYLTabBarControllerConfig alloc] init];
    
    
//    if ([SRNewFeaturesViewController sr_shouldShowNewFeature]) {
        NSArray *imageNames = @[@"load1.png", @"load2.png", @"load3.png"];
        SRNewFeaturesViewController *newFeaturesVC = [SRNewFeaturesViewController sr_newFeatureWithImageNames:imageNames
                                                                                           rootViewController:tabBarControllerConfig.tabBarController];
        newFeaturesVC.hideSkipButton = NO; // show skip Button
        self.window.rootViewController = newFeaturesVC;
//    } else {
//        self.window.rootViewController = tabBarControllerConfig.tabBarController;
//    }
    
    
//    [self.window setRootViewController:tabBarControllerConfig.tabBarController];
    [self.window makeKeyAndVisible];
    
    // 设置导航
    [self setupNavBar];
    
    // 监听网络
    [self monitorNetworkStatus];
    
    
    [self login];
    
//    NSLog(@"familyNames：%@",[UIFont familyNames]);
    
    return YES;
}

-(void)login {
    
//    NSDictionary *dict = [requestObject objectAsDictionary];
    NSString *url = @"http://localhost:8080/moxi-0.0.1-SNAPSHOT/app/login1?userName=xxx&password=123456";
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSLog(@"%@",responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
    
    
    
//    [manager POST:url parameters:dict progress:nil success:^(NSURLSessionDataTask *task, id responseObject) {
//        ProductList *plist = [[ProductList alloc]initWithDictionary:responseObject];
//        NSLog(@"%@",plist.description);
//        successBlock(plist);
//    } failure:^(NSURLSessionDataTask *task, NSError *error) {
//        NSLog(@"%@",error.description);
//        failureBlock(error.description);
//    }];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - setup

- (void)monitorNetworkStatus {
    //1.创建网络监测者
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        //这里是监测到网络改变的block  可以写成switch方便
        //在里面可以随便写事件
        switch (status) {
            case AFNetworkReachabilityStatusUnknown:
                NSLog(@"未知网络状态");
                break;
            case AFNetworkReachabilityStatusNotReachable:
                NSLog(@"无网络");
                break;
            case AFNetworkReachabilityStatusReachableViaWWAN:
                NSLog(@"蜂窝数据网");
                break;
            case AFNetworkReachabilityStatusReachableViaWiFi:
                NSLog(@"WiFi网络");
                break;
            default:
                break;
        }
    }] ;
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
}

- (void)setupNavBar {
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    UINavigationBar *bar = [UINavigationBar appearance];
    //导航颜色
    bar.barTintColor = SSNavBarColor;
    //字体颜色
    bar.tintColor = SSNavBarTitleColor;
    bar.titleTextAttributes = @{NSForegroundColorAttributeName : SSNavBarTitleColor};
}

@end
