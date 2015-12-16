//
//  HT_HomePage_PointsCView.m
//  MeiTou
//
//  Created by che on 15/12/9.
//  Copyright © 2015年 车. All rights reserved.
//

#import "HT_HomePage_PointsCView.h"

@implementation HT_HomePage_PointsCView

- (void)awakeFromNib {
    // Initialization code
//    @property (weak, nonatomic) IBOutlet UIImageView *imageVTop;
//    @property (weak, nonatomic) IBOutlet UILabel *labelMy;
//    @property (weak, nonatomic) IBOutlet UILabel *labelPoint;
//    @property (weak, nonatomic) IBOutlet UIButton *buttonTreasury;
//    @property (weak, nonatomic) IBOutlet UILabel *labelRule;
//    @property (weak, nonatomic) IBOutlet UILabel *labelHelp;
    _imageVTop.image=[UIImage imageNamed:@"common_jifen"];
    _buttonTreasury.backgroundColor=COLOR_BUTTON_RED;
    _buttonTreasury.titleLabel.textColor=[UIColor whiteColor];
    
    _labelMy.textColor=COLOR_TEXT_DATE;
    _labelHelp.textColor=COLOR_TEXT_DATE;
    _labelRule.textColor=COLOR_TEXT_DATE;
    _labelPoint.textColor=COLOR_TEXT_TITILE;
    
    _labelMy.font=[UIFont systemFontOfSize:FONT_SIZE(22)];
    _labelPoint.font=[UIFont systemFontOfSize:FONT_SIZE(40)];
    _labelRule.font=[UIFont systemFontOfSize:FONT_SIZE(22)];
    _labelHelp.font=[UIFont systemFontOfSize:FONT_SIZE(22)];
    
    _buttonTreasury.titleLabel.textColor=[UIColor whiteColor];
    _buttonTreasury.layer.cornerRadius=3;
    _buttonTreasury.layer.masksToBounds=YES;
    _buttonTreasury.clipsToBounds=YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
