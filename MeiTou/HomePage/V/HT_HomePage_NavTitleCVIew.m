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
    
    [self changeLabel:_labelA AndFont:28 AndColor:COLOR_TEXT_TITILE];
    [self changeLabel:_labelB AndFont:28 AndColor:COLOR_TEXT_TITILE];

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

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
