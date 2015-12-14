//
//  HT_Cpn_IteProjectDoingHeaderViewTableViewCell.m
//  HTTableViewCell
//
//  Created by che on 15/11/26.
//  Copyright © 2015年 车. All rights reserved.
//

#import "HT_Par_BuyHeaderView.h"

@implementation HT_Par_BuyHeaderView

- (void)awakeFromNib {
    // Initialization code
    
//    @property (weak, nonatomic) IBOutlet UIImageView *imageVTop;
//    @property (weak, nonatomic) IBOutlet UIImageView *imageVLine;
//    @property (weak, nonatomic) IBOutlet UILabel *labelTitle;
//    @property (weak, nonatomic) IBOutlet UILabel *labeEnd;
//    @property (weak, nonatomic) IBOutlet UILabel *labelTime;
//    @property (weak, nonatomic) IBOutlet UILabel *labelDate;
//    @property (weak, nonatomic) IBOutlet UILabel *labelDone;
//    @property (weak, nonatomic) IBOutlet UILabel *labelPerson;
//    @property (weak, nonatomic) IBOutlet UIView *viewProgress;
    

    _imageVTop.image=[UIImage imageNamed:@"xdd"];
    _labelTitle.text=@"众筹会议类";
    _labeEnd.text=@"结束时间";
    _labelDone.text=@"已预约";
    _viewProgress.transform=CGAffineTransformMakeScale(1.0f, 1.0f);
    _viewProgress.layer.cornerRadius=5;
    _viewProgress.clipsToBounds=YES;
    //设置进度条颜色
    _viewProgress.trackTintColor=[UIColor blackColor];
    //设置进度默认值，这个相当于百分比，范围在0~1之间，不可以设置最大最小值
    _viewProgress.progress=0.7;
    //设置进度条上进度的颜色
    _viewProgress.progressTintColor=[UIColor redColor];
    
    _labelTime.text=@"10:10:10";
    _labelDate.text=@"10-10";
    _labelPerson.text=@"20/100人";
    
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
