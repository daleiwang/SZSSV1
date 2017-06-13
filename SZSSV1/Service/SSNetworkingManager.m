//
//  SSNetworkingManager.m
//  SZSSV1
//
//  Created by DaLei on 2017/6/10.
//  Copyright © 2017年 DaLei. All rights reserved.
//

#import "SSNetworkingManager.h"
#import "SSImageModel.h"

@implementation SSNetworkingManager

+(instancetype)shareManager{
    static SSNetworkingManager *manager = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        manager = [[self alloc] initWithBaseURL:[NSURL URLWithString:URL_BASE]];
    });
    return manager;
}

/**
 重写父类方法

 @param url baseUrl
 @return 通过重写夫类的initWithBaseURL方法,返回网络请求类的实例
 */
-(instancetype)initWithBaseURL:(NSURL *)url{
    if (self = [super initWithBaseURL:url]) {
        /**设置请求超时时间*/
        self.requestSerializer.timeoutInterval = 30;
        
        /**设置相应的缓存策略*/
        self.requestSerializer.cachePolicy = NSURLRequestReloadIgnoringLocalCacheData;
        
        /**将token封装入请求头*/
        [self.requestSerializer setValue:@"TOKEN" forHTTPHeaderField:@"TOKENID"];
        
        /**设置可接受的类型*/
        [self.responseSerializer setAcceptableContentTypes:[NSSet setWithObjects:@"text/plain",@"application/json",@"text/json",@"text/javascript",@"text/html", nil]];
        
        /**设置请求和返回数据格式*/
        self.requestSerializer = [AFHTTPRequestSerializer serializer];
        self.responseSerializer = [AFJSONResponseSerializer serializer];
    }
    
    return self;
}

/**
 *  封装的get请求
 *
 *  @param URLString  请求的链接
 *  @param parameters 请求的参数
 *  @param success    请求成功回调
 *  @param failure    请求失败回调
 */
- (void)SSGET:(NSString *)URLString parameters:(NSDictionary *)parameters success:(Success)success failure:(Failure)failure {
    
    SSLog(@"\n请求链接地址---> %@",URLString);
    
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    
    [self GET:URLString parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if (success) {
            SSLog(@"请求成功，返回数据 : %@",responseObject);
            success(responseObject);
        }
        
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (failure) {
            SSLog(@"请求失败：%@",error);
            failure(error);
        }
        
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
    }];
}

/**
 *  封装的POST请求
 *
 *  @param URLString  请求的链接
 *  @param parameters 请求的参数
 *  @param success    请求成功回调
 *  @param failure    请求失败回调
 */
- (void)SSPOST:(NSString *)URLString parameters:(NSDictionary *)parameters success:(Success)success failure:(Failure)failure {
    
    SSLog(@"\n请求链接地址---> %@",URLString);
    
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES]; // 开启状态栏动画
    
    [self POST:URLString parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if (success) {
            SSLog(@"请求成功，返回数据 : %@",responseObject);
            success(responseObject);
        }
        
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO]; // 关闭状态栏动画
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (failure) {
            SSLog(@"请求失败：%@",error);
            failure(error);
        }
        
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO]; // 关闭状态栏动画
    }];
}

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
- (void)SSPOST:(NSString *)URLString parameters:(NSDictionary *)parameters andPicArray:(NSArray *)picArray progress:(Progress)progress success:(Success)success failure:(Failure)failure {
    
    SSLog(@"\n请求链接地址---> %@",URLString);
    
    [self POST:URLString parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        NSInteger count = picArray.count;
        NSString *fileName = @"";
        NSData *data = [NSData data];
        
        for (int i = 0; i < count; i++) {
            @autoreleasepool {
                SSImageModel *picModle = picArray[i];
                fileName = [NSString stringWithFormat:@"pic%02d.jpg", i];
                
                /**
                 *  压缩图片然后再上传(1.0代表无损 0~~1.0区间)
                 */
                data = UIImageJPEGRepresentation(picModle.image, 1.0);
                
                [formData appendPartWithFileData:data name:picModle.imageName fileName:fileName mimeType:@"image/jpeg"];
                data = nil;
                picModle.image = nil;
            }
        }
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
        if (progress) {
            progress(uploadProgress); // HDLog(@"%lf", 1.0 * uploadProgress.completedUnitCount / uploadProgress.totalUnitCount);
        }
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if (success) {
            SSLog(@"请求成功，返回数据 : %@",responseObject);
            success(responseObject);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (failure) {
            SSLog(@"请求失败：%@",error);
            failure(error);
        }
    }];
}

/**
 *  封装POST图片上传(单张图片) // 可扩展成单个别的数据上传如:mp3等
 *
 *  @param URLString  请求的链接
 *  @param parameters 请求的参数
 *  @param picModle   上传的图片模型
 *  @param progress   进度的回调
 *  @param success    发送成功的回调
 *  @param failure    发送失败的回调
 */
- (void)SSPOST:(NSString *)URLString parameters:(NSDictionary *)parameters andPic:(SSImageModel *)picModle progress:(Progress)progress success:(Success)success failure:(Failure)failure {
    
    SSLog(@"\n请求链接地址---> %@",URLString);
    
    [self POST:URLString parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        /**
         *  压缩图片然后再上传(1.0代表无损 0~~1.0区间)
         */
        NSData *data = UIImageJPEGRepresentation(picModle.image, 1.0);
        
        NSString *fileName = [NSString stringWithFormat:@"%@.jpg", picModle.imageName];
        
        [formData appendPartWithFileData:data name:picModle.imageName fileName:fileName mimeType:@"image/jpeg"];
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
        if (progress) {
            progress(uploadProgress);
            SSLog(@"%lf", 1.0 * uploadProgress.completedUnitCount / uploadProgress.totalUnitCount);
        }
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if (success) {
            SSLog(@"请求成功，返回数据 : %@",responseObject);
            success(responseObject);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (failure) {
            SSLog(@"请求失败：%@",error);
            failure(error);
        }
    }];
}

/**
 *  封装POST上传url资源
 *
 *  @param URLString  请求的链接
 *  @param parameters 请求的参数
 *  @param picModle   上传的图片模型(资源的url地址)
 *  @param progress   进度的回调
 *  @param success    发送成功的回调
 *  @param failure    发送失败的回调
 */
- (void)SSPOST:(NSString *)URLString parameters:(NSDictionary *)parameters andPicUrl:(SSImageModel *)picModle progress:(Progress)progress success:(Success)success failure:(Failure)failure {
    
    SSLog(@"\n请求链接地址---> %@",URLString);
    
    [self POST:URLString parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        NSString *fileName = [NSString stringWithFormat:@"%@.jpg", picModle.imageName];
        // 根据本地路径获取url(相册等资源上传)
        NSURL *url = [NSURL fileURLWithPath:picModle.url]; // [NSURL URLWithString:picModle.url] 可以换成网络的图片在上传
        
        [formData appendPartWithFileURL:url name:picModle.imageName fileName:fileName mimeType:@"application/octet-stream" error:nil];
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
        if (progress) {
            progress(uploadProgress);
            SSLog(@"%lf", 1.0 * uploadProgress.completedUnitCount / uploadProgress.totalUnitCount);
        }
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if (success) {
            SSLog(@"请求成功，返回数据 : %@",responseObject);
            success(responseObject);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (failure) {
            SSLog(@"请求失败：%@",error);
            failure(error);
        }
    }];
}

/**
 *  下载
 *
 *  @param URLString       请求的链接
 *  @param progress        进度的回调
 *  @param destination     返回URL的回调
 *  @param downLoadSuccess 发送成功的回调
 *  @param failure         发送失败的回调
 */
- (NSURLSessionDownloadTask *)SSdownLoadWithURL:(NSString *)URLString progress:(Progress)progress destination:(Destination)destination downLoadSuccess:(DownLoadSuccess)downLoadSuccess failure:(Failure)failure {
    
    SSLog(@"\n请求链接地址---> %@",URLString);
    
    NSURL *url = [NSURL URLWithString:URLString];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    // 下载任务
    NSURLSessionDownloadTask *task = [self downloadTaskWithRequest:request progress:^(NSProgress * _Nonnull downloadProgress) {
        
        if (progress) {
            progress(downloadProgress);
            SSLog(@"%lf", 1.0 * downloadProgress.completedUnitCount / downloadProgress.totalUnitCount);
        }
        
    } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
        
        if (destination) {
            return destination(targetPath, response);
        } else {
            return nil;
        }
        
    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
        
        if (error) {
            SSLog(@"请求失败：%@",error);
            failure(error);
        } else {
            SSLog(@"请求成功，返回数据 : %@",response);
            downLoadSuccess(response, filePath);
        }
    }];
    
    // 开始启动任务
    [task resume];
    
    return task;
}


@end
