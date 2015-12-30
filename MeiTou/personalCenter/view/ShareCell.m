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
//    @property (weak, nonatomic) IBOutlet UILabel *title;
//    @property (weak, nonatomic) IBOutlet UILabel *time;
//    @property (weak, nonatomic) IBOutlet UILabel *integral;
//    @property (weak, nonatomic) IBOutlet UIButton *success;
//    @property (weak, nonatomic) IBOutlet UIImageView *titleImage;
//    @property (weak, nonatomic) IBOutlet UILabel *details;
    
    _titleImage.image=[UIImage imageNamed:@"aaa"];
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
