//
//  SSBaseNavigationController.m
//  SZSSV1
//
//  Created by DaLei on 2017/3/30.
//  Copyright © 2017年 DaLei. All rights reserved.
//

#import "SSBaseNavigationController.h"

@interface SSBaseNavigationController ()

@end

@implementation SSBaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}

@end
