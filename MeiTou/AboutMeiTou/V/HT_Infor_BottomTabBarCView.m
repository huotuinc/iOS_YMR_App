//
//  HT_About_BottomCView.m
//  MeiTou
//
//  Created by che on 15/12/11.
//  Copyright © 2015年 车. All rights reserved.
//

#import "HT_Infor_BottomTabBarCView.h"

@implementation HT_Infor_BottomTabBarCView

- (void)awakeFromNib {
    // Initialization code
    _imageVShop.image=[UIImage imageNamed:@"cosmetology_main_menu_bottom_shop"];
    _imageVSearch.image=[UIImage imageNamed:@"cosmetology_main_menu_bottom_search"];
    _imageVShare.image=[UIImage imageNamed:@"cosmetology_main_menu_bottom_share"];
    _imageVLine.image=[UIImage imageNamed:@"line1"];
    _labelShop.text=@"店铺";
    _labelSearch.text=@"搜索";
    _labelShare.text=@"我要分享";
    
    _labelShop.textColor=COLOR_TEXT_DATE;
    _labelShare.textColor=COLOR_TEXT_DATE;
    _labelSearch.textColor=COLOR_TEXT_DATE;
    
    _labelShop.font=[UIFont systemFontOfSize:FONT_SIZE(22)];
    _labelSearch.font=[UIFont systemFontOfSize:FONT_SIZE(22)];
    _labelShare.font=[UIFont systemFontOfSize:FONT_SIZE(22)];
    

}
-(void)drawRect:(CGRect)rect{

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

@end
