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
    _imageVRight.image=[UIImage imageNamed:@"common_content_right_more"];
    _imagevState.image=[UIImage imageNamed:@"crowdfunding_content_center_success"];
    _imageVLine.image=[UIImage imageNamed:@"line1"];
    _imageVA.image=[UIImage imageNamed:@"sides_menu_tou"];
    _imageVB.image=[UIImage imageNamed:@"sides_menu_tou"];
    _imageVC.image=[UIImage imageNamed:@"sides_menu_tou"];
    _imageVD.image=[UIImage imageNamed:@"sides_menu_tou"];
    _imageVE.image=[UIImage imageNamed:@"sides_menu_tou"];
    _imageVMore.image=[UIImage imageNamed:@"common_content_center_more"];
    _labelEnd.text=@"结束时间:";
    _labelStart.text=@"起购:";
    _labelTarget.text=@"目标金额:";
    _labelAttend.text=@"参与:";
    _labelDone.text=@"已筹集:";
    
    _labelEnd.textColor=COLOR_TEXT_DATE;
    _labelStart.textColor=COLOR_TEXT_DATE;
    _labelTarget.textColor=COLOR_TEXT_DATE;
    _labelAttend.textColor=COLOR_TEXT_DATE;
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
    
    _labelMoney.text=@"100万";
    _labelPerson.text=@"23人";
    _labelTip.text=@"100万";
    _labelPrice.text=@"5万";
    _labelDate.text=@"10-02";
    _labelTime.text=@"18:00-20:00";
    
    _labelMoney.textColor=COLOR_TEXT_TITILE;
    _labelPerson.textColor=COLOR_BUTTON_RED;
    _labelTip.textColor=COLOR_TEXT_TITILE;
    _labelPrice.textColor=COLOR_BUTTON_RED;
    _labelTitle.textColor=COLOR_TEXT_TITILE;
    _labelSuccess.textColor=COLOR_TEXT_TITILE;
    
    _labelTitle.font=[UIFont systemFontOfSize:FONT_SIZE(34)];
    _labelSuccess.font=[UIFont systemFontOfSize:FONT_SIZE(22)];
    _labelEnd.font=[UIFont systemFontOfSize:FONT_SIZE(22)];
    _labelStart.font=[UIFont systemFontOfSize:FONT_SIZE(22)];
    _labelTarget.font=[UIFont systemFontOfSize:FONT_SIZE(22)];
    _labelAttend.font=[UIFont systemFontOfSize:FONT_SIZE(22)];
    _labelDone.font=[UIFont systemFontOfSize:FONT_SIZE(22)];
    _labelPerson.font=[UIFont systemFontOfSize:FONT_SIZE(22)];
    _labelTip.font=[UIFont systemFontOfSize:FONT_SIZE(22)];
    _labelPrice.font=[UIFont systemFontOfSize:FONT_SIZE(22)];
    _labelDate.font=[UIFont systemFontOfSize:FONT_SIZE(22)];
    _labelTime.font=[UIFont systemFontOfSize:FONT_SIZE(22)];
//    
//    for (int i=0; i<7; i++) {
//        UIImageView *imageV=[[UIImageView alloc]initWithFrame:CGRectMake((_viewHeadGroup.frame.size.width-30)/7*i,_viewHeadGroup.frame.size.height/2-_viewHeadGroup.frame.size.width/7/2 , _viewHeadGroup.frame.size.width/7, _viewHeadGroup.frame.size.width/7)];
//        imageV.image
//        =[UIImage imageNamed:@"sides_menu_tou"];
//        if (i==6) {
////            imageV.image=[UIImage imageNamed:@"common_content_center_more"];
//            
//        }
//        [_viewHeadGroup addSubview:imageV];
//    }

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
