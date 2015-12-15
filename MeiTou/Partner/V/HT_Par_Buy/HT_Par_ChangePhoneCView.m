//
//  HT_Cpn_BuyBoundTableViewCell.m
//  HTTableViewCell
//
//  Created by che on 15/11/23.
//  Copyright © 2015年 车. All rights reserved.
//

#import "HT_Par_ChangePhoneCView.h"

@implementation HT_Par_ChangePhoneCView

- (void)awakeFromNib {
    // Initialization code
    
//    @property (weak, nonatomic) IBOutlet UILabel *labelPhone;
//    @property (weak, nonatomic) IBOutlet UILabel *labelState;
//    @property (weak, nonatomic) IBOutlet UILabel *labelNumber;
//    @property (weak, nonatomic) IBOutlet UITextField *textFPhone;
//    @property (weak, nonatomic) IBOutlet UITextField *textFNumber;
//    @property (weak, nonatomic) IBOutlet UIButton *buttonSend;
//    @property (weak, nonatomic) IBOutlet UIButton *buttonBound;
//    @property (weak, nonatomic) IBOutlet UILabel *labelHelp;
//    @property (weak, nonatomic) IBOutlet UILabel *labelHelpB;
//    @property (weak, nonatomic) IBOutlet UIView *viewA;
//    @property (weak, nonatomic) IBOutlet UIView *viewB;
    
    _viewA.backgroundColor=COLOR_BACK_MAIN;
    _viewB.backgroundColor=COLOR_BACK_MAIN;
    _viewA.layer.cornerRadius=3;
    _viewA.layer.masksToBounds=YES;
    _viewA.clipsToBounds=YES;
    _viewB.layer.cornerRadius=3;
    _viewB.layer.masksToBounds=YES;
    _viewB.clipsToBounds=YES;
    
    _labelPhone.textColor=COLOR_TEXT_CONTENT;
    _labelNumber.textColor=COLOR_TEXT_CONTENT;
    _labelHelp.textColor=COLOR_TEXT_DATE;
    _labelHelpB.textColor=COLOR_TEXT_DATE;
    _labelState.textColor=COLOR_TEXT_DATE;
    
    _labelPhone.font=[UIFont systemFontOfSize:FONT_SIZE(24)];
    _labelNumber.font=[UIFont systemFontOfSize:FONT_SIZE(24)];
    _labelHelpB.font=[UIFont systemFontOfSize:FONT_SIZE(20)];
    _labelHelp.font=[UIFont systemFontOfSize:FONT_SIZE(20)];
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
