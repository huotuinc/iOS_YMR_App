//
//  HT_HomePage_ChangeIDCViewTableViewCell.m
//  MeiTou
//
//  Created by che on 15/12/22.
//  Copyright © 2015年 车. All rights reserved.
//

#import "HT_HomePage_ChangeIDCView.h"

@implementation HT_HomePage_ChangeIDCView

- (void)awakeFromNib {
    // Initialization code
    _imageVLineA.image=[UIImage imageNamed:@"line1"];
    _imageVLineB.image=[UIImage imageNamed:@"line1"];
    _imageVLineC.image=[UIImage imageNamed:@"line1"];
    _imageVLineD.image=[UIImage imageNamed:@"line1"];
    _imageVChange.image=[UIImage imageNamed:@"qiehuan"];
    _imageVNotice.image=[UIImage imageNamed:@"rrt"];
    
    [self changeLabel:_labelGo AndColor:COLOR_TEXT_TITILE AndFont:34 Andtext:@"去绑定微信号"];
    [self changeLabel:_labelWe AndColor:COLOR_TEXT_DATE AndFont:22 Andtext:@"我们检查出你注册了多个账户"];
    [self changeLabel:_labelPlease AndColor:COLOR_TEXT_TITILE AndFont:34 Andtext:@"请选择一个账户"];
    [self changeLabel:_labelChange AndColor:COLOR_TEXT_DATE AndFont:22 Andtext:@"在左侧菜单点击图标可切换账户"];
    [self changeLabel:_labelAccountA AndColor:COLOR_BUTTON_RED AndFont:28 Andtext:@"18452653259"];
    [self changeLabel:_labelAccountB AndColor:COLOR_BUTTON_RED AndFont:28 Andtext:@"侧小愤而回"];
    

}
-(void)drawRect:(CGRect)rect{
    _viewBase.layer.cornerRadius=10;
    _viewBase.layer.masksToBounds=YES;
//    _viewBase.clipsToBounds=YES;
    _viewA.clipsToBounds=YES;
    _viewB.clipsToBounds=YES;

}
-(void)changeLabel:(UILabel *) label AndColor:(UIColor *) color AndFont:(NSInteger ) font Andtext:(NSString *)text{
    label.text=text;
    label.textColor=color;
    label.font=[UIFont systemFontOfSize:FONT_SIZE(font)];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
