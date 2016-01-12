//
//  HT_Information_ShareView.m
//  MeiTou
//
//  Created by che on 15/11/27.
//  Copyright © 2015年 车. All rights reserved.
//

#import "HT_Infor_ShareCView.h"

@implementation HT_Infor_ShareCView

- (void)awakeFromNib {
    // Initialization code

    _imageVPhoto.image=[UIImage imageNamed:@"share_content_bottom_pic"];
    _imageVEmotion.image=[UIImage imageNamed:@"share_content_bottom_expression"];
    
    _labelAdd.text=@"上传封面图片";
    _labelPhoto.text=@"插入照片";
    _labelEmotion.text=@"表情";
    _labelTitle.text=@"标题";
    _labelPoint.text=@"奖励5积分";
    _textFTitle.placeholder=@"  输入标题在13个字符以内";
    
    _labelAdd.textColor=COLOR_TEXT_DATE;
    _labelPhoto.textColor=COLOR_TEXT_TITILE;
    _labelEmotion.textColor=COLOR_TEXT_TITILE;
    _labelTitle.textColor=COLOR_TEXT_TITILE;
    _labelPoint.textColor=COLOR_TEXT_TITILE;
    _textFTitle.textColor=COLOR_TEXT_DATE;
    
    _labelAdd.font=[UIFont systemFontOfSize:FONT_SIZE(22)];
    _labelPhoto.font=[UIFont systemFontOfSize:FONT_SIZE(26)];
    _labelEmotion.font=[UIFont systemFontOfSize:FONT_SIZE(26)];
    _labelTitle.font=[UIFont systemFontOfSize:FONT_SIZE(28)];
    _labelPoint.font=[UIFont systemFontOfSize:FONT_SIZE(24)];
    _textFTitle.font=[UIFont systemFontOfSize:FONT_SIZE(24)];
    
//    _viewBase.layer.cornerRadius=3;
//    _viewBase.layer.borderWidth=1;
//    _viewBase.layer.borderColor=[COLOR_LINE_A CGColor];
//    _viewBase.layer.masksToBounds=YES;
    _viewBase.backgroundColor=COLOR_BACK_MAIN;
    
    _textFTitle.layer.cornerRadius=3;
    _textFTitle.layer.borderWidth=1;
    _textFTitle.layer.borderColor=[COLOR_LINE_C CGColor];
    _textFTitle.layer.masksToBounds=YES;
    
    _viewTop.layer.cornerRadius=3;
    _viewTop.layer.borderWidth=1;
    _viewTop.layer.borderColor=[COLOR_LINE_C CGColor];
    _viewTop.layer.masksToBounds=YES;
    
    _viewMainA.layer.cornerRadius=3;
    _viewMainA.layer.borderWidth=1;
    _viewMainA.layer.borderColor=[COLOR_LINE_A CGColor];
    _viewMainA.layer.masksToBounds=YES;
    
    _viewBase.backgroundColor=COLOR_BACK_MAIN;
    
    
    _textV.layer.cornerRadius=3;
    _textV.layer.borderWidth=1;
    _textV.layer.borderColor=[COLOR_LINE_C CGColor];
    _textV.layer.masksToBounds=YES;
    _textV.font=[UIFont systemFontOfSize:FONT_SIZE(24)];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(KeyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(KeyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    
    [_buttonAdd setBackgroundImage:[UIImage imageNamed:@"share_content_upload"] forState:UIControlStateNormal];
    _buttonAdd.clipsToBounds=YES;
    
    _viewTop.backgroundColor=COLOR_BACK_MAIN;
    _textFTitle.backgroundColor=COLOR_BACK_MAIN;
    _textV.backgroundColor=COLOR_BACK_MAIN;
}


/**
 *  键盘监听
 *
 *  @param sender <#sender description#>
 */
-(void)KeyboardWillShow:(NSNotification *)sender
{
    
    CGRect rect  = [[sender.userInfo objectForKey:UIKeyboardFrameEndUserInfoKey]CGRectValue];
    CGFloat height =  rect.size.height;
    NSLog(@"height--------%f",height);
    //    UIKeyboardAnimationDurationUserInfoKey 获取键盘升起动画时间
    [UIView beginAnimations:nil context:nil];
    //    [[sender.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey]doubleValue] 获取动画时间;
    [UIView setAnimationDuration:[[sender.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey]doubleValue]
     ];
//    if (_textFTitle.frame.origin.y+_textFTitle.frame.size.height>SCREEN_HEIGHT-height) {
//        self.transform = CGAffineTransformMakeTranslation(0, -height);
//    }
    self.transform = CGAffineTransformMakeTranslation(0, -height+100);
    [UIView commitAnimations];//开始执行动画
    //    UITextField *textField  = (id)[self.view viewWithTag:TextTag];
    //    textField.frame = CGRectMake(10, screenH-45-rect.size.height, screenW-20, 45);
}
-(void)KeyboardWillHide:(NSNotification *)sender
{
    CGRect rect  = [[sender.userInfo objectForKey:UIKeyboardFrameEndUserInfoKey]CGRectValue];
    CGFloat height =  rect.size.height;
    NSLog(@"height--------%f",height);
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:[[sender.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey]doubleValue]];
    self.transform = CGAffineTransformIdentity; //重置状态
    [UIView commitAnimations];
    //    UITextField *textField  = (id)[self.view viewWithTag:TextTag];
    //    textField.frame = CGRectMake(10, screenH-45, screenW-20, 45);
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [_textV resignFirstResponder];
//    [_textFTitle resignFirstResponder];
    
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
