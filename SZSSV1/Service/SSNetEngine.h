//
//  SSNetEngine.h
//  SZSSV1
//
//  Created by DaLei on 2017/3/31.
//  Copyright © 2017年 DaLei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#import "SSObject.h"

typedef void(^SuccessBlock)(SSObject *responseObject);
typedef void(^FailureBlock)(NSString *error);

@interface SSNetEngine : NSObject

+(SSNetEngine *)engine;

-(void)getProductList:(SSObject *)requestObject successBlock:(SuccessBlock)successBlock failureBlock:(FailureBlock)failureBlock;


@end
