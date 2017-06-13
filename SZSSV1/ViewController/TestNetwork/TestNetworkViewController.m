//
//  TestNetworkViewController.m
//  SZSSV1
//
//  Created by DaLei on 2017/6/13.
//  Copyright © 2017年 DaLei. All rights reserved.
//

#import "TestNetworkViewController.h"
#import "SSNetworkingManager.h"
#import "SSImageModel.h"

@interface TestNetworkViewController ()

@end

@implementation TestNetworkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)GET:(id)sender{
    NSDictionary *dict = @{@"userName":@"xxx",@"password":@"yyy"};
    
    [[SSNetworkingManager shareManager] SSGET:@"app/login" parameters:dict success:^(id _Nullable responseObject) {
    } failure:^(NSError * _Nullable error) {
    }];
}

-(IBAction)POST:(id)sender{
    NSDictionary *dict = @{@"userName":@"xxx",@"password":@"yyy"};
    
    [[SSNetworkingManager shareManager] SSPOST:@"app/register" parameters:dict success:^(id  _Nullable responseObject) {
    } failure:^(NSError * _Nullable error) {
    }];
}

-(IBAction)UPLOAD:(id)sender{
    NSDictionary *dict = @{@"userName":@"xxx",@"password":@"yyy"};
    SSImageModel *imageModel = [SSImageModel new];
    imageModel.imageName = @"imageFile";
    imageModel.image = [UIImage imageNamed:@"load1.png"];
    
    [[SSNetworkingManager shareManager] SSPOST:@"app/upload" parameters:dict andPic:imageModel progress:^(NSProgress * _Nullable progress) {
        
    } success:^(id  _Nullable responseObject) {
        
    } failure:^(NSError * _Nullable error) {
        
    }];
}

-(IBAction)UPLOADS:(id)sender{
    NSDictionary *dict = @{@"userName":@"xxx",@"password":@"yyy"};
    
    SSImageModel *imageModel1 = [SSImageModel new];
    imageModel1.imageName = @"imageFile";
    imageModel1.image = [UIImage imageNamed:@"load1.png"];
    
    SSImageModel *imageModel2 = [SSImageModel new];
    imageModel2.imageName = @"imageFile";
    imageModel2.image = [UIImage imageNamed:@"load2.png"];
    
    SSImageModel *imageModel3 = [SSImageModel new];
    imageModel3.imageName = @"imageFile";
    imageModel3.image = [UIImage imageNamed:@"load3.png"];
    
    NSArray *array = @[imageModel1,imageModel2,imageModel3];
    
    [[SSNetworkingManager shareManager] SSPOST:@"app/uploads" parameters:dict andPicArray:array progress:^(NSProgress * _Nullable progress) {
        
    } success:^(id  _Nullable responseObject) {
        
    } failure:^(NSError * _Nullable error) {
        
    }];
}

-(IBAction)UPLOADURL:(id)sender{
    NSDictionary *dict = @{@"userName":@"xxx",@"password":@"yyy"};
    SSImageModel *imageModel1 = [SSImageModel new];
    NSString *newPath=[[NSBundle mainBundle] pathForResource:@"Icon@3x" ofType:@"png"];
    imageModel1.url = newPath;
    imageModel1.imageName = @"imageFile";
    
    [[SSNetworkingManager shareManager] SSPOST:@"app/upload" parameters:dict andPicUrl:imageModel1 progress:^(NSProgress * _Nullable progress) {
        
    } success:^(id  _Nullable responseObject) {
        
    } failure:^(NSError * _Nullable error) {
        
    }];
    
}

-(IBAction)DOWNLOAD:(id)sender{
    
    [[SSNetworkingManager shareManager] SSdownLoadWithURL:@"http://localhost:8080/moxi-0.0.1-SNAPSHOT/userfiles/20170612110517.png" progress:^(NSProgress * _Nullable progress) {
        
    } destination:^NSURL * _Nullable(NSURL * _Nullable targetPath, NSURLResponse * _Nullable response) {
        
        NSURL *documentsDirectoryURL = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:nil];

        return [documentsDirectoryURL URLByAppendingPathComponent:[response suggestedFilename]];
        
    } downLoadSuccess:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath) {
        
        NSLog(@"response:%@,filePath:%@",response,filePath);
        
        //判断目录里面是否存在这个图片
        NSFileManager*fileManager = [NSFileManager defaultManager];
        BOOL isFile = [fileManager fileExistsAtPath:[filePath path]];
        if (isFile) {
            //更新界面需要使用主线程
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置图片视图的的图片
                self.imageVC.image = [UIImage imageWithContentsOfFile:[filePath path]];
            });
        }
        
    } failure:^(NSError * _Nullable error) {
        
    }];
}


@end
