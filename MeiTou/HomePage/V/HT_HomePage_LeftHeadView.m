//
//  HT_HomePage_LeftHeadView.m
//  MeiTou
//
//  Created by che on 15/11/29.
//  Copyright © 2015年 车. All rights reserved.
//

#import "HT_HomePage_LeftHeadView.h"

@implementation HT_HomePage_LeftHeadView

- (void)awakeFromNib {
    // Initialization code
  
    _labelHelp.text=@"联系客服";
    _labelHelp.textColor=COLOR_LEFTVC_Main;
    _labelHelp.font=[UIFont systemFontOfSize:FONT_SIZE(22)];
    _imageVHelp.image=[UIImage imageNamed:@"SlidingMenu_content_bottom_kefu"];
    
    
    _LabelName.textAlignment=NSTextAlignmentCenter;
    _LabelName.text=@"小车";
    _LabelName.textColor=COLOR_LEFTVC_Main;
    _LabelName.font=[UIFont systemFontOfSize:FONT_SIZE(30)];
    
    _imageVLevel.image=[UIImage imageNamed:@"SlidingMenu_content_LV3"];
    
//    _imageVHead.image=[UIImage imageNamed:@"sides_menu_tou"];
//    _imageVHead.backgroundColor=[UIColor redColor];
//    _imageVHead.layer.cornerRadius=_imageVHead.frame.size.height/2;
//    _imageVHead.layer.borderColor=[[UIColor redColor] CGColor];
//    _imageVHead.layer.borderWidth=5;
//    _imageVHead.layer.masksToBounds=YES;
    
}
-(void)drawRect:(CGRect)rect{
    _imageVHead.image=[UIImage imageNamed:@"sides_menu_tou"];
    _imageVHead.layer.cornerRadius=_imageVHead.frame.size.height/2;
    _imageVHead.layer.borderColor=[COLOR_LEFTVC_HEAD CGColor];
    _imageVHead.layer.borderWidth=5;
    _imageVHead.layer.masksToBounds=YES;
////
}

-(void)drawRect:(CGRect)rect forViewPrintFormatter:(UIViewPrintFormatter *)formatter{

}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}



@end
