//
//  BottomTableViewCell.m
//  Reply
//
//  Created by che on 16/1/4.
//  Copyright © 2016年 车. All rights reserved.
//

#import "HT_Infor_CommentFooterTableViewCell.h"

@implementation HT_Infor_CommentFooterTableViewCell

- (void)awakeFromNib {
    // Initialization code
    _imageVLine.image=[UIImage imageNamed:@"xian_bottom"];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
