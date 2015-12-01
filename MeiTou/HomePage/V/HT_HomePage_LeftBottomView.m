//
//  HT_HomePage_LeftBottomView.m
//  MeiTou
//
//  Created by che on 15/11/30.
//  Copyright © 2015年 车. All rights reserved.
//

#import "HT_HomePage_LeftBottomView.h"

@implementation HT_HomePage_LeftBottomView

- (void)awakeFromNib {
    // Initialization code
    _labelHelp.text=@"联系客服";
    [_imageVHelp setImage:[UIImage imageNamed:@"1"]];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
