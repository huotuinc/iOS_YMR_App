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
    _labelNice.text=@"111";
    _labelComment.text=@"222";
    _labelShare.text=@"333";
    _labelCount.text=@"333个赞";
    _labelScore.text=@"转发得55分";
    
    _labelContent.text=@"但是的萨达犯得上犯得上方式但双方的事发生大师傅士大夫是但是的萨达犯得上犯得上方式但双方的事发生大师傅士大夫是但是的萨达犯得上犯得上方式但双方的事发生大师傅士大夫是但是的萨达犯得上犯得上方式但双方的事发生大师傅士大夫是但是的萨达犯得上犯得上方式但双方的事发生大师傅士大夫是";
    _labelContent.numberOfLines=3;
    
    _imageVHead.image=[UIImage imageNamed:@"head"];
    _imageVState.image=[UIImage imageNamed:@"3"];
    _viewHeadGroup.backgroundColor=[UIColor yellowColor];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
