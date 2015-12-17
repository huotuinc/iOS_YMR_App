//
//  HT_Par_Ite_PaymentOrderCView.m
//  MeiTou
//
//  Created by che on 15/12/7.
//  Copyright © 2015年 车. All rights reserved.
//

#import "HT_Par_ItePaymentOrderCView.h"

@implementation HT_Par_ItePaymentOrderCView

- (void)awakeFromNib {
    // Initialization code
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(KeyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(KeyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    
    _lineA.image=[UIImage imageNamed:@"line1"];
    _lineB.image=[UIImage imageNamed:@"line1"];
    _lineC.image=[UIImage imageNamed:@"line1"];
    _lineD.image=[UIImage imageNamed:@"line1"];

    _lineAA.image=[UIImage imageNamed:@"line2"];
    

    _labelMoney.text=@"$1500.00";
    _labelLevelUp.text=@"立即支付,升级为LV2等级";
    

    _labelTitle.font=[UIFont systemFontOfSize:FONT_SIZE(26)];
    _labelPay.font=[UIFont systemFontOfSize:FONT_SIZE(30)];
    _labelWei.font=[UIFont systemFontOfSize:FONT_SIZE(30)];
    _labelMoney.font=[UIFont systemFontOfSize:FONT_SIZE(36)];
    _labelLevelUp.font=[UIFont systemFontOfSize:FONT_SIZE(26)];
    
    _labelPay.textColor=COLOR_TEXT_DATE;
    _labelMoney.textColor=COLOR_TEXT_TITILE;
    _labelLevelUp.textColor=COLOR_TEXT_TITILE;
    _labelWei.textColor=COLOR_TEXT_CONTENT;
    _labelPay.textColor=COLOR_TEXT_CONTENT;
    
    
    
    
    
    _imageVPay.image=[UIImage imageNamed:@"zhifubao"];
    _imageWei.image=[UIImage imageNamed:@"weixin"];
    
    [_buttonPay setBackgroundImage:[UIImage imageNamed:@"recharge_icon_choose"] forState:UIControlStateSelected];
    [_buttonPay setBackgroundImage:[UIImage imageNamed:@"recharge_icon_choose_none"] forState:UIControlStateNormal];
    
    
    [_buttonWei setBackgroundImage:[UIImage imageNamed:@"recharge_icon_choose"] forState:UIControlStateSelected];
    [_buttonWei setBackgroundImage:[UIImage imageNamed:@"recharge_icon_choose_none"] forState:UIControlStateNormal];
    

    _buttonBuy.layer.cornerRadius=3;
    _buttonBuy.layer.masksToBounds=YES;
    
    
    
}
/**
 *  键盘监听
 *
 *  @param sender <#sender description#>
 */
-(void)KeyboardWillShow:(NSNotification *)sender
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:[[sender.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey]doubleValue]
     ];
    [UIView commitAnimations];//开始执行动画
}
-(void)KeyboardWillHide:(NSNotification *)sender
{
   
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:[[sender.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey]doubleValue]];
    self.transform = CGAffineTransformIdentity; //重置状态
    [UIView commitAnimations];
    
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITextField *text  = (id)[self viewWithTag:300];
    [text resignFirstResponder];
    
    
}
/**
 *  画圆
 *
 *  @param rect <#rect description#>
 */
-(void)drawRect:(CGRect)rect{
    _buttonPay.layer.masksToBounds=YES;
    _buttonPay.layer.cornerRadius=_buttonPay.frame.size.height/2;
    
    _buttonWei.layer.masksToBounds=YES;
    _buttonWei.layer.cornerRadius=_buttonWei.frame.size.height/2;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
