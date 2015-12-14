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
//    @property (weak, nonatomic) IBOutlet UILabel *labelLevel;
//    @property (weak, nonatomic) IBOutlet UIView *viewBase;
//    @property (weak, nonatomic) IBOutlet UILabel *labelScore;
//    @property (weak, nonatomic) IBOutlet UIImageView *imageViewSplite;
//    @property (weak, nonatomic) IBOutlet UIImageView *lineA;
//    @property (weak, nonatomic) IBOutlet UIImageView *lineB;
//    @property (weak, nonatomic) IBOutlet UILabel *labelUp;
//    @property (weak, nonatomic) IBOutlet UILabel *labelMore;
//    @property (weak, nonatomic) IBOutlet UIImageView *lineC;
//    @property (weak, nonatomic) IBOutlet UIImageView *lineD;
//    @property (weak, nonatomic) IBOutlet UILabel *labelBuy;
//    @property (weak, nonatomic) IBOutlet UITextField *textFBuy;
//    @property (weak, nonatomic) IBOutlet UILabel *labelGet;
//    @property (weak, nonatomic) IBOutlet UITextField *textFGet;
//    @property (weak, nonatomic) IBOutlet UIImageView *lineE;
//    @property (weak, nonatomic) IBOutlet UILabel *labelTitle;
//    @property (weak, nonatomic) IBOutlet UIImageView *lineF;
//    @property (weak, nonatomic) IBOutlet UILabel *labelPay;
//    @property (weak, nonatomic) IBOutlet UIButton *buttonPay;
//    @property (weak, nonatomic) IBOutlet UIImageView *imageVPay;
//    @property (weak, nonatomic) IBOutlet UIImageView *lineAA;
//    @property (weak, nonatomic) IBOutlet UILabel *labelWei;
//    @property (weak, nonatomic) IBOutlet UIButton *buttonWei;
//    @property (weak, nonatomic) IBOutlet UIImageView *imageWei;
//    @property (weak, nonatomic) IBOutlet UIImageView *lineG;
//    @property (weak, nonatomic) IBOutlet UIButton *buttonBuy;

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
    
    _labelLevel.textColor=COLOR_TEXT_DATE;
    _labelScore.textColor=COLOR_TEXT_DATE;
    _labelGet.textColor=COLOR_TEXT_DATE;
    _labelBuy.textColor=COLOR_TEXT_DATE;
    _labelPay.textColor=COLOR_TEXT_DATE;
    _labelLevel.textColor=COLOR_TEXT_TITILE;
    _labelMoney.textColor=COLOR_TEXT_TITILE;
    _labelWei.textColor=COLOR_TEXT_CONTENT;
    _labelPay.textColor=COLOR_TEXT_CONTENT;
    
    
    _imageVPay.image=[UIImage imageNamed:@"zhifubao"];
    _imageWei.image=[UIImage imageNamed:@"weixin"];
    
    [_buttonPay setBackgroundImage:[UIImage imageNamed:@"recharge_icon_choose"] forState:UIControlStateSelected];
    [_buttonPay setBackgroundImage:[UIImage imageNamed:@"recharge_icon_choose_none"] forState:UIControlStateNormal];
    
    
    [_buttonWei setBackgroundImage:[UIImage imageNamed:@"recharge_icon_choose"] forState:UIControlStateSelected];
    [_buttonWei setBackgroundImage:[UIImage imageNamed:@"recharge_icon_choose_none"] forState:UIControlStateNormal];
    
    _viewBase.backgroundColor=COLOR_BACK_MAIN;
    
    

}

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
