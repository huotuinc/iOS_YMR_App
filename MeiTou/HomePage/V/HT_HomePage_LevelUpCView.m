//
//  HT_HomePage_LevelUpCView.m
//  MeiTou
//
//  Created by che on 15/12/14.
//  Copyright © 2015年 车. All rights reserved.
//

#import "HT_HomePage_LevelUpCView.h"

@implementation HT_HomePage_LevelUpCView

- (void)awakeFromNib {
    // Initialization code
    _imageVMain.image=[UIImage imageNamed:@"pop windows_a"];
    _buttonUp.layer.cornerRadius=5;
    _buttonUp.layer.borderColor=[COLOR_BUTTON_RED CGColor];
    _buttonUp.layer.borderWidth=1;
    _buttonUp.layer.masksToBounds=YES;
    [_buttonUp setTitle:@"当前已经升为LV2用户" forState:UIControlStateNormal];
    [_buttonUp setTitleColor:COLOR_BUTTON_RED forState:UIControlStateNormal];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
