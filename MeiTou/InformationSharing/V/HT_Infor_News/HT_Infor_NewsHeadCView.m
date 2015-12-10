//
//  HT_Infor_NewsHeadCView.m
//  MeiTou
//
//  Created by che on 15/12/9.
//  Copyright © 2015年 车. All rights reserved.
//

#import "HT_Infor_NewsHeadCView.h"

@implementation HT_Infor_NewsHeadCView

- (void)awakeFromNib {
    // Initialization code
    _imageVLine.image=[UIImage imageNamed:@"line1"];
    
    _labelTitle.textColor=TITLECOLOR;
    
    _labelEnd.textColor=CONTENTCOLOR;
    _labelTime.textColor=CONTENTCOLOR;
    _labelEndTime.textColor=CONTENTCOLOR;
    _labelStart.textColor=CONTENTCOLOR;
    _labelStartMoney.textColor=CONTENTCOLOR;
    _labelEndMoney.textColor=CONTENTCOLOR;
    
    _labelScore.textColor=REDCOLOR;
    
//    _labelTitle.font=TITLEFONT;
//    
//    _labelEnd.textColor=CONTENTFONT;
//    _labelTime.textColor=CONTENTFONT;
//    _labelEndTime.textColor=CONTENTFONT;
//    _labelStart.textColor=CONTENTFONT;
//    _labelStartMoney.textColor=CONTENTFONT;
//    _labelEndMoney.textColor=CONTENTFONT;
//    
//    _labelScore.textColor=CONTENTFONT;

    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
