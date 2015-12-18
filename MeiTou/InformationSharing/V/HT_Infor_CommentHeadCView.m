//
//  HT_News_HeadTableViewCell.m
//  HTTableViewCell
//
//  Created by che on 15/11/25.
//  Copyright © 2015年 车. All rights reserved.
//

#import "HT_Infor_CommentHeadCView.h"

@implementation HT_Infor_CommentHeadCView

- (void)awakeFromNib {
    // Initialization code
    _labelTitle.text=@"这是一个文章的标题";
    _labelDate.text=@"2015/10/10 10:10:10";
    _labelScore.text=@"100/1000分";
    _labelContent.text=@"我要分享一本自己写的书叫时代的稻草人,我要分享一本自己写的书叫时代的稻草人,我要分享一本自己写的书叫时代的稻草人,我要分享一本自己写的书叫时代的稻草人,我要分享一本自己写的书叫时代的稻草人,我要分享一本自己写的书叫时代的稻草人,我要分享一本自己写的书叫时代的稻草人,我要分享一本自己写的书叫时代的稻草人,我要分享一本自己写的书叫时代的稻草人,我要分享一本自己写的书叫时代的稻草人,";
    _labelContent.numberOfLines=3;
    
    _labelTitle.textColor=COLOR_TEXT_TITILE;
    _labelDate.textColor=COLOR_TEXT_DATE;
    _labelScore.textColor=COLOR_BUTTON_RED;
    _labelContent.textColor=COLOR_TEXT_CONTENT;
    
    _labelTitle.font=[UIFont systemFontOfSize:FONT_SIZE(32)];
    _labelDate.font=[UIFont systemFontOfSize:FONT_SIZE(22)];
    _labelScore.font=[UIFont systemFontOfSize:FONT_SIZE(22)];
    _labelContent.font=[UIFont systemFontOfSize:FONT_SIZE(26)];

    _imageVMain.image=[UIImage imageNamed:@"aaa"];
    _imageVLineA.image=[UIImage imageNamed:@"line1"];
    _imageVLineB.image=[UIImage imageNamed:@"line1"];
    _imageVBack.backgroundColor=COLOR_BACK_MAIN;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
