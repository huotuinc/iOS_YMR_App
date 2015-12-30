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
    
    for (int i=0; i<3; i++) {
        UILabel *label=(UILabel *)[self viewWithTag:110+i];
        [self changeLabel:label AndFont:22 AndColor:[UIColor whiteColor]];
        label.backgroundColor=COLOR_BACK_TIME;
        label.layer.cornerRadius=5;
        label.layer.masksToBounds=YES;
    }
    
    _imageVTop.image=[UIImage imageNamed:@"line2"];
    _imageVLine.image=[UIImage imageNamed:@"line1"];
 
    

    



    _viewProgress.transform=CGAffineTransformMakeScale(1.0f, 1.0f);
    _viewProgress.layer.cornerRadius=5;
    _viewProgress.clipsToBounds=YES;
    //设置进度条颜色
    _viewProgress.trackTintColor=COLOR_BACK_MAIN;
    //设置进度默认值，这个相当于百分比，范围在0~1之间，不可以设置最大最小值
    _viewProgress.progress=0.7;
    //设置进度条上进度的颜色
    _viewProgress.progressTintColor=COLOR_BUTTON_ORANGE;
    

    
}

/**
 *  设置label的字体大小和颜色
 *
 *  @param label 更改的label
 *  @param font  整形(相对效果图的像素大小)
 *  @param color 颜色
 */
-(void)changeLabel:(UILabel *) label AndFont:(NSInteger) font AndColor:(UIColor *) color{
    label.font=[UIFont systemFontOfSize:FONT_SIZE(font)];
    label.textColor=color;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
