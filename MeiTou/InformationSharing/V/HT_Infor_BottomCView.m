//
//  HT_Infor_BottomCView.m
//  MeiTou
//
//  Created by che on 15/12/8.
//  Copyright © 2015年 车. All rights reserved.
//

#import "HT_Infor_BottomCView.h"

@implementation HT_Infor_BottomCView

- (void)awakeFromNib {
    // Initialization code
    _imageVLine.image=[UIImage imageNamed:@"line1"];
    _imageVNice.image=[UIImage imageNamed:@"common_zanred_a"];
    _imageVShare.image=[UIImage imageNamed:@"common_share"];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
