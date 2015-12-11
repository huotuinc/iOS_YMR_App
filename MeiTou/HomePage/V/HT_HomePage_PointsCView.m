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
    _imageVTop.image=[UIImage imageNamed:@"crowdfunding_content_center_success"];
    _buttonTreasury.backgroundColor=REDCOLOR;
    _buttonTreasury.titleLabel.textColor=[UIColor whiteColor];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
