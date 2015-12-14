//
//  PraiseCell.m
//  MeiTou
//
//  Created by 刘琛 on 15/12/8.
//  Copyright © 2015年 车. All rights reserved.
//

#import "PraiseCell.h"

@implementation PraiseCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.reback.layer.cornerRadius = 5;
    self.reback.layer.borderColor = [UIColor colorWithWhite:0.894 alpha:1.000].CGColor;
    self.reback.layer.borderWidth = 1;
}


@end
