//
//  HT_Cpn_IteResult_HeadView.m
//  HTTableViewCell
//
//  Created by che on 15/11/24.
//  Copyright © 2015年 车. All rights reserved.
//

#import "HT_Par_IteResult_HeadView.h"

@implementation HT_Par_IteResult_HeadView

- (void)awakeFromNib {
    // Initialization code

    _imageVHead.image=[UIImage imageNamed:@"sides_menu_tou"];
    _imageVLevel.image=[UIImage imageNamed:@"common_LV3"];
    
}
-(void)drawRect:(CGRect)rect{
    _imageVHead.layer.cornerRadius=_imageVHead.frame.size.width/2;
    _imageVHead.layer.masksToBounds=YES;
    _imageVLevel.layer.cornerRadius=_imageVLevel.frame.size.width/2;
    _imageVLevel.layer.masksToBounds=YES;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
