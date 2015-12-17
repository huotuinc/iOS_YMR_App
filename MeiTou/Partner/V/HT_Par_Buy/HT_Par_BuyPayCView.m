//
//  HT_Cpn_BuyPayTableViewCell.m
//  HTTableViewCell
//
//  Created by che on 15/11/23.
//  Copyright © 2015年 车. All rights reserved.
//

#import "HT_Par_BuyPayCView.h"

@implementation HT_Par_BuyPayCView

- (void)awakeFromNib {
    // Initialization code
//    @property (weak, nonatomic) IBOutlet UIView *viewBase;
//    @property (weak, nonatomic) IBOutlet UITextField *textFName;
//    @property (weak, nonatomic) IBOutlet UILabel *textFTel;
//    @property (weak, nonatomic) IBOutlet UILabel *labelName;
//    @property (weak, nonatomic) IBOutlet UILabel *labelTel;
//    @property (weak, nonatomic) IBOutlet UILabel *labelHelp;
//    @property (weak, nonatomic) IBOutlet UIImageView *imageVHelp;
//    @property (weak, nonatomic) IBOutlet UIButton *buttonSub;
//    @property (weak, nonatomic) IBOutlet UILabel *labelMoney;
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(KeyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(KeyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    
    _viewBase.backgroundColor=COLOR_BACK_MAIN;
    _imageVHelp.image=[UIImage imageNamed:@"common_content_notice"];
    

    _viewA.layer.cornerRadius=3;
    _viewA.layer.masksToBounds=YES;
    _viewA.layer.borderWidth=1;
    _viewA.layer.borderColor=[COLOR_LINE_C CGColor];
    _viewA.clipsToBounds=YES;
    _viewB.layer.cornerRadius=3;
    _viewB.layer.borderColor=[COLOR_LINE_C CGColor];
    _viewB.layer.borderWidth=1;
    _viewB.layer.masksToBounds=YES;
    _viewB.clipsToBounds=YES;
                                                                                         
    _labelName.textColor=COLOR_TEXT_DATE;
    _labelTel.textColor=COLOR_TEXT_DATE;
    _labelMoney.textColor=COLOR_TEXT_TITILE;
    _labelHelp.textColor=COLOR_TEXT_DATE;
    
    _labelName.font=[UIFont systemFontOfSize:FONT_SIZE(26)];
    _labelTel.font=[UIFont systemFontOfSize:FONT_SIZE(26)];
    _labelHelp.font=[UIFont systemFontOfSize:FONT_SIZE(22)];
    _labelMoney.font=[UIFont systemFontOfSize:FONT_SIZE(40)];
    _textFTel.font=[UIFont systemFontOfSize:FONT_SIZE(26)];
    _textFName.font=[UIFont systemFontOfSize:FONT_SIZE(26)];
    
    _labelMoney.text=@"$1500.00";
    
    [_buttonSub setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_buttonSub setBackgroundColor:COLOR_BUTTON_RED];
    _buttonSub.titleLabel.font=[UIFont systemFontOfSize:FONT_SIZE(28)];
    _buttonSub.layer.cornerRadius=3;
    _buttonSub.layer.masksToBounds=YES;
    _buttonSub.clipsToBounds=YES;
    
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
    UITextField *text1  = (id)[self viewWithTag:301];
    [text resignFirstResponder];
    [text1 resignFirstResponder];
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
