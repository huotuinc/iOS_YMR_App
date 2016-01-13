//
//  HT_Infor_CommentReplyCView.m
//  MeiTou
//
//  Created by che on 16/1/12.
//  Copyright © 2016年 车. All rights reserved.
//

#import "HT_Infor_CommentReplyCView.h"

@implementation HT_Infor_CommentReplyCView

- (void)awakeFromNib {
    // Initialization code
    
    _viewBack.backgroundColor=[UIColor grayColor];
    
    [_buttonSend setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [_buttonSend setTitle:@"发送" forState:UIControlStateNormal];
    _buttonSend.titleLabel.font=[UIFont systemFontOfSize:FONT_SIZE(26)];
    _buttonSend.backgroundColor=[UIColor whiteColor];
    _buttonSend.layer.cornerRadius=3;
    _buttonSend.layer.borderWidth=1;
    _buttonSend.layer.masksToBounds=YES;
    _buttonSend.layer.borderColor=[[UIColor blackColor] CGColor];
    
    [_buttonCancel setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [_buttonCancel setTitle:@"取消" forState:UIControlStateNormal];
    _buttonCancel.titleLabel.font=[UIFont systemFontOfSize:FONT_SIZE(26)];
    _buttonCancel.backgroundColor=[UIColor whiteColor];
    _buttonCancel.layer.cornerRadius=3;
    _buttonCancel.layer.borderWidth=1;
    _buttonCancel.layer.masksToBounds=YES;
    _buttonCancel.layer.borderColor=[[UIColor blackColor] CGColor];
    
    _viewText.backgroundColor=[UIColor whiteColor];
    _viewText.layer.cornerRadius=3;
    _viewText.layer.borderWidth=1;
    _viewText.layer.masksToBounds=YES;
    _viewText.layer.borderColor=[[UIColor blackColor] CGColor];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
