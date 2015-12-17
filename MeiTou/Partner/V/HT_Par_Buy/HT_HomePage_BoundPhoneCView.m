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
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(KeyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(KeyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    _viewA.backgroundColor=COLOR_BACK_MAIN;
    _viewB.backgroundColor=COLOR_BACK_MAIN;
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
    
    
    _labelPhone.textColor=COLOR_TEXT_CONTENT;
    _labelNumber.textColor=COLOR_TEXT_CONTENT;

    _labelState.textColor=COLOR_TEXT_DATE;
    
    _labelPhone.font=[UIFont systemFontOfSize:FONT_SIZE(26)];
    _labelNumber.font=[UIFont systemFontOfSize:FONT_SIZE(26)];
    _labelState.font=[UIFont systemFontOfSize:FONT_SIZE(22)];
    
    [_buttonSend setTitleColor:COLOR_BUTTON_RED forState:UIControlStateNormal];
    _buttonSend.titleLabel.font=[UIFont systemFontOfSize:FONT_SIZE(22)];
    _buttonSend.layer.cornerRadius=3;
    _buttonSend.layer.borderColor=[COLOR_BUTTON_RED CGColor];
    _buttonSend.layer.borderWidth=1;
    _buttonSend.layer.masksToBounds=YES;
    _buttonSend.clipsToBounds=YES;
    
    [_buttonBound setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_buttonBound setBackgroundColor:COLOR_BUTTON_RED];
    _buttonBound.titleLabel.font=[UIFont systemFontOfSize:FONT_SIZE(28)];
    _buttonBound.layer.cornerRadius=3;
    _buttonBound.layer.masksToBounds=YES;
    _buttonBound.clipsToBounds=YES;
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
    for (int i=0; i<2; i++) {
        UITextField *text  = (id)[self viewWithTag:300+i];
        [text resignFirstResponder];
    }
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
