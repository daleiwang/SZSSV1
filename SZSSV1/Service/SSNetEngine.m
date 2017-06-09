//
//  SSNetEngine.m
//  SZSSV1
//
//  Created by DaLei on 2017/3/31.
//  Copyright © 2017年 DaLei. All rights reserved.
//

#import "SSNetEngine.h"
#import "Product.h"

@implementation SSNetEngine

+(SSNetEngine *)engine {
    static SSNetEngine *ssNetEngine = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate,^{
        ssNetEngine = [[self alloc] init];
    });
    return ssNetEngine;
}

-(void)getProductList:(SSObject *)requestObject successBlock:(SuccessBlock)successBlock failureBlock:(FailureBlock)failureBlock{
    NSDictionary *dict = [requestObject objectAsDictionary];
    NSString *url = @"http://localhost:8080/SSTest/admin/product1_2.do";
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager POST:url parameters:dict progress:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        ProductList *plist = [[ProductList alloc]initWithDictionary:responseObject];
        NSLog(@"%@",plist.description);
        successBlock(plist);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"%@",error.description);
        failureBlock(error.description);
    }];
}




@end
