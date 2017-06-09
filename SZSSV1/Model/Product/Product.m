//
//  Product.m
//  SZSSV1
//
//  Created by DaLei on 2017/4/1.
//  Copyright © 2017年 DaLei. All rights reserved.
//

#import "Product.h"

@implementation ProductListPara

@end

@implementation ProductList

-(void)setValue:(id)value forKey:(NSString *)key {
    if([key isEqualToString:@"arrayList"]) {
        NSMutableArray *tempArray = [NSMutableArray arrayWithCapacity:0];
        for(NSMutableDictionary *productDict in value) {
            Product *product = [[Product alloc] initWithDictionary:productDict];
            [tempArray addObject:product];
        }
        self.arrayList = [NSArray arrayWithArray:tempArray];
    } else
        [super setValue:value forKey:key];
}

@end

@implementation Product

@end
