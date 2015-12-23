//
//  HT_Cpn_BuyListTableViewCell.m
//  HTTableViewCell
//
//  Created by che on 15/11/23.
//  Copyright © 2015年 车. All rights reserved.
//

#import "HT_Par_SubListTableViewCell.h"

@implementation HT_Par_SubListTableViewCell

- (void)awakeFromNib {
    // Initialization code
//    @property (weak, nonatomic) IBOutlet UILabel *labelName;
//    @property (weak, nonatomic) IBOutlet UILabel *labelTel;
//    @property (weak, nonatomic) IBOutlet UILabel *labelPrice;
//    
//    @property (weak, nonatomic) IBOutlet UIImageView *imageVHead;
//    @property (weak, nonatomic) IBOutlet UIImageView *imageVLevel;
//    @property (weak, nonatomic) IBOutlet UIImageView *imageVState;
    _imageVState.image=[UIImage imageNamed:@"rengou_content_right_success"];
    _imageVHead.image=[UIImage imageNamed:@"sides_menu_tou"];
    _imageVLevel.image=[UIImage imageNamed:@"common_LV2"];
    
    _viewBase.layer.borderColor=[COLOR_LINE_C CGColor];
    _viewBase.layer.borderWidth=1;
    _viewBase.layer.cornerRadius=3;
    _viewBase.layer.masksToBounds=YES;
    _viewBase.clipsToBounds=YES;
    
    _labelName.font=[UIFont systemFontOfSize:FONT_SIZE(26)];
    _labelDate.font=[UIFont systemFontOfSize:FONT_SIZE(22)];
    _labelPrice.font=[UIFont systemFontOfSize:FONT_SIZE(30)];
    _labelName.textColor=COLOR_TEXT_TITILE;
    _labelDate.textColor=COLOR_TEXT_DATE;
    _labelPrice.textColor=COLOR_BUTTON_RED;
    
    

    
    

}
-(void)drawRect:(CGRect)rect{
    _imageVHead.layer.cornerRadius=_imageVHead.frame.size.height/2;
    _imageVHead.layer.masksToBounds=YES;

}




- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
