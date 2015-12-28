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

    _imageVTop.image=[UIImage imageNamed:@"xdd"];
    _imagevLine.image=[UIImage imageNamed:@"line1"];
    _imageVRight.image=[UIImage imageNamed:@"common_content_right_more"];
    _imageVState.image=[UIImage imageNamed:@"crowdfunding_content_center_success"];
    _imageVLineA.image=[UIImage imageNamed:@"line1"];
    _imageVA.image=[UIImage imageNamed:@"sides_menu_tou"];
    _imageVB.image=[UIImage imageNamed:@"sides_menu_tou"];
    _imageVC.image=[UIImage imageNamed:@"sides_menu_tou"];
    _imageVD.image=[UIImage imageNamed:@"sides_menu_tou"];
    _imageVE.image=[UIImage imageNamed:@"sides_menu_tou"];
    _imageVMore.image=[UIImage imageNamed:@"common_content_center_more"];
    
    _labelEnd.text=@"结束时间:";
    _labelStart.text=@"起购:";
    _labelTarget.text=@"目标金额:";
    _labelRest.text=@"剩余:";
    _labelDone.text=@"已购买:";
    
    _labelEnd.textColor=COLOR_TEXT_DATE;
    _labelStart.textColor=COLOR_TEXT_DATE;
    _labelTarget.textColor=COLOR_TEXT_DATE;
    _labelRest.textColor=COLOR_TEXT_DATE;
    _labelDone.textColor=COLOR_TEXT_DATE;
    
    _viewProgress.transform=CGAffineTransformMakeScale(1.0f, 1.0f);
    _viewProgress.layer.cornerRadius=5;
    _viewProgress.clipsToBounds=YES;
    //设置进度条颜色
    _viewProgress.trackTintColor=COLOR_BACK_MAIN;
    //设置进度默认值，这个相当于百分比，范围在0~1之间，不可以设置最大最小值
    _viewProgress.progress=0.7;
    //设置进度条上进度的颜色
    _viewProgress.progressTintColor=COLOR_BUTTON_ORANGE;
    
    _labelPrice.text=@"5万";
    _labelMoney.text=@"1500万";
    _labelBought.text=@"120万";
    _labelBoughtNO.text=@"200万";
    _labelDate.text=@"10-02";
    _labelTime.text=@"18:00-20:00";
    
    _labelBought.textColor=COLOR_BUTTON_RED;
    _labelPrice.textColor=COLOR_BUTTON_RED;
    _labelMoney.textColor=COLOR_TEXT_TITILE;
    _labelBoughtNO.textColor=COLOR_TEXT_TITILE;
    _labelSuccess.textColor=COLOR_TEXT_TITILE;

    
    _labelTitle.textColor=COLOR_TEXT_TITILE;
    _labelResult.textColor=COLOR_TEXT_TITILE;
    _labelStart.textColor=COLOR_TEXT_DATE;
    _labelTarget.textColor=COLOR_TEXT_DATE;
    _labelDone.textColor=COLOR_TEXT_DATE;
    _labelRest.textColor=COLOR_TEXT_DATE;
    
//    _labelStart.textColor=COLOR_TEXT_DATE;
//    _labelTarget.textColor=COLOR_TEXT_DATE;
//    _labelDone.textColor=COLOR_TEXT_DATE;
//    _labelRest.textColor=COLOR_TEXT_DATE;
//    _labelEnd.textColor=COLOR_TEXT_DATE;
    _labelDate.textColor=COLOR_TEXT_DATE;
    _labelTime.textColor=COLOR_TEXT_DATE;
//    _labelMoney.textColor=COLOR_TEXT_TITILE;
//    _labelBoughtNO.textColor=COLOR_TEXT_TITILE;
//    _labelPrice.textColor=COLOR_BUTTON_RED;
//    _labelBought.textColor=COLOR_BUTTON_RED;
    
    _labelTitle.font=[UIFont systemFontOfSize:FONT_SIZE(34)];
    _labelSuccess.font=[UIFont systemFontOfSize:FONT_SIZE(26)];
    _labelBought.font=[UIFont systemFontOfSize:FONT_SIZE(22)];
    _labelPrice.font=[UIFont systemFontOfSize:FONT_SIZE(22)];
    _labelMoney.font=[UIFont systemFontOfSize:FONT_SIZE(22)];
    _labelBoughtNO.font=[UIFont systemFontOfSize:FONT_SIZE(22)];
    _labelRest.font=[UIFont systemFontOfSize:FONT_SIZE(22)];
    _labelResult.font=[UIFont systemFontOfSize:FONT_SIZE(22)];
    _labelDone.font=[UIFont systemFontOfSize:FONT_SIZE(22)];
    _labelTarget.font=[UIFont systemFontOfSize:FONT_SIZE(22)];
    _labelStart.font=[UIFont systemFontOfSize:FONT_SIZE(22)];
    _labelTime.font=[UIFont systemFontOfSize:FONT_SIZE(22)];
    _labelDate.font=[UIFont systemFontOfSize:FONT_SIZE(22)];
    
    

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
