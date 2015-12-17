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
    
    _labelTitle.font=[UIFont systemFontOfSize:FONT_SIZE(30)];
    _labelScore.font=[UIFont systemFontOfSize:FONT_SIZE(24)];
    _labelContent.font=[UIFont systemFontOfSize:FONT_SIZE(24)];
    _labelCount.font=[UIFont systemFontOfSize:FONT_SIZE(24)];
    _labelComment.font=[UIFont systemFontOfSize:FONT_SIZE(20)];
    _labelDate.font=[UIFont systemFontOfSize:FONT_SIZE(20)];
    _labelNice.font=[UIFont systemFontOfSize:FONT_SIZE(20)];
    _labelShare.font=[UIFont systemFontOfSize:FONT_SIZE(20)];
    
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
    _labelContent.text=@"但是的萨达犯得上犯得上方式但双方的事发生大师傅士大夫是但是的萨达犯得上犯得上方式但双方的事发生大师傅士大夫是但是的萨达犯得上犯得上方式但双方的事发生大师傅士大夫是但是的萨达犯得上犯得上方式但双方的事发生大师傅士大夫是但是的萨达犯得上犯得上方式但双方的事发生大师傅士大夫是";
    _labelContent.numberOfLines=3;
    
    _imageVHead.image=[UIImage imageNamed:@"head"];
    _imageVState.image=[UIImage imageNamed:@"3"];
    _viewHeadGroup.backgroundColor=[UIColor yellowColor];
//    
//    @property (weak, nonatomic) IBOutlet UIView *viewBase;
//    @property (weak, nonatomic) IBOutlet UIImageView *imageVHead;
//    @property (weak, nonatomic) IBOutlet UILabel *labelTitle;
//    @property (weak, nonatomic) IBOutlet UIImageView *imageVState;
//    @property (weak, nonatomic) IBOutlet UILabel *labelDate;
//    @property (weak, nonatomic) IBOutlet UIImageView *imageVMain;
//    @property (weak, nonatomic) IBOutlet UILabel *labelContent;
//    @property (weak, nonatomic) IBOutlet UILabel *labelNice;
//    @property (weak, nonatomic) IBOutlet UILabel *labelComment;
//    @property (weak, nonatomic) IBOutlet UILabel *labelShare;
//    @property (weak, nonatomic) IBOutlet UILabel *labelScore;
//    @property (weak, nonatomic) IBOutlet UILabel *labelCount;
//    @property (weak, nonatomic) IBOutlet UIView *viewHeadGroup;
    _imageVNice.image=[UIImage imageNamed:@"common_zan_a"];
    _imageVComment.image=[UIImage imageNamed:@"common_comment"];
    _imageVShare.image=[UIImage imageNamed:@"common_share"];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
