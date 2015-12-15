//
//  HT_Cpn_MainTableViewCell.m
//  MeiTou
//
//  Created by che on 15/12/1.
//  Copyright © 2015年 车. All rights reserved.
//

#import "HT_Par_MainTableViewCell.h"

@implementation HT_Par_MainTableViewCell

- (void)awakeFromNib {
    // Initialization code
//    @property (weak, nonatomic) IBOutlet UIImageView *imageVTop;
//    @property (weak, nonatomic) IBOutlet UILabel *LabelTitle;
//    @property (weak, nonatomic) IBOutlet UILabel *labelDate;
//    @property (weak, nonatomic) IBOutlet UILabel *labelContent;
//    @property (weak, nonatomic) IBOutlet UILabel *labelLeft;
//    @property (weak, nonatomic) IBOutlet UILabel *labelRight;
//    @property (weak, nonatomic) IBOutlet UILabel *labelProgress;
//    @property (weak, nonatomic) IBOutlet UIButton *ButtonGo;
//}
    _imageVTop.image=[UIImage imageNamed:@"aaa"];
    _A_AView.alpha=0.5;
    _A_AView.backgroundColor=COLOR_TEXT_CONTENT;
    _LabelTitle.textColor=[UIColor whiteColor];
    _LabelTitle.alpha=0.5;
    _LabelTitle.font=[UIFont systemFontOfSize:FONT_SIZE(20)];
    
    _labelDate.textColor=[UIColor whiteColor];
    _labelDate.textAlignment=NSTextAlignmentRight;
    _labelDate.alpha=0.5;
    _labelDate.font=[UIFont systemFontOfSize:FONT_SIZE(20)];
    
    _labelLeft.textAlignment=NSTextAlignmentCenter;
    _labelLeft.font=[UIFont systemFontOfSize:20];
    _labelRight.font=[UIFont systemFontOfSize:20];
    _labelRight.textAlignment=NSTextAlignmentCenter;
    
    _labelContent.textColor=COLOR_TEXT_CONTENT;
    _labelLeft.textColor=COLOR_TEXT_TITILE;
    _labelRight.textColor=COLOR_BUTTON_RED;
    
    

    

    
    
    
    
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
