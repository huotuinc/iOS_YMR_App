//
//  HT_Infor_BottomCView.m
//  MeiTou
//
//  Created by che on 15/12/8.
//  Copyright © 2015年 车. All rights reserved.
//

#import "HT_Infor_BottomCView.h"

@implementation HT_Infor_BottomCView

- (void)awakeFromNib {
    // Initialization code
    _imageVLine.image=[UIImage imageNamed:@"line1"];
    _imageVNice.image=[UIImage imageNamed:@"common_zanred_a"];
    _imageVShare.image=[UIImage imageNamed:@"common_share"];
    
    [_buttonScore setBackgroundImage:[UIImage imageNamed:@"rtyx_a"] forState:UIControlStateNormal];
    [_buttonScore setTitle:@"转发奖励5积分" forState:UIControlStateNormal];
    [_buttonScore setTitleColor:COLOR_BUTTON_RED forState:UIControlStateNormal];
    _buttonScore.titleLabel.font=[UIFont systemFontOfSize:FONT_SIZE(22)];
    _buttonScore.titleLabel.textAlignment=NSTextAlignmentCenter;
    
    [_buttonGo setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_buttonGo setTitle:@"去拼团" forState:UIControlStateNormal];
    _buttonGo.titleLabel.font=[UIFont systemFontOfSize:FONT_SIZE(26)];
    _buttonGo.layer.cornerRadius=3;
    _buttonGo.layer.masksToBounds=YES;
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
