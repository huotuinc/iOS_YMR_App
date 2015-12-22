//
//  HT_About_MessageTableViewCell.m
//  HTTableViewCell
//
//  Created by che on 15/11/24.
//  Copyright © 2015年 车. All rights reserved.
//

#import "HT_About_MainTableViewCell.h"

@implementation HT_About_MainTableViewCell

- (void)awakeFromNib {
    // Initialization code
    _imageVNext.image=[UIImage imageNamed:@"common_content_right_more"];
    _imageVWatch.image=[UIImage imageNamed:@"article_content_right_browse-1"];
    _imageVHead.image=[UIImage imageNamed:@"sides_menu_tou"];
    
    
    _labelName.text=@"公司介绍";
    _labelContent.text=@"奋斗送你离开复苏带来烦恼死了烦奋斗送你离开复苏带来烦恼死了烦奋";
    _labelContent.numberOfLines=2;
    _labelNumber.text=@"313人";
    
    _labelName.textColor=COLOR_TEXT_TITILE;
    _labelNumber.textColor=COLOR_TEXT_CONTENT;
    _labelContent.textColor=COLOR_TEXT_CONTENT;
    
    _labelName.font=[UIFont systemFontOfSize:FONT_SIZE(26)];
    _labelNumber.font=[UIFont systemFontOfSize:FONT_SIZE(22)];
    _labelContent.font=[UIFont systemFontOfSize:FONT_SIZE(22)];

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
