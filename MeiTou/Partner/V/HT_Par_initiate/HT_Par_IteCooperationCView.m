//
//  HT_Cpn_IteSubscriptionTableViewCell.m
//  HTTableViewCell
//
//  Created by che on 15/11/23.
//  Copyright © 2015年 车. All rights reserved.
//

#import "HT_Par_IteCooperationCView.h"

@implementation HT_Par_IteCooperationCView

- (void)awakeFromNib {
    // Initialization code
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(KeyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(KeyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    
    _imageVDown.image=[UIImage imageNamed:@"hr_more"];

    _viewTel.backgroundColor=COLOR_BACK_MAIN;
    _viewmark.backgroundColor=COLOR_BACK_MAIN;
    _viewName.backgroundColor=COLOR_BACK_MAIN;
    _viewMoney.backgroundColor=COLOR_BACK_MAIN;
    _viewState.backgroundColor=COLOR_BACK_MAIN;
    
    
    _viewTel.layer.cornerRadius=3;
    _viewTel.layer.borderWidth=1;
    _viewTel.layer.borderColor=[COLOR_LINE_C CGColor];
    _viewTel.layer.masksToBounds=YES;
    _viewTel.clipsToBounds=YES;
    _viewmark.layer.cornerRadius=3;
    _viewmark.layer.borderWidth=1;
    _viewmark.layer.borderColor=[COLOR_LINE_C CGColor];
    _viewmark.layer.masksToBounds=YES;
    _viewmark.clipsToBounds=YES;
    _viewName.layer.cornerRadius=3;
    _viewName.layer.borderWidth=1;
    _viewName.layer.borderColor=[COLOR_LINE_C CGColor];
    _viewName.layer.masksToBounds=YES;
    _viewName.clipsToBounds=YES;
    _viewMoney.layer.cornerRadius=3;
    _viewMoney.layer.borderWidth=1;
    _viewMoney.layer.borderColor=[COLOR_LINE_C CGColor];
    _viewMoney.layer.masksToBounds=YES;
    _viewMoney.clipsToBounds=YES;
    _viewState.layer.cornerRadius=3;
    _viewState.layer.borderWidth=1;
    _viewState.layer.borderColor=[COLOR_LINE_C CGColor];
    _viewState.layer.masksToBounds=YES;
    _viewState.clipsToBounds=YES;

    
    
    
    _labelName.font=[UIFont systemFontOfSize:FONT_SIZE(24)];
    _labelTel.font=[UIFont systemFontOfSize:FONT_SIZE(24)];
    _labelMoney.font=[UIFont systemFontOfSize:FONT_SIZE(24)];
    _labelMark.font=[UIFont systemFontOfSize:FONT_SIZE(24)];
    _labelNotice.font=[UIFont systemFontOfSize:FONT_SIZE(22)];
    _labelDefault.font=[UIFont systemFontOfSize:FONT_SIZE(24)];
    _labelSelect.font=[UIFont systemFontOfSize:FONT_SIZE(24)];
    _labelState.font=[UIFont systemFontOfSize:FONT_SIZE(24)];
    
    _labelName.textColor=COLOR_TEXT_DATE;
    _labelTel.textColor=COLOR_TEXT_DATE;
    _labelMoney.textColor=COLOR_TEXT_DATE;
    _labelMark.textColor=COLOR_TEXT_DATE;
    _labelNotice.textColor=COLOR_TEXT_DATE;
    _labelDefault.textColor=COLOR_TEXT_DATE;
    _labelSelect.textColor=COLOR_TEXT_TITILE;
    _labelState.textColor=COLOR_TEXT_TITILE;
    
    [_buttonSubmit setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_buttonSubmit setBackgroundColor:COLOR_BUTTON_RED];
    _buttonSubmit.titleLabel.font=[UIFont systemFontOfSize:FONT_SIZE(28)];
    _buttonSubmit.layer.cornerRadius=3;
    _buttonSubmit.layer.masksToBounds=YES;
    _buttonSubmit.clipsToBounds=YES;
    
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
    for (int i=0; i<3; i++) {
        UITextField *text  = (id)[self viewWithTag:300+i];
        [text resignFirstResponder];
    }
    
    
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
