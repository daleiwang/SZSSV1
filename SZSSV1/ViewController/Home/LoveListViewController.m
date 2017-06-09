//
//  LoveListViewController.m
//  SZSSV1
//
//  Created by DaLei on 2017/6/3.
//  Copyright © 2017年 DaLei. All rights reserved.
//

#import "LoveListViewController.h"
#import "LoveTableViewCell.h"
#import "SSConfig.h"

@interface LoveListViewController ()

@end

@implementation LoveListViewController

- (void)viewDidLoad {
    
    self.view.backgroundColor = SSBackgroundColor;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"LoveTableViewCell";
    
    LoveTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[LoveTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
//    [cell.labAuthor1 setText:@"你你你你你你牛"];
    
    
    return cell;

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 350;
}


@end
