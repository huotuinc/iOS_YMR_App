//
//  HT_Cpn_IteProjectDoingHeaderViewTableViewCell.m
//  HTTableViewCell
//
//  Created by che on 15/11/26.
//  Copyright © 2015年 车. All rights reserved.
//

#import "HT_Par_IteProjectDoingHeaderCView.h"

@implementation HT_Par_IteProjectDoingHeaderCView

- (void)awakeFromNib {
    // Initialization code
//    @property (weak, nonatomic) IBOutlet UIImageView *imageVTop;
//    
//    @property (weak, nonatomic) IBOutlet UILabel *labelTitle;
//    @property (weak, nonatomic) IBOutlet UILabel *labelEnd;
//    @property (weak, nonatomic) IBOutlet UILabel *labelDate;
//    @property (weak, nonatomic) IBOutlet UILabel *labelTime;
//    @property (weak, nonatomic) IBOutlet UILabel *labelStart;
//    @property (weak, nonatomic) IBOutlet UILabel *labelPrice;
//    @property (weak, nonatomic) IBOutlet UILabel *labelAttend;
//    @property (weak, nonatomic) IBOutlet UILabel *labelPerson;
//    @property (weak, nonatomic) IBOutlet UILabel *labelTarget;
//    @property (weak, nonatomic) IBOutlet UILabel *labelMoney;
//    @property (weak, nonatomic) IBOutlet UILabel *labelDone;
//    @property (weak, nonatomic) IBOutlet UILabel *labelTip;
//    
//    @property (weak, nonatomic) IBOutlet UIProgressView *viewProgress;
//    @property (weak, nonatomic) IBOutlet UIImageView *imageVline;
    
    _imageVTop.image=[UIImage imageNamed:@"xdd"];
    _imageVline.image=[UIImage imageNamed:@"line1"];
    
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
