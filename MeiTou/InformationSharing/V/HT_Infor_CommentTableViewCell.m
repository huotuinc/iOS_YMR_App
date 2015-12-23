//
//  HT_Cpn_BuyListTableViewCell.m
//  HTTableViewCell
//
//  Created by che on 15/11/23.
//  Copyright © 2015年 车. All rights reserved.
//

#import "HT_Infor_CommentTableViewCell.h"

@implementation HT_Infor_CommentTableViewCell

- (void)awakeFromNib {
    // Initialization code
    
    _viewBase.layer.cornerRadius=3;
    _viewBase.layer.borderWidth=1;
    _viewBase.layer.borderColor=[COLOR_BACK_MAIN CGColor];
    _viewBase.layer.masksToBounds=YES;
    _viewBase.backgroundColor=COLOR_BACK_MAIN;
    _imagePoint.image=[UIImage imageNamed:@"kkr"];
    
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
