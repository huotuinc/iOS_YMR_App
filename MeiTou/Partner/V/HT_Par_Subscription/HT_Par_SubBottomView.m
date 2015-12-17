//
//  HT_Par_BuyBottomView.m
//  MeiTou
//
//  Created by che on 15/12/2.
//  Copyright © 2015年 车. All rights reserved.
//

#import "HT_Par_SubBottomView.h"

@implementation HT_Par_SubBottomView

- (void)awakeFromNib {
    // Initialization code
    [_buttonSubscription setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_buttonSubscription setBackgroundColor:COLOR_BUTTON_RED];
    _buttonSubscription.titleLabel.font=[UIFont systemFontOfSize:FONT_SIZE(28)];
    _buttonSubscription.layer.cornerRadius=3;
    _buttonSubscription.layer.masksToBounds=YES;
    _buttonSubscription.clipsToBounds=YES;
    
    _imageVLine.image=[UIImage imageNamed:@"line1"];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
