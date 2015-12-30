//
//  HT_HomePage_NavTitleCVIew.m
//  MeiTou
//
//  Created by che on 15/12/29.
//  Copyright © 2015年 车. All rights reserved.
//

#import "HT_HomePage_NavTitleCVIew.h"

@implementation HT_HomePage_NavTitleCVIew

- (void)awakeFromNib {
    // Initialization code
    _imageVLineA.image=[UIImage imageNamed:@"xians"];
    _imageVLineB.image=[UIImage imageNamed:@"xians"];
    _imageVLineC.image=[UIImage imageNamed:@"xians"];
    _imageVLineD.image=[UIImage imageNamed:@"xians"];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
