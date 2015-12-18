//
//  HT_Cpn_BuyListTableViewCell.m
//  HTTableViewCell
//
//  Created by che on 15/11/23.
//  Copyright © 2015年 车. All rights reserved.
//

#import "HT_Infor_CommentCellHeaderView.h"

@implementation HT_Infor_CommentCellHeaderView

- (void)awakeFromNib {
    // Initialization code
    _imageVLevel.image=[UIImage imageNamed:@"common_LV3"];
    _imageVNice.image=[UIImage imageNamed:@"common_zan_a"];
    _imageVComment.image=[UIImage imageNamed:@"common_comment"];

    _labelName.text=@"小车哈哈";
    _labelDate.text=@"2010-10-10 18:00:00";
    _labelContent.text=@"鼻子很漂亮奋斗奋斗奋斗说分手奋斗奋斗分斗说的奋斗奋斗奋斗说分手奋斗奋斗分斗说的奋斗奋斗";
    _labelContent.numberOfLines=0;
    _labelNice.text=@"1";
    _labelComment.text=@"2";
    _labelName.font=[UIFont systemFontOfSize:FONT_SIZE(26)];
    _labelDate.font=[UIFont systemFontOfSize:FONT_SIZE(22)];
    _labelContent.font=[UIFont systemFontOfSize:FONT_SIZE(26)];
    _labelComment.font=[UIFont systemFontOfSize:FONT_SIZE(22)];
    _labelNice.font=[UIFont systemFontOfSize:FONT_SIZE(22)];
    
    _labelName.textColor=COLOR_TEXT_TITILE;
    _labelContent.textColor=COLOR_TEXT_CONTENT;
    _labelDate.textColor=COLOR_TEXT_DATE;
    _labelNice.textColor=COLOR_TEXT_DATE;
    _labelComment.textColor=COLOR_TEXT_DATE;
    
    
}

-(void)drawRect:(CGRect)rect{
    _imageVHead.image=[UIImage imageNamed:@"sides_menu_tou"];
    _imageVHead.layer.cornerRadius=_imageVHead.frame.size.width/2;
    _imageVHead.layer.masksToBounds=YES;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
