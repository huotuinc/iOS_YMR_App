//
//  HT_About_TopCView.m
//  MeiTou
//
//  Created by che on 15/12/8.
//  Copyright © 2015年 车. All rights reserved.
//

#import "HT_About_TopCView.h"

@implementation HT_About_TopCView

- (void)awakeFromNib {
    // Initialization code
    _labelTitle.font=[UIFont systemFontOfSize:FONT_SIZE(32)];
    _labelTitle.textColor=COLOR_TEXT_TITILE;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
