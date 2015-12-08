//
//  HT_Information_ShareView.m
//  MeiTou
//
//  Created by che on 15/11/27.
//  Copyright © 2015年 车. All rights reserved.
//

#import "HT_Infor_ShareCView.h"

@implementation HT_Infor_ShareCView

- (void)awakeFromNib {
    // Initialization code
//    @property (weak, nonatomic) IBOutlet UILabel *labelTitle;
//    @property (weak, nonatomic) IBOutlet UITextField *textFTitle;
//    @property (weak, nonatomic) IBOutlet UITextField *textFContent;
//    @property (weak, nonatomic) IBOutlet UIImageView *imageVPhoto;
//    @property (weak, nonatomic) IBOutlet UIImageView *imageVEmotion;
//    @property (weak, nonatomic) IBOutlet UILabel *labelPoint;
    _imageVPhoto.image=[UIImage imageNamed:@"share_content_bottom_pic"];
    _imageVEmotion.image=[UIImage imageNamed:@"share_content_bottom_expression"];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
