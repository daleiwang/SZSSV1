//
//  SSObject.h
//  SZSSV1
//
//  Created by DaLei on 2017/3/31.
//  Copyright © 2017年 DaLei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SSObject : NSObject <NSCopying, NSMutableCopying>

@property NSMutableDictionary *unmappedEntries;

+(id)map:(id)data usingClass:(Class) klass;

-(id)initWithDictionary:(NSDictionary *)jsonObject;

-(NSString *)jsonString;

-(NSDictionary*) classesForMapping;

-(NSDictionary*) equivalentKeys;

- (NSDictionary *)objectAsDictionary;
    
-(void) mappingDidComplete;

- (NSMutableDictionary *)requestDictionary;

- (NSMutableDictionary *)requestDictionarySmall;

@end
