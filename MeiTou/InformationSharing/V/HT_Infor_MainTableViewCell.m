//
//  HT_News_MainTableViewCell.m
//  HTTableViewCell
//
//  Created by che on 15/11/23.
//  Copyright © 2015年 车. All rights reserved.
//

#import "HT_Infor_MainTableViewCell.h"

@implementation HT_Infor_MainTableViewCell

- (void)awakeFromNib {
    // Initialization code
    _labelTitle.text=@"内容标题内容标题内容标题";
    _labelDate.text=@"2050/10/10 10:10:10";
    _labelNice.text=@"800赞";
    _labelComment.text=@"79评论";
    _labelShare.text=@"518人";
    _labelCount.text=@"333个赞";
    _labelScore.text=@"转发得55分";
    
    for (int i=0; i<9; i++) {
        
        UIImageView *imageV=(UIImageView *)[self viewWithTag:1000+i];
        if (i==8) {
            imageV.image=[UIImage imageNamed:@"common_content_center_more"];
        }else{
            imageV.image=[UIImage imageNamed:@"sides_menu_tou"];
        }
    }
    
    _labelTitle.font=[UIFont systemFontOfSize:FONT_SIZE(32)];
    _labelScore.font=[UIFont systemFontOfSize:FONT_SIZE(26)];
    _labelContent.font=[UIFont systemFontOfSize:FONT_SIZE(26)];
    _labelCount.font=[UIFont systemFontOfSize:FONT_SIZE(24)];
    _labelComment.font=[UIFont systemFontOfSize:FONT_SIZE(22)];
    _labelDate.font=[UIFont systemFontOfSize:FONT_SIZE(22)];
    _labelNice.font=[UIFont systemFontOfSize:FONT_SIZE(22)];
    _labelShare.font=[UIFont systemFontOfSize:FONT_SIZE(22)];
    
    _labelTitle.textColor=COLOR_TEXT_TITILE;
    _labelScore.textColor=COLOR_TEXT_DATE;
    _labelContent.textColor=COLOR_TEXT_CONTENT;
    _labelCount.textColor=COLOR_TEXT_DATE;
    _labelComment.textColor=COLOR_TEXT_DATE;
    _labelDate.textColor=COLOR_TEXT_DATE;
    _labelNice.textColor=COLOR_TEXT_DATE;
    _labelShare.textColor=COLOR_TEXT_DATE;
    
    
    _imageVHead.image=[UIImage imageNamed:@"sides_menu_tou"];
    _imageVMain.image=[UIImage imageNamed:@"aaa"];
    _imageLine.image=[UIImage imageNamed:@"line1"];
    _labelContent.text=@"但是的萨达犯得上犯得上方式但双方的事发生大师傅士大夫是但是的萨达犯得上犯得上方式但双方的事发生大师傅士大夫是但是的萨达犯得上犯得上方式但双方的事发生大师傅士大夫是但是的萨达犯得上犯得上方式但双方的事发生大师傅士大夫是但是的萨达犯得上犯得上方式但双方的事发生大师傅士大夫是";
    _labelContent.numberOfLines=3;
    


    _imageVNice.image=[UIImage imageNamed:@"common_zan_a"];
    _imageVComment.image=[UIImage imageNamed:@"common_comment"];
    _imageVShare.image=[UIImage imageNamed:@"common_share"];
    
    _viewBase.layer.borderColor=[COLOR_LINE_C CGColor];
    _viewBase.layer.borderWidth=1;
    _viewBase.layer.masksToBounds=YES;
    
    _viewNice.backgroundColor=COLOR_BACK_MAIN;
    _viewShare.backgroundColor=COLOR_BACK_MAIN;
    _viewComment.backgroundColor=COLOR_BACK_MAIN;
    
    _viewNice.layer.cornerRadius=3;
    _viewNice.layer.masksToBounds=YES;
    
    _viewShare.layer.cornerRadius=3;
    _viewShare.layer.masksToBounds=YES;
    
    _viewComment.layer.cornerRadius=3;
    _viewComment.layer.masksToBounds=YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
