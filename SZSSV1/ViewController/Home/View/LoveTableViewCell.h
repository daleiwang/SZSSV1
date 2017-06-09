//
//  LoveTableViewCell.h
//  SZSSV1
//
//  Created by DaLei on 2017/6/3.
//  Copyright © 2017年 DaLei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoveTableViewCell : UITableViewCell

@property (nonatomic, strong) UIView* viewCell;
@property (nonatomic, strong) UIView* viewText;
@property (nonatomic, strong) UIView* viewFoot;


@property (nonatomic, strong) UILabel* labTitle;
@property (nonatomic, strong) UILabel* labContent;
@property (nonatomic, strong) UILabel* labMore;


@property (nonatomic, strong) UIImageView* imageDate;
@property (nonatomic, strong) UILabel* labTimes;
@property (nonatomic, strong) UILabel* labDate;


@property (nonatomic, strong) UILabel* labAuthor1;
@property (nonatomic, strong) UILabel* labAuthor2;


@property (nonatomic, strong) UILabel* labLike;
@property (nonatomic, strong) UILabel* labCount;
@property (nonatomic, strong) UIImageView* imageLike;
@property (nonatomic, strong) UIImageView* imageCount;

@end
