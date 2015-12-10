//
//  HT_Cpn_IteProjectHeaderViewTableViewCell.m
//  HTTableViewCell
//
//  Created by che on 15/11/26.
//  Copyright © 2015年 车. All rights reserved.
//

#import "HT_Par_SubProjectDoneHeaderCView.h"

@implementation HT_Par_SubProjectDoneHeaderCView

- (void)awakeFromNib {
    // Initialization code
//    @property (weak, nonatomic) IBOutlet UILabel *labelPrice;
//    @property (weak, nonatomic) IBOutlet UILabel *labelAttend;
//    @property (weak, nonatomic) IBOutlet UILabel *labelMoney;
//    @property (weak, nonatomic) IBOutlet UIView *ViewHeadGroup;
//    @property (weak, nonatomic) IBOutlet UILabel *labelSuccess;
//    @property (weak, nonatomic) IBOutlet UILabel *labelTitle;
//    @property (weak, nonatomic) IBOutlet UILabel *labelEnd;
//    @property (weak, nonatomic) IBOutlet UILabel *labelBought;
//    @property (weak, nonatomic) IBOutlet UILabel *labelRest;
//    
//    
//    @property (weak, nonatomic) IBOutlet UIView *viewHeadGroup;
//    @property (weak, nonatomic) IBOutlet UIImageView *imageVRight;
//    
//    @property (weak, nonatomic) IBOutlet UIImageView *imagevLine;
//    
//    @property (weak, nonatomic) IBOutlet UIImageView *imageVTop;
//    @property (weak, nonatomic) IBOutlet UIImageView *imageVState;
//    @property (weak, nonatomic) IBOutlet UIProgressView *viewProgress;
    _imageVTop.image=[UIImage imageNamed:@"xdd"];
    _imagevLine.image=[UIImage imageNamed:@"line1"];
    _imageVLineB.image=[UIImage imageNamed:@"line1"];
    _imageVRight.image=[UIImage imageNamed:@"common_content_right_more"];
    
    _labelEnd.text=@"结束时间";
    _labelStart.text=@"起购";
    _labelScore.text=@"目标金额";
    _labelAttend.text=@"已购买";
    _labelRest.text=@"剩余";
    _viewProgress.transform=CGAffineTransformMakeScale(1.0f, 1.0f);
    _viewProgress.layer.cornerRadius=5;
    _viewProgress.clipsToBounds=YES;
    //设置进度条颜色
    _viewProgress.trackTintColor=[UIColor blackColor];
    //设置进度默认值，这个相当于百分比，范围在0~1之间，不可以设置最大最小值
    _viewProgress.progress=1;
    //设置进度条上进度的颜色
    _viewProgress.progressTintColor=[UIColor redColor];
    
    _labelDate.text=@"10-10";
    _labelTime.text=@"10:10:10";
    _labelMoney.text=@"1500万";
    _labelBought.text=@"100万";
    _labelPrice.text=@"5万";
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
