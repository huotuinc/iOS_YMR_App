//
//  HT_Cpn_IteProjectHeaderViewTableViewCell.m
//  HTTableViewCell
//
//  Created by che on 15/11/26.
//  Copyright © 2015年 车. All rights reserved.
//

#import "HT_Par_IteProjectDoneHeaderCView.h"

@implementation HT_Par_IteProjectDoneHeaderCView

- (void)awakeFromNib {
    // Initialization code
    _imageVTop.image=[UIImage imageNamed:@"xdd"];
    _imageVline.image=[UIImage imageNamed:@"line1"];
    _imageVRight.image=[UIImage imageNamed:@"common_title_top_back"];
    
    _labelEnd.text=@"结束时间";
    _labelStart.text=@"起购";
    _labelTarget.text=@"目标金额";
    _labelAttend.text=@"参与";
    _labelDone.text=@"已筹集";
    _viewProgress.transform=CGAffineTransformMakeScale(1.0f, 1.0f);
    _viewProgress.layer.cornerRadius=5;
    _viewProgress.clipsToBounds=YES;
    //设置进度条颜色
    _viewProgress.trackTintColor=[UIColor blackColor];
    //设置进度默认值，这个相当于百分比，范围在0~1之间，不可以设置最大最小值
    _viewProgress.progress=0.7;
    //设置进度条上进度的颜色
    _viewProgress.progressTintColor=[UIColor redColor];
    
    _labelMoney.text=@"100万";
    _labelPerson.text=@"23人";
    _labelTip.text=@"100万";
    _labelPrice.text=@"5万";
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
