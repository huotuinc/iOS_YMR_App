//
//  HT_HomePage_LeftTableViewCell.m
//  MeiTou
//
//  Created by che on 15/11/29.
//  Copyright © 2015年 车. All rights reserved.
//

#import "HT_HomePage_LeftTableViewCell.h"

@implementation HT_HomePage_LeftTableViewCell

- (void)awakeFromNib {
    // Initialization code
    _labelName.textColor=COLOR_LEFTVC_Main;
    _labelName.font=[UIFont systemFontOfSize:FONT_SIZE(28)];
    _imageVNext.image=[UIImage imageNamed:@"SlidingMenu_content_right_enter@1.5x"];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
