//
//  SSImageModel.h
//  SZSSV1
//
//  Created by DaLei on 2017/6/10.
//  Copyright © 2017年 DaLei. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SSImageModel : NSObject

/**
 *  上传的图片的名字
 */
@property (nonatomic, copy) NSString *imageName;

/**
 *  上传的图片
 */
@property (nonatomic, strong, nullable) UIImage *image;

/**
 *  上传的二进制文件
 */
@property (nonatomic, strong) NSData *imageData;

/**
 *  上传的资源url
 */
@property (nonatomic, copy) NSString *url;


@end

NS_ASSUME_NONNULL_END
