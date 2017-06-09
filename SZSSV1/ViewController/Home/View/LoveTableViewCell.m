//
//  LoveTableViewCell.m
//  SZSSV1
//
//  Created by DaLei on 2017/6/3.
//  Copyright © 2017年 DaLei. All rights reserved.
//

#import "LoveTableViewCell.h"
#import "SSConfig.h"
#import "Masonry.h"

@implementation LoveTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.backgroundColor = [UIColor clearColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        NSString *strTitle = @"阿花今年二十八";
        NSString *strContent = @"我爱你\n绝不学攀援的凌霄花攀援的凌霄花攀援的凌霄花\n接你的高枝炫耀自己\n也不像鸟儿\n为你重复单调的歌曲\n甚至源泉\n常年送来清凉的慰藉\n也不像鸟儿\n为你重复单调的歌曲\n甚至源泉\n常年送来清凉的慰藉年送来清凉的慰藉也不像鸟儿也不像鸟儿\n也不像鸟儿\n为你重复单调的歌曲\n甚至源泉\n常年送来清凉的慰藉\n也不像鸟儿\n为你重复单调的歌曲\n甚至源泉\n常年送来清凉的慰藉\n也不像鸟儿\n为你重复单调的歌曲\n甚至源泉\n常年送来清凉的慰藉\n也不像鸟儿\n为你重复单调的歌曲\n甚至源泉\n常年送来清凉的慰藉\n也不像鸟儿\n为你重复单调的歌曲\n甚至源泉\n常年送来清凉的慰藉";
        NSString *strTimes = @"第一首";
        NSString *strDate = @"1990.01.01";
        NSString *strBy = @"by:";
        NSString *strName = @"游吟诗人";
        NSString *strHeart = @"100";
        NSString *strCount = @"100";
        
        
        
        
        _viewCell = [UIView new];
        _viewCell.backgroundColor = [UIColor whiteColor];
        [self addSubview:_viewCell];
        [_viewCell mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, 10, 0));
        }];
        
        _viewText = [UIView new];
        _viewText.backgroundColor = [UIColor whiteColor];
        [_viewCell addSubview:_viewText];
        [_viewText mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, 90, 0));
        }];
        
        _viewFoot = [UIView new];
        _viewFoot.backgroundColor = [UIColor whiteColor];
        [_viewCell addSubview:_viewFoot];
        [_viewFoot mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(0);
            make.right.mas_equalTo(0);
            make.height.mas_equalTo(90);
            make.bottom.mas_equalTo(0);
        }];
        
        
        
        
        
        
        
        
        _labTitle = [[UILabel alloc] initWithFrame:CGRectZero];
        _labTitle.textAlignment = NSTextAlignmentCenter;
        _labTitle.textColor =  SSRGBColor(117, 117, 117);
        _labTitle.font = [UIFont systemFontOfSize:12];
        [_labTitle setText:strTitle];
        [_viewText addSubview:_labTitle];
        [_labTitle mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(_viewText);
            make.top.mas_equalTo(10);
        }];
 
        _labMore = [[UILabel alloc] initWithFrame:CGRectZero];
        _labMore.textAlignment = NSTextAlignmentCenter;
        _labMore.textColor =  SSRGBColor(117, 117, 117);
        _labMore.font = [UIFont systemFontOfSize:14];
        [_labMore setText:@"……"];
        [_viewText addSubview:_labMore];
        [_labMore mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(30);
            make.right.mas_equalTo(-30);
            make.bottom.mas_equalTo(0);
            make.height.mas_equalTo(18);
        }];
        
        NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:strContent];
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        paragraphStyle.alignment = NSTextAlignmentCenter;
        [paragraphStyle setLineSpacing:6];
        [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [strContent length])];
        _labContent = [[UILabel alloc] initWithFrame:CGRectZero];
        _labContent.numberOfLines = 0;
        _labContent.textAlignment = NSTextAlignmentCenter;
        _labContent.textColor =  SSRGBColor(117, 117, 117);
        _labContent.font = [UIFont systemFontOfSize:12];
        _labContent.attributedText = attributedString;
        [_viewText addSubview:_labContent];
        [_labContent mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(_labTitle.mas_bottom);
            make.bottom.mas_equalTo(_labMore.mas_top);
            make.left.mas_equalTo(30);
            make.right.mas_equalTo(-30);
        }];
        
        
        
        
        
        
        
        
        
        
        
        
        _imageDate = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"dateCell"]];
        [_viewFoot addSubview:_imageDate];
        [_imageDate mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(_viewFoot);
            make.centerY.equalTo(_viewFoot).offset(-10);
            make.size.mas_equalTo(CGSizeMake(50, 50));
        }];
        
        _labTimes =  [[UILabel alloc] initWithFrame:CGRectZero];
        _labTimes.textAlignment = NSTextAlignmentCenter;
        _labTimes.textColor =  SSRGBColor(166, 166, 166);
        _labTimes.backgroundColor = [UIColor clearColor];
        _labTimes.adjustsFontSizeToFitWidth = YES;
        [_labTimes setText:strTimes];
        [_viewFoot addSubview:_labTimes];
        [_labTimes mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(44);
            make.centerX.equalTo(_imageDate);
            make.bottom.mas_equalTo(_imageDate.mas_centerY);
        }];
        
        _labDate = [[UILabel alloc] initWithFrame:CGRectZero];
        _labDate.textAlignment = NSTextAlignmentCenter;
        _labDate.textColor =  SSRGBColor(166, 166, 166);
        _labDate.backgroundColor = [UIColor clearColor];
        _labDate.font = [UIFont systemFontOfSize:8];
        _labDate.adjustsFontSizeToFitWidth = YES;
        [_labDate setText:strDate];
        [_viewFoot addSubview:_labDate];
        [_labDate mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(44);
            make.centerX.equalTo(_imageDate);
            make.top.mas_equalTo(_imageDate.mas_centerY).offset(3);
        }];
        
        
        
        
        
        
        
        
        
        
        
        
        _labAuthor1 = [[UILabel alloc] initWithFrame:CGRectZero];
        _labAuthor1.textAlignment = NSTextAlignmentRight;
        _labAuthor1.textColor =  SSRGBColor(166, 166, 166);
        _labAuthor1.backgroundColor = SSClearColor;
        _labAuthor1.font = [UIFont systemFontOfSize:10];
        [_labAuthor1 setText:strName];
        [_viewFoot addSubview:_labAuthor1];
        [_labAuthor1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-10);
            make.bottom.mas_equalTo(-10);
        }];
        
        _labAuthor2 = [[UILabel alloc] initWithFrame:CGRectZero];
        _labAuthor2.textAlignment = NSTextAlignmentRight;
        _labAuthor2.textColor =  SSRGBColor(166, 166, 166);
        _labAuthor2.backgroundColor = SSClearColor;
        _labAuthor2.font = [UIFont systemFontOfSize:10];
        [_labAuthor2 setText:strBy];
        [_viewFoot addSubview:_labAuthor2];
        [_labAuthor2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(_labAuthor1.mas_left);
            make.bottom.mas_equalTo(-10);
        }];
        
        

        
        
        
        
        
        
        
        
        
        _imageLike = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"heartNomal"]];
        [_viewFoot addSubview:_imageLike];
        [_imageLike mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.bottom.mas_equalTo(-10);
            make.size.mas_equalTo(CGSizeMake(15, 13));
        }];
        
        _labLike = [[UILabel alloc] initWithFrame:CGRectZero];
        _labLike.textAlignment = NSTextAlignmentLeft;
        _labLike.textColor =  SSRGBColor(166, 166, 166);
        _labLike.backgroundColor = SSClearColor;
        _labLike.font = [UIFont systemFontOfSize:8];
        [_labLike setText:strHeart];
        [_viewFoot addSubview:_labLike];
        [_labLike mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(_imageLike.mas_right).offset(2);
            make.bottom.mas_equalTo(-10);
        }];
        
        _imageCount = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"messageNomal"]];
        [_viewFoot addSubview:_imageCount];
        [_imageCount mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(_labLike.mas_right).offset(5);
            make.bottom.mas_equalTo(-10);
            make.size.mas_equalTo(CGSizeMake(15, 13));
        }];
        
        _labCount = [[UILabel alloc] initWithFrame:CGRectZero];
        _labCount.textAlignment = NSTextAlignmentLeft;
        _labCount.textColor =  SSRGBColor(166, 166, 166);
        _labCount.backgroundColor = SSClearColor;
        _labCount.font = [UIFont systemFontOfSize:8];
        [_labCount setText:strCount];
        [_viewFoot addSubview:_labCount];
        [_labCount mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(_imageCount.mas_right).offset(2);
            make.bottom.mas_equalTo(-10);
        }];
        
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}




@end
