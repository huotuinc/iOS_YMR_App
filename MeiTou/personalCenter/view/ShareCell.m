//
//  ShareCell.m
//  MeiTou
//
//  Created by 刘琛 on 15/12/18.
//  Copyright © 2015年 车. All rights reserved.
//

#import "ShareCell.h"

@implementation ShareCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.success.layer.cornerRadius = 5;
    
}

@end
