//
//  HT_News_HeadTableViewCell.m
//  HTTableViewCell
//
//  Created by che on 15/11/25.
//  Copyright © 2015年 车. All rights reserved.
//

#import "HT_Infor_HeadCView.h"

@implementation HT_Infor_HeadCView

- (void)awakeFromNib {
    // Initialization code
    _labelTitle.text=@"这是一个文章的标题";
    _labelDate.text=@"2015/10/10 10:10:10";
    _labelScore.text=@"100/1000分";
    _imageVMain.image=[UIImage imageNamed:@"aaa"];
    
    _labelTitle.textColor=COLOR_TEXT_TITILE;
    _labelDate.textColor=COLOR_TEXT_DATE;
    _labelScore.textColor=COLOR_BUTTON_RED;
    
    _labelTitle.font=[UIFont systemFontOfSize:FONT_SIZE(32)];
    _labelDate.font=[UIFont systemFontOfSize:FONT_SIZE(22)];
    _labelScore.font=[UIFont systemFontOfSize:FONT_SIZE(22)];

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
