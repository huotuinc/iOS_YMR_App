//
//  HT_Cpn_BuyListTableViewCell.m
//  HTTableViewCell
//
//  Created by che on 15/11/23.
//  Copyright © 2015年 车. All rights reserved.
//

#import "HT_Par_SubListTableViewCell.h"

@implementation HT_Par_SubListTableViewCell

- (void)awakeFromNib {
    // Initialization code
//    @property (weak, nonatomic) IBOutlet UILabel *labelName;
//    @property (weak, nonatomic) IBOutlet UILabel *labelTel;
//    @property (weak, nonatomic) IBOutlet UILabel *labelPrice;
//    
//    @property (weak, nonatomic) IBOutlet UIImageView *imageVHead;
//    @property (weak, nonatomic) IBOutlet UIImageView *imageVLevel;
//    @property (weak, nonatomic) IBOutlet UIImageView *imageVState;
    _imageVState.image=[UIImage imageNamed:@"rengou_content_right_fail"];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
