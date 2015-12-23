//
//  HT_Par_Ite_PaymentOrderCView.m
//  MeiTou
//
//  Created by che on 15/12/7.
//  Copyright © 2015年 车. All rights reserved.
//

#import "HT_Par_ItePaymentResultsCView.h"

@implementation HT_Par_ItePaymentResultsCView

- (void)awakeFromNib {
    // Initialization code
//    @property (weak, nonatomic) IBOutlet UIImageView *imageViewUp;
//    @property (weak, nonatomic) IBOutlet UILabel *labelState;
//    @property (weak, nonatomic) IBOutlet UILabel *labelPay;
//    @property (weak, nonatomic) IBOutlet UILabel *labelType;
//    @property (weak, nonatomic) IBOutlet UILabel *labelMoney;
//    @property (weak, nonatomic) IBOutlet UILabel *labelCreate;
//    @property (weak, nonatomic) IBOutlet UILabel *labelDate;
//    @property (weak, nonatomic) IBOutlet UILabel *labelTitle;
    _imageViewUp.image=[UIImage imageNamed:@"recharge_icon_success"];
    
    _labelState.font=[UIFont systemFontOfSize:FONT_SIZE(32)];
    _labelPay.font=[UIFont systemFontOfSize:FONT_SIZE(24)];
    _labelType.font=[UIFont systemFontOfSize:FONT_SIZE(24)];
    _labelCreate.font=[UIFont systemFontOfSize:FONT_SIZE(24)];
    _labelMoney.font=[UIFont systemFontOfSize:FONT_SIZE(24)];
    _labelDate.font=[UIFont systemFontOfSize:FONT_SIZE(24)];
    _labelTitle.font=[UIFont systemFontOfSize:FONT_SIZE(26)];
    
    _labelState.textColor=COLOR_TEXT_TITILE;
    _labelPay.textColor=COLOR_TEXT_DATE;
    _labelCreate.textColor=COLOR_TEXT_DATE;
    _labelMoney.textColor=COLOR_TEXT_DATE;

    _labelType.textColor=COLOR_TEXT_CONTENT;
    _labelDate.textColor=COLOR_TEXT_CONTENT;
    _labelTitle.textColor=COLOR_TEXT_TITILE;

    NSString *str=@"LV2";
    NSMutableAttributedString *AttributedStr=[[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"充值成功,您当前为%@等级",str]];
    [AttributedStr addAttribute:NSForegroundColorAttributeName value:COLOR_BUTTON_RED range:NSMakeRange(9, str.length)];
    _labelState.attributedText=AttributedStr;



}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
