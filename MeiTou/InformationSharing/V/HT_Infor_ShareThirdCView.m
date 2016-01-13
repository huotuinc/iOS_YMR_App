//
//  HT_Infor_ShareThirdCView.m
//  MeiTou
//
//  Created by che on 16/1/13.
//  Copyright © 2016年 车. All rights reserved.
//

#import "HT_Infor_ShareThirdCView.h"

@implementation HT_Infor_ShareThirdCView

- (void)awakeFromNib {
    // Initialization code
    [self changeLabel:_labelShare AndFont:30 AndColor:COLOR_TEXT_TITILE];
    _labelShare.text=@"分享到";
    _imageVQQ.image=[UIImage imageNamed:@"login_qq"];
    _imageVWei.image=[UIImage imageNamed:@"login_weixin"];
    _imageVTwitter.image=[UIImage imageNamed:@"login_weibo"];
}

-(void)drawRect:(CGRect)rect{

}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
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
