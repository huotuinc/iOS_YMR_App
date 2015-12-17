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
    _A_AView.backgroundColor=COLOR_TEXT_TITILE;
    _LabelTitle.textColor=[UIColor whiteColor];
    _LabelTitle.font=[UIFont systemFontOfSize:FONT_SIZE(28)];
    
    _labelDate.textColor=[UIColor whiteColor];
    _labelDate.textAlignment=NSTextAlignmentRight;
    _labelDate.font=[UIFont systemFontOfSize:FONT_SIZE(22)];
    
    _labelLeft.textAlignment=NSTextAlignmentCenter;
    _labelLeft.font=[UIFont systemFontOfSize:FONT_SIZE(22)];
    _labelRight.font=[UIFont systemFontOfSize:FONT_SIZE(22)];
    _labelRight.textAlignment=NSTextAlignmentCenter;
    
    _labelContent.font=[UIFont systemFontOfSize:FONT_SIZE(26)];
    _labelContent.textColor=COLOR_TEXT_CONTENT;
    _labelLeft.textColor=COLOR_TEXT_TITILE;
    _labelRight.textColor=COLOR_BUTTON_RED;
    
    
    _viewProgress.transform=CGAffineTransformMakeScale(1.0f, 1.0f);
    _viewProgress.layer.cornerRadius=5;
    _viewProgress.clipsToBounds=YES;
    //设置进度条颜色
    _viewProgress.trackTintColor=COLOR_BACK_MAIN;
    //设置进度默认值，这个相当于百分比，范围在0~1之间，不可以设置最大最小值
    _viewProgress.progress=0.7;
    //设置进度条上进度的颜色
    _viewProgress.progressTintColor=COLOR_BUTTON_ORANGE;
    
    [_ButtonGo setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _ButtonGo.titleLabel.font=[UIFont systemFontOfSize:FONT_SIZE(28)];
    _ButtonGo.layer.cornerRadius=3;
    _ButtonGo.layer.masksToBounds=YES;
    _ButtonGo.clipsToBounds=YES;
    

    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
