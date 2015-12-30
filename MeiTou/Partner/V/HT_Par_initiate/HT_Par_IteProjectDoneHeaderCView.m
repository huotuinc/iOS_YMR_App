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
    
    
    for (int i=0; i<8; i++) {
        UIImageView *imageV=(UIImageView *)[self viewWithTag:200+i];
        imageV.image=[UIImage imageNamed:@"line2"];
    }
    
    for (int i=0; i<4; i++) {
        UILabel *label=(UILabel *)[self viewWithTag:100+i];
        [self changeLabel:label AndFont:22 AndColor:COLOR_TEXT_DATE];
    }
    
    for (int i=0; i<3; i++) {
        UILabel *label=(UILabel *)[self viewWithTag:110+i];
        [self changeLabel:label AndFont:22 AndColor:[UIColor whiteColor]];
        label.backgroundColor=COLOR_BACK_TIME;
        label.layer.cornerRadius=2;
        label.layer.masksToBounds=YES;
        [self changeLabel:label AndFont:20 AndColor:[UIColor whiteColor]];
        
    }
    for (int i=0; i<6; i++) {
        UIImageView *imageV=(UIImageView *)[self viewWithTag:300+i];
        if (i==5) {
            imageV.image=[UIImage imageNamed:@"common_content_center_more"];
        }else{
            imageV.image=[UIImage imageNamed:@"sides_menu_tou"];
        }
        
    }
    
    [self changeLabel:_labelTitle AndFont:30 AndColor:COLOR_TEXT_TITILE];
    [self changeLabel:_labelEnd AndFont:26 AndColor:COLOR_TEXT_DATE];
    [self changeLabel:_labelStartM AndFont:28 AndColor:COLOR_TEXT_TITILE];
    [self changeLabel:_labelTargetM AndFont:28 AndColor:COLOR_TEXT_TITILE];
    [self changeLabel:_labelDoneM AndFont:28 AndColor:COLOR_BUTTON_RED];
    [self changeLabel:_labelAttendM AndFont:28 AndColor:COLOR_BUTTON_RED];
    [self changeLabel:_labelSymbolA AndFont:20 AndColor:COLOR_TEXT_TITILE];
    [self changeLabel:_labelSymbolB AndFont:20 AndColor:COLOR_TEXT_TITILE];
    [self changeLabel:_labelResulet AndFont:24 AndColor:COLOR_TEXT_DATE];
    [self changeLabel:_labelSuccess AndFont:24 AndColor:COLOR_TEXT_DATE];
    
    _imageVTop.image=[UIImage imageNamed:@"line2"];
    _imagevState.image=[UIImage imageNamed:@"crowdfunding_content_center_success"];
    _imageVRight.image=[UIImage imageNamed:@"common_content_right_more"];
    
    
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
