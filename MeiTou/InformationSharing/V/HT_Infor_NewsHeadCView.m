//
//  HT_Cpn_IteProjectDoingHeaderViewTableViewCell.m
//  HTTableViewCell
//
//  Created by che on 15/11/26.
//  Copyright © 2015年 车. All rights reserved.
//

#import "HT_Infor_NewsHeadCView.h"

@implementation HT_Infor_NewsHeadCView

- (void)awakeFromNib {
    // Initialization code
    
//    @property (weak, nonatomic) IBOutlet UIImageView *imageVTop;
//    @property (weak, nonatomic) IBOutlet UIImageView *imageVLine;
//    @property (weak, nonatomic) IBOutlet UILabel *labelTitle;
//    @property (weak, nonatomic) IBOutlet UILabel *labeEnd;
//    @property (weak, nonatomic) IBOutlet UILabel *labelTime;
//    @property (weak, nonatomic) IBOutlet UILabel *labelDate;
//    @property (weak, nonatomic) IBOutlet UILabel *labelDone;
//    @property (weak, nonatomic) IBOutlet UILabel *labelPerson;
//    @property (weak, nonatomic) IBOutlet UIView *viewProgress;
    
    for (int i=0; i<3; i++) {
        UILabel *label=(UILabel *)[self viewWithTag:110+i];
        [self changeLabel:label AndFont:20 AndColor:[UIColor whiteColor]];
        label.backgroundColor=COLOR_BACK_TIME;
        label.layer.cornerRadius=2;
        label.layer.masksToBounds=YES;
    }
    for (int i=0; i<3; i++) {
        UIImageView *imageV=(UIImageView * )[self viewWithTag:500+i];
        imageV.image=[UIImage imageNamed:@"line2"];
        
    }
    
    [self changeLabel:_labelTitle AndFont:30 AndColor:COLOR_TEXT_TITILE];
    [self changeLabel:_labeEnd AndFont:26 AndColor:COLOR_TEXT_DATE];
    [self changeLabel:_labelStart AndFont:22 AndColor:COLOR_TEXT_DATE];
    [self changeLabel:_labelStartM AndFont:28 AndColor:COLOR_TEXT_TITILE];
    [self changeLabel:_labelTarget AndFont:22 AndColor:COLOR_TEXT_DATE];
    [self changeLabel:_labelTargetM AndFont:28 AndColor:COLOR_TEXT_TITILE];
    [self changeLabel:_labelScore AndFont:26 AndColor:COLOR_BUTTON_RED];
    _imageVTop.image=[UIImage imageNamed:@"line2"];
 
    

    
    

    
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
