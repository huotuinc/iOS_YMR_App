//
//  HT_Par_Ite_PaymentOrderCView.m
//  MeiTou
//
//  Created by che on 15/12/7.
//  Copyright © 2015年 车. All rights reserved.
//

#import "HT_HomePage_TopUpCView.h"

@implementation HT_HomePage_TopUpCView

- (void)awakeFromNib {
    // Initialization code

    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(KeyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(KeyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];

    _lineA.image=[UIImage imageNamed:@"line1"];
    _lineB.image=[UIImage imageNamed:@"line1"];
    _lineC.image=[UIImage imageNamed:@"line1"];
    _lineD.image=[UIImage imageNamed:@"line1"];
    _lineE.image=[UIImage imageNamed:@"line1"];
    _lineF.image=[UIImage imageNamed:@"line1"];
    _lineG.image=[UIImage imageNamed:@"line1"];
    _lineAA.image=[UIImage imageNamed:@"line2"];
    
    _labelLevel.text=@"当前等级为:LV1";
    _labelScore.text=@"当前积分:800分";
    _labelMoney.text=@"$1500.00";
    _labelLevelUp.text=@"立即支付,升级为LV2等级";
    
    _labelLevel.font=[UIFont systemFontOfSize:FONT_SIZE(20)];
    _labelScore.font=[UIFont systemFontOfSize:FONT_SIZE(20)];
    _labelUp.font=[UIFont systemFontOfSize:FONT_SIZE(22)];
    _labelMore.font=[UIFont systemFontOfSize:FONT_SIZE(22)];
    _labelTitle.font=[UIFont systemFontOfSize:FONT_SIZE(24)];
    _labelPay.font=[UIFont systemFontOfSize:FONT_SIZE(30)];
    _labelWei.font=[UIFont systemFontOfSize:FONT_SIZE(30)];
    _labelMoney.font=[UIFont systemFontOfSize:FONT_SIZE(30)];
    _labelLevelUp.font=[UIFont systemFontOfSize:FONT_SIZE(30)];
    _labelBuy.font=[UIFont systemFontOfSize:FONT_SIZE(24)];
    _labelGet.font=[UIFont systemFontOfSize:FONT_SIZE(24)];
    _labelPoint.font=[UIFont systemFontOfSize:FONT_SIZE(24)];
    
    _labelLevel.textColor=COLOR_TEXT_DATE;
    _labelScore.textColor=COLOR_TEXT_DATE;
    _labelGet.textColor=COLOR_TEXT_DATE;
    _labelBuy.textColor=COLOR_TEXT_DATE;
    _labelPay.textColor=COLOR_TEXT_DATE;
    _labelPoint.textColor=COLOR_TEXT_DATE;
    _textFBuy.textColor=COLOR_TEXT_DATE;
    
    _labelUp.textColor=COLOR_TEXT_TITILE;
    _labelMore.textColor=COLOR_TEXT_TITILE;
    _labelMoney.textColor=COLOR_TEXT_TITILE;
    _labelLevelUp.textColor=COLOR_TEXT_TITILE;
    _labelWei.textColor=COLOR_TEXT_CONTENT;
    _labelPay.textColor=COLOR_TEXT_CONTENT;
    
    
    _labelBuy.backgroundColor=COLOR_BACK_MAIN;
    _textFBuy.backgroundColor=COLOR_BACK_MAIN;
    
    
    
    _imageVPay.image=[UIImage imageNamed:@"zhifubao"];
    _imageWei.image=[UIImage imageNamed:@"weixin"];
    
    [_buttonPay setBackgroundImage:[UIImage imageNamed:@"recharge_icon_choose"] forState:UIControlStateSelected];
    [_buttonPay setBackgroundImage:[UIImage imageNamed:@"recharge_icon_choose_none"] forState:UIControlStateNormal];
    
    
    [_buttonWei setBackgroundImage:[UIImage imageNamed:@"recharge_icon_choose"] forState:UIControlStateSelected];
    [_buttonWei setBackgroundImage:[UIImage imageNamed:@"recharge_icon_choose_none"] forState:UIControlStateNormal];
    
    _viewBase.backgroundColor=COLOR_BACK_MAIN;
    
    _viewA.layer.cornerRadius=3;
    _viewA.layer.masksToBounds=YES;
    _viewB.layer.cornerRadius=3;
    _viewB.layer.masksToBounds=YES;
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
    if (![_textFBuy.text isEqual:@""]) {
        _labelPoint.text=[NSString stringWithFormat:@"%@分",_textFBuy.text ];
    }
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
