//
//  SSImageModel.m
//  SZSSV1
//
//  Created by DaLei on 2017/6/10.
//  Copyright © 2017年 DaLei. All rights reserved.
//

#import "SSImageModel.h"

@implementation SSImageModel

- (NSString *)description {
    return [NSString stringWithFormat:@"<%@ : %p> \n{imageName : %@ \n image : %@ \n}", [self class], self,self.imageName, self.image];
}


@end
