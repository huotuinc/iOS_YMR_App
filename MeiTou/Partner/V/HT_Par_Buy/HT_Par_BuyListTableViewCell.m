//
//  HT_Cpn_BuyListTableViewCell.m
//  HTTableViewCell
//
//  Created by che on 15/11/23.
//  Copyright © 2015年 车. All rights reserved.
//

#import "HT_Par_BuyListTableViewCell.h"

@implementation HT_Par_BuyListTableViewCell

- (void)awakeFromNib {
    // Initialization code
//    @property (weak, nonatomic) IBOutlet UIImageView *imageVHead;
//    @property (weak, nonatomic) IBOutlet UILabel *labelName;
//    @property (weak, nonatomic) IBOutlet UILabel *labelTel;
//    @property (weak, nonatomic) IBOutlet UILabel *labelNumber;
//    @property (weak, nonatomic) IBOutlet UIImageView *imageVlevel;
//    @property (weak, nonatomic) IBOutlet UILabel *labelDate;
    
    _labelName.text=@"投资人姓名";
    _labelName.font=[UIFont systemFontOfSize:FONT_SIZE(26)];
    _labelName.textColor=COLOR_TEXT_TITILE;
    
    _labelTel.font=[UIFont systemFontOfSize:FONT_SIZE(22)];
    _labelTel.textColor=COLOR_TEXT_DATE;
    
    _labelNumber.text=@"155555555";
    _labelNumber.font=[UIFont systemFontOfSize:FONT_SIZE(22)];
    _labelNumber.textColor=COLOR_TEXT_DATE;
    
    _labelDate.text=@"2015/10/10";
    _labelDate.font=[UIFont systemFontOfSize:FONT_SIZE(22)];
    _labelDate.textColor=COLOR_TEXT_CONTENT;
    

    
    [_buttonState setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_buttonState setBackgroundColor:COLOR_BUTTON_RED];
    [_buttonState setTitle:@"预约成功" forState:UIControlStateNormal];
    _buttonState.titleLabel.font=[UIFont systemFontOfSize:FONT_SIZE(28)];
    _buttonState.layer.cornerRadius=3;
    _buttonState.layer.masksToBounds=YES;
    _buttonState.clipsToBounds=YES;

}

-(void)drawRect:(CGRect)rect{
    _imageVHead.image=[UIImage imageNamed:@"sides_menu_tou"];
    _imageVHead.layer.cornerRadius=_imageVHead.frame.size.height/2;
    _imageVHead.layer.masksToBounds=YES;
    
    _imageVlevel.image=[UIImage imageNamed:@"common_LV2"];
    _imageVlevel.layer.masksToBounds=YES;
    
    
   

}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
