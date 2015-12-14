//
//  HT_HomePage_PersonTableViewCell.m
//  MeiTou
//
//  Created by che on 15/11/30.
//  Copyright © 2015年 车. All rights reserved.
//

#import "HT_HomePage_PersonTableViewCell.h"

@implementation HT_HomePage_PersonTableViewCell

- (void)awakeFromNib {
    // Initialization code
//    @property (weak, nonatomic) IBOutlet UIImageView *imageVHead;
//    @property (weak, nonatomic) IBOutlet UILabel *labelName;
//    @property (weak, nonatomic) IBOutlet UIImageView *imageVLevel;
    _labelName.text=@"小美1111";
    _imageVLevel.image=[UIImage imageNamed:@"SlidingMenu_content_LV3"];
//    
}

-(void)drawRect:(CGRect)rect{
    _imageVHead.image=[UIImage imageNamed:@"sides_menu_tou"];
    _imageVHead.backgroundColor=[UIColor redColor];
    _imageVHead.layer.cornerRadius=_imageVHead.frame.size.height/2;
    _imageVHead.layer.borderColor=[[UIColor grayColor] CGColor];
    _imageVHead.layer.borderWidth=2;
    _imageVHead.layer.masksToBounds=YES;
    ////
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
