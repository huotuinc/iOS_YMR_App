//
//  CallMeCell.m
//  MeiTou
//
//  Created by 刘琛 on 15/12/8.
//  Copyright © 2015年 车. All rights reserved.
//

#import "CallMeCell.h"

@implementation CallMeCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
    
//    @property (weak, nonatomic) IBOutlet UIImageView *userLogo;
//    @property (weak, nonatomic) IBOutlet UILabel *userName;
//    
//    @property (weak, nonatomic) IBOutlet UILabel *time;
//    
//    @property (weak, nonatomic) IBOutlet UILabel *detail;
//    
//    @property (weak, nonatomic) IBOutlet UIImageView *articleLogo;
//    
//    @property (weak, nonatomic) IBOutlet UILabel *articleTitle;
//    
//    @property (weak, nonatomic) IBOutlet UILabel *articleDetail;
//    
//    @property (weak, nonatomic) IBOutlet UIButton *reback;
    _userLogo.image=[UIImage imageNamed:@"sides_menu_tou"];
    _articleLogo.image=[UIImage imageNamed:@"aaa"];
    
    [self changeLabel:_time AndFont:22 AndColor:COLOR_TEXT_DATE];
    [self changeLabel:_articleDetail AndFont:22 AndColor:COLOR_TEXT_DATE];
    [self changeLabel:_userName AndFont:28 AndColor:COLOR_TEXT_TITILE];
    [self changeLabel:_articleTitle AndFont:28 AndColor:COLOR_TEXT_TITILE];
    [self changeLabel:_detail AndFont:28 AndColor:COLOR_TEXT_TITILE];
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.reback.layer.cornerRadius = 5;
    self.reback.layer.borderColor = [UIColor colorWithWhite:0.894 alpha:1.000].CGColor;
    self.reback.layer.borderWidth = 1;
}

/**
 *  设置label的字体大小和颜色
 *
 *  @param label 更改的label
 *  @param font  整形(相对效果图的像素大小)
 *  @param color 颜色
 */
-(void)changeLabel:(UILabel *) label AndFont:(NSInteger) font AndColor:(UIColor *) color{
    label.font=[UIFont systemFontOfSize:FONT_SIZE(font)];
    label.textColor=color;
}

@end
