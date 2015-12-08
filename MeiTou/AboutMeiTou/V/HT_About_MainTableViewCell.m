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
    _imageVWatch.image=[UIImage imageNamed:@"article_content_right_browse"];
    
    _labelName.text=@"公司介绍";
    _labelContent.text=@"奋斗送你离开复苏带来烦恼死了烦奋斗送你离开复苏带来烦恼死了烦奋斗送你离开复苏带来烦恼死了烦奋斗送你离开复苏带来烦恼死了烦";
    _labelContent.numberOfLines=2;
    _labelNumber.text=@"313人";
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
