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
    
    _labelTitle.textColor=COLOR_TEXT_TITILE;
    
    _labelEnd.textColor=COLOR_TEXT_DATE;
    _labelTime.textColor=COLOR_TEXT_DATE;
    _labelEndTime.textColor=COLOR_TEXT_DATE;
    _labelStart.textColor=COLOR_TEXT_DATE;
    _labelStartMoney.textColor=COLOR_TEXT_DATE;
    _labelEndMoney.textColor=COLOR_TEXT_DATE;
    
    _labelScore.textColor=COLOR_BUTTON_RED;
    
    _labelTitle.font=[UIFont systemFontOfSize:FONT_SIZE(32)];
    NSLog(@"******** %f **********",FONT_SIZE(32));
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
