//
//  SSNetworkingManager.h
//  SZSSV1
//
//  Created by DaLei on 2017/6/10.
//  Copyright © 2017年 DaLei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>
#import "SSConfig.h"

@class SSImageModel;

typedef void (^ _Nullable Success)(id _Nullable responseObject);// 成功Block
typedef void (^ _Nullable Failure)(NSError * _Nullable error);// 失败Blcok
typedef void (^ _Nullable Progress)(NSProgress * _Nullable progress);// 上传或者下载进度Block
typedef NSURL * _Nullable (^ _Nullable Destination)(NSURL * _Nullable targetPath, NSURLResponse * _Nullable response);// 返回URL的Block
typedef void (^ _Nullable DownLoadSuccess)(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath);// 下载成功的Blcok

/**
 对AF进行简单封装
 */
@interface SSNetworkingManager : AFHTTPSessionManager

/**
 单利方法

 @return 实例
 */
+(instancetype _Nonnull )shareManager;

/**
 *  封装的GET请求
 *
 *  @param URLString  请求的链接
 *  @param parameters 请求的参数
 *  @param success    请求成功回调
 *  @param failure    请求失败回调
 */
- (void)GET:(NSString *_Nonnull)URLString parameters:(NSDictionary *_Nullable)parameters success:(Success)success failure:(Failure)failure;

/**
 *  封装的POST请求
 *
 *  @param URLString  请求的链接
 *  @param parameters 请求的参数
 *  @param success    请求成功回调
 *  @param failure    请求失败回调
 */
- (void)POST:(NSString *_Nonnull)URLString parameters:(NSDictionary *_Nullable)parameters success:(Success)success failure:(Failure)failure;

/**
 *  封装POST图片上传(多张图片) // 可扩展成多个别的数据上传如:mp3等
 *
 *  @param URLString  请求的链接
 *  @param parameters 请求的参数
 *  @param picArray   存放图片模型(HDPicModle)的数组
 *  @param progress   进度的回调
 *  @param success    发送成功的回调
 *  @param failure    发送失败的回调
 */
- (void)POST:(NSString *_Nonnull)URLString parameters:(NSDictionary *_Nullable)parameters andPicArray:(NSArray *_Nullable)picArray progress:(Progress)progress success:(Success)success failure:(Failure)failure;

/**
 *  封装POST图片上传(单张图片) // 可扩展成单个别的数据上传如:mp3等
 *
 *  @param URLString  请求的链接
 *  @param parameters 请求的参数
 *  @param imageModle   上传的图片模型
 *  @param progress   进度的回调
 *  @param success    发送成功的回调
 *  @param failure    发送失败的回调
 */
- (void)POST:(NSString *_Nonnull)URLString parameters:(NSDictionary *_Nullable)parameters andPic:(SSImageModel *_Nullable)imageModle progress:(Progress)progress success:(Success)success failure:(Failure)failure;

/**
 *  封装POST上传url资源
 *
 *  @param URLString  请求的链接
 *  @param parameters 请求的参数
 *  @param imageModle   上传的图片模型(资源的url地址)
 *  @param progress   进度的回调
 *  @param success    发送成功的回调
 *  @param failure    发送失败的回调
 */
- (void)POST:(NSString *_Nonnull)URLString parameters:(NSDictionary *_Nullable)parameters andPicUrl:(SSImageModel *_Nullable)imageModle progress:(Progress)progress success:(Success)success failure:(Failure)failure;

/**
 *  下载
 *
 *  @param URLString       请求的链接
 *  @param progress        进度的回调
 *  @param destination     返回URL的回调
 *  @param downLoadSuccess 发送成功的回调
 *  @param failure         发送失败的回调
 */
- (NSURLSessionDownloadTask *_Nonnull)downLoadWithURL:(NSString *_Nonnull)URLString progress:(Progress)progress destination:(Destination)destination downLoadSuccess:(DownLoadSuccess)downLoadSuccess failure:(Failure)failure;

@end

