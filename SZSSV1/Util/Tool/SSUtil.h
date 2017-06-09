//
//  SSUtil.h
//  SZSSV1
//
//  Created by DaLei on 2017/4/1.
//  Copyright © 2017年 DaLei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface SSUtil : NSObject

//设置行间距
+(void)setLabelSpace:(UILabel*)label withValue:(NSString*)str withFont:(UIFont*)font;

//计算UILabel的高度(带有行间距的情况)
+(CGFloat)getSpaceLabelHeight:(NSString*)str withFont:(UIFont*)font withWidth:(CGFloat)width;

@end
