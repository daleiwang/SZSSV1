//
//  SSConfig.h
//  SZSSV1
//
//  Created by DaLei on 2017/4/1.
//  Copyright © 2017年 DaLei. All rights reserved.
//

#import <Foundation/Foundation.h>

//日志打印
#ifdef DEBUG
#define SSLog(...) NSLog(@"%s 第%d行 \n %@\n\n",__func__,__LINE__,[NSString stringWithFormat:__VA_ARGS__])
#else
#define SSLog(...)
#endif

//屏幕宽高
#define SCREEN_WIDTH   [UIScreen mainScreen].bounds.size.width
#define SCREENH_HEIGHT [UIScreen mainScreen].bounds.size.height
//通知中心
#define SSNotificationCenter [NSNotificationCenter defaultCenter]

//RGB颜色
#define SSRGBColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
//RGB颜色and透明度
#define SSRGBAColor(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(r)/255.0 blue:(r)/255.0 alpha:a]
//RGB颜色clear
#define SSClearColor [UIColor clearColor]
//RGB颜色随机
#define SSRandomColor [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0]
//Tab正常颜色
#define SSTabNomalColor SSRGBColor(214, 214, 214)
//Tab选中颜色
#define SSTabSelectColor SSRGBColor(151, 125, 190)
//导航颜色
#define SSNavBarColor SSRGBColor(151, 125, 190)
//导航文字颜色
#define SSNavBarTitleColor SSRGBColor(240, 240, 240)
//页面背景
#define SSBackgroundColor SSRGBColor(237, 237, 237)






