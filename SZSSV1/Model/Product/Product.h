//
//  Product.h
//  SZSSV1
//
//  Created by DaLei on 2017/4/1.
//  Copyright © 2017年 DaLei. All rights reserved.
//

#import "SSObject.h"

@interface ProductListPara : SSObject

@property(nonatomic,strong)NSString*productId;
@property(nonatomic,strong)NSString*productName;
@property(nonatomic,strong)NSString*productCategory;
@property(nonatomic,strong)NSNumber*productState;
@property(nonatomic,strong)NSNumber*pageCurrent;

@end

@interface ProductList : SSObject

@property(nonatomic,strong)NSString*resCode;
@property(nonatomic,strong)NSString*resDesc;
@property(nonatomic,strong)NSNumber*pageCurrent;
@property(nonatomic,strong)NSNumber*pageMore;
@property(nonatomic,strong)NSArray*arrayList;

@end

@interface Product : SSObject

@property(nonatomic,strong)NSString*productId;
@property(nonatomic,strong)NSString*productName;
@property(nonatomic,strong)NSString*productCategory;
@property(nonatomic,strong)NSNumber*productState;
@property(nonatomic,strong)NSString*addDate;

@end
