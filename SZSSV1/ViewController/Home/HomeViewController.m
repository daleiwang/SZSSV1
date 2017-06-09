//
//  HomeViewController.m
//  SZSSV1
//
//  Created by DaLei on 2017/6/3.
//  Copyright © 2017年 DaLei. All rights reserved.
//

#import "HomeViewController.h"
#import "LoveListViewController.h"
#import "MenuInfo.h"

@interface HomeViewController ()

@property (nonatomic, strong)  NSArray *menuList;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.magicView.navigationHeight = 36;
    self.magicView.headerView.backgroundColor = RGBCOLOR(214, 203, 232);
    self.magicView.layoutStyle = VTLayoutStyleDivide;
    self.magicView.navigationColor = RGBCOLOR(214, 203, 232);
    self.magicView.sliderColor = RGBCOLOR(93, 61, 34);
    [self.magicView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 变量

-(NSArray*)menuList{
    if(!_menuList){
        _menuList = @[[MenuInfo menuInfoWithTitl:@"最新"],[MenuInfo menuInfoWithTitl:@"最热"],[MenuInfo menuInfoWithTitl:@"推荐"],[MenuInfo menuInfoWithTitl:@"恋爱宝典"]];
    }
    return _menuList;
}

#pragma mark - VTMagicViewDataSource

- (NSArray<NSString *> *)menuTitlesForMagicView:(VTMagicView *)magicView {
    NSMutableArray *titleList = [NSMutableArray array];
    for (MenuInfo *menu in self.menuList) {
        [titleList addObject:menu.title];
    }
    return titleList;
}

- (UIButton *)magicView:(VTMagicView *)magicView menuItemAtIndex:(NSUInteger)itemIndex {
    static NSString *itemIdentifier = @"itemIdentifier";
    UIButton *menuItem = [magicView dequeueReusableItemWithIdentifier:itemIdentifier];
    if (!menuItem) {
        menuItem = [UIButton buttonWithType:UIButtonTypeCustom];
        [menuItem setTitleColor:RGBCOLOR(159, 138, 187) forState:UIControlStateNormal];
        [menuItem setTitleColor:RGBCOLOR(90, 57, 131) forState:UIControlStateSelected];
        menuItem.titleLabel.font = [UIFont fontWithName:@"Helvetica" size:12.f];
    }
    return menuItem;
}

- (UIViewController *)magicView:(VTMagicView *)magicView viewControllerAtPage:(NSUInteger)pageIndex {
    MenuInfo *menuInfo = _menuList[pageIndex];
    static NSString *gridId = @"grid.identifier";
    LoveListViewController *viewController = [magicView dequeueReusablePageWithIdentifier:gridId];
    if (!viewController) {
        viewController = [[LoveListViewController alloc] init];
    }
    viewController.menuInfo = menuInfo;
    return viewController;
}


#pragma mark - VTMagicViewDelegate

- (void)magicView:(VTMagicView *)magicView viewDidAppear:(__kindof UIViewController *)viewController atPage:(NSUInteger)pageIndex {
    //    NSLog(@"index:%ld viewDidAppear:%@", (long)pageIndex, viewController.view);
}

- (void)magicView:(VTMagicView *)magicView viewDidDisappear:(__kindof UIViewController *)viewController atPage:(NSUInteger)pageIndex {
    //    NSLog(@"index:%ld viewDidDisappear:%@", (long)pageIndex, viewController.view);
}

- (void)magicView:(VTMagicView *)magicView didSelectItemAtIndex:(NSUInteger)itemIndex {
    //    NSLog(@"didSelectItemAtIndex:%ld", (long)itemIndex);
}

#pragma mark - Actions


#pragma mark - methods




@end
