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
//    @property (weak, nonatomic) IBOutlet UIImageView *userLogo;
//    @property (weak, nonatomic) IBOutlet UILabel *userName;
//    @property (weak, nonatomic) IBOutlet UILabel *time;
//    @property (weak, nonatomic) IBOutlet UILabel *detail;
//    @property (weak, nonatomic) IBOutlet UIImageView *articleLogo;
//    @property (weak, nonatomic) IBOutlet UILabel *articleTitle;
//    @property (weak, nonatomic) IBOutlet UILabel *articleDetail;
//    
//    @property (weak, nonatomic) IBOutlet UIButton *reback;
//    
//    @property (weak, nonatomic) IBOutlet UIButton *forwarding;
//    @property (weak, nonatomic) IBOutlet UIButton *comments;
//    @property (weak, nonatomic) IBOutlet UIButton *praise;
    _userLogo.image=[UIImage imageNamed:@"sides_menu_tou"];
    _articleLogo.image=[UIImage imageNamed:@"aaa"];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.reback.layer.cornerRadius = 5;
    self.reback.layer.borderColor = [UIColor colorWithWhite:0.894 alpha:1.000].CGColor;
    self.reback.layer.borderWidth = 1;
}


@end
