//
//  MainTableViewCell.m
//  Reply
//
//  Created by che on 15/12/28.
//  Copyright © 2015年 车. All rights reserved.
//

#import "HT_Infor_CommentTableViewCell.h"
//底色 浅灰底色_正文背景 输入框底色
#define COLOR_BACK_MAIN [UIColor colorWithRed:242/255.0f green:242/255.0f blue:242/255.0f alpha:1]
@implementation HT_Infor_CommentTableViewCell

- (void)awakeFromNib {
    // Initialization code
    _labelMain.numberOfLines=0;
    _labelMain.font=[UIFont systemFontOfSize:17];
    _viewBack.backgroundColor=COLOR_BACK_MAIN;
//    _imageVLineA.image=[UIImage imageNamed:@"xians"];
//    _imageVLineB.image=[UIImage imageNamed:@"xians"];
    
    
//    _viewBase.layer.cornerRadius=3;
//    _viewBase.layer.borderWidth=1;
//    _viewBase.layer.borderColor=[COLOR_BACK_MAIN CGColor];
//    _viewBase.layer.masksToBounds=YES;
//    _viewBase.backgroundColor=COLOR_BACK_MAIN;
//    _imagePoint.image=[UIImage imageNamed:@"kkr"];

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
