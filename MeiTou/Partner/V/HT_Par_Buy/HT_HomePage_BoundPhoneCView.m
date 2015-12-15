//
//  HT_Cpn_BuyBoundTableViewCell.m
//  HTTableViewCell
//
//  Created by che on 15/11/23.
//  Copyright © 2015年 车. All rights reserved.
//

#import "HT_HomePage_BoundPhoneCView.h"

@implementation HT_HomePage_BoundPhoneCView

- (void)awakeFromNib {
    // Initialization code
    _viewA.backgroundColor=COLOR_BACK_MAIN;
    _viewB.backgroundColor=COLOR_BACK_MAIN;
    
    
    _labelPhone.textColor=COLOR_TEXT_CONTENT;
    _labelNumber.textColor=COLOR_TEXT_CONTENT;

    _labelState.textColor=COLOR_TEXT_DATE;
    
    _labelPhone.font=[UIFont systemFontOfSize:FONT_SIZE(24)];
    _labelNumber.font=[UIFont systemFontOfSize:FONT_SIZE(24)];
    _labelState.font=[UIFont systemFontOfSize:FONT_SIZE(20)];
    
    [_buttonSend setTitleColor:COLOR_BUTTON_RED forState:UIControlStateNormal];
    _buttonSend.titleLabel.font=[UIFont systemFontOfSize:FONT_SIZE(22)];
    _buttonSend.layer.cornerRadius=3;
    _buttonSend.layer.borderColor=[COLOR_BUTTON_RED CGColor];
    _buttonSend.layer.borderWidth=1;
    _buttonSend.layer.masksToBounds=YES;
    _buttonSend.clipsToBounds=YES;
    
    [_buttonBound setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_buttonBound setBackgroundColor:COLOR_BUTTON_RED];
    _buttonBound.titleLabel.font=[UIFont systemFontOfSize:FONT_SIZE(22)];
    _buttonBound.layer.cornerRadius=3;
    _buttonBound.layer.masksToBounds=YES;
    _buttonBound.clipsToBounds=YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end