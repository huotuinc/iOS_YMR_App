//
//  HT_Cpn_IteTopViewTableViewCell.m
//  HTTableViewCell
//
//  Created by che on 15/11/26.
//  Copyright © 2015年 车. All rights reserved.
//

#import "HT_Par_MainTopView.h"

@implementation HT_Par_MainTopView

- (void)awakeFromNib {
    // Initialization code
    _imageVLine.image=[UIImage imageNamed:@"line1"];
    _imageVLineB.image=[UIImage imageNamed:@"line1"];
    _imageVProject.image=[UIImage imageNamed:@"common_content_top_item_red"];
    _imageVPerson.image=[UIImage imageNamed:@"common_content_top_list"];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
