//
//  HT_Par_IteBottomView.m
//  MeiTou
//
//  Created by che on 15/12/3.
//  Copyright © 2015年 车. All rights reserved.
//

#import "HT_Par_IteBottomCView.h"

@implementation HT_Par_IteBottomCView

- (void)awakeFromNib {
    // Initialization code
    
    [_buttonCooperation setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_buttonCooperation setBackgroundColor:COLOR_BUTTON_ORANGE];
    _buttonCooperation.titleLabel.font=[UIFont systemFontOfSize:FONT_SIZE(28)];
//    _buttonCooperation.layer.cornerRadius=3;
//    _buttonCooperation.layer.masksToBounds=YES;
//    _buttonCooperation.clipsToBounds=YES;
    
    [_buttonOrder setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_buttonOrder setBackgroundColor:COLOR_BUTTON_RED];
    _buttonOrder.titleLabel.font=[UIFont systemFontOfSize:FONT_SIZE(28)];
//    _buttonOrder.layer.cornerRadius=3;
//    _buttonOrder.layer.masksToBounds=YES;
//    _buttonOrder.clipsToBounds=YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
