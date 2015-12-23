//
//  HT_Cpn_BuyListTableViewCell.m
//  HTTableViewCell
//
//  Created by che on 15/11/23.
//  Copyright © 2015年 车. All rights reserved.
//

#import "HT_Par_IteListTableViewCell.h"

@implementation HT_Par_IteListTableViewCell

- (void)awakeFromNib {
    // Initialization code
//    @property (weak, nonatomic) IBOutlet UIImageView *imageVHead;
//    @property (weak, nonatomic) IBOutlet UIImageView *imageVLevel;
//    @property (weak, nonatomic) IBOutlet UILabel *labelName;
//    @property (weak, nonatomic) IBOutlet UILabel *labelMoney;
//    @property (weak, nonatomic) IBOutlet UILabel *labelState;
//    @property (weak, nonatomic) IBOutlet UIButton *buttonState;
    _labelName.text=@"投资人姓名";
    _labelName.font=[UIFont systemFontOfSize:FONT_SIZE(26)];
    _labelName.textColor=COLOR_TEXT_TITILE;
    
    _labelMoney.text=@"我有50W,找人合作众筹";
    _labelMoney.font=[UIFont systemFontOfSize:FONT_SIZE(22)];
    _labelMoney.textColor=COLOR_TEXT_DATE;

    
//    _labelState.text=@"已有30人申请合作";
    NSString *str=@"30";
    _labelState.font=[UIFont systemFontOfSize:FONT_SIZE(22)];
    _labelState.textColor=COLOR_TEXT_CONTENT;
    
    NSMutableAttributedString *AttributedStr=[[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"已有%@人申请合作",str]];
    [AttributedStr addAttribute:NSForegroundColorAttributeName value:COLOR_BUTTON_RED range:NSMakeRange(2, str.length)];
    _labelState.attributedText=AttributedStr;
    


    
    
    [_buttonState setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_buttonState setBackgroundColor:COLOR_BUTTON_RED];
    [_buttonState setTitle:@"我要合作" forState:UIControlStateNormal];
    _buttonState.titleLabel.font=[UIFont systemFontOfSize:FONT_SIZE(24)];
    _buttonState.layer.cornerRadius=3;
    _buttonState.layer.masksToBounds=YES;
    _buttonState.clipsToBounds=YES;
    
}

-(void)drawRect:(CGRect)rect{
    _imageVHead.image=[UIImage imageNamed:@"sides_menu_tou"];
    _imageVHead.layer.cornerRadius=_imageVHead.frame.size.height/2;
    _imageVHead.layer.masksToBounds=YES;
    
    _imageVLevel.image=[UIImage imageNamed:@"common_LV2"];
    _imageVLevel.layer.masksToBounds=YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
