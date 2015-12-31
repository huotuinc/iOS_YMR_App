//
//  HT_Cpn_IteResultTableViewCell.m
//  HTTableViewCell
//
//  Created by che on 15/11/24.
//  Copyright © 2015年 车. All rights reserved.
//

#import "HT_Par_IteResultTableViewCell.h"
#import "HT_Par_IteResult_HeadView.h"

@implementation HT_Par_IteResultTableViewCell

- (void)awakeFromNib {
    // Initialization code
    
//    headV.frame = CGRectMake(0, 0, self.ViewHead.frame.size.width, self.ViewHead.frame.size.height);
//    [self.ViewHead addSubview:headV];
//    self.ViewHead.backgroundColor=[UIColor redColor];
//    _imageVHead.layer.cornerRadius=_imageVHead.frame.size.width/2;
    
    _imageVpoint.image=[UIImage imageNamed:@"oiu"];
    _imageVlevel.image=[UIImage imageNamed:@"common_LV2"];
    
    _viewBase.layer.cornerRadius=3;
    _viewBase.layer.borderWidth=1;
    _viewBase.layer.borderColor=[COLOR_BACK_MAIN CGColor];
    _viewBase.layer.masksToBounds=YES;
    
}

-(void)drawRect:(CGRect)rect{
    _imageVHead.image=[UIImage imageNamed:@"sides_menu_tou"];
    _imageVHead.layer.cornerRadius=_imageVHead.frame.size.height/2;
    _imageVHead.layer.masksToBounds=YES;
    ////
    for (int i=0; i<5; i++) {
        UIImageView *imageV=(UIImageView *)[self viewWithTag:100+i];
        imageV.image=[UIImage imageNamed:@"sides_menu_tou"];
        imageV.layer.cornerRadius=imageV.frame.size.width/2;
        imageV.layer.masksToBounds=YES;
    }
    for (int i=0; i<5; i++) {
        UIImageView *imageV=(UIImageView *)[self viewWithTag:110+i];
        imageV.image=[UIImage imageNamed:@"common_LV2"];
        imageV.layer.cornerRadius=imageV.frame.size.width/2;
        imageV.layer.masksToBounds=YES;
    }

}


- (void)layoutSubviews {
    [super layoutSubviews];
//    NSInteger height=_ViewHeadGroup.frame.size.height;

//    for (int i=0; i<5; i++) {
//        NSArray  *nib= [[NSBundle mainBundle]loadNibNamed:@"HT_Par_IteResult_HeadView" owner:nil options:nil];
//        HT_Par_IteResult_HeadView *headV=[nib firstObject];
//        headV.frame=CGRectMake(_ViewHeadGroup.frame.origin.x+_ViewHeadGroup.frame.size.width/5*i, 0, _ViewHeadGroup.frame.size.width/5, _ViewHeadGroup.frame.size.height);
////        headV.frame=CGRectMake(_ViewHeadGroup.frame.origin.x+_ViewHeadGroup.frame.size.width/5*(i%5), height*(i/5), _ViewHeadGroup.frame.size.width/5, height);
//        [self.ViewHeadGroup layoutIfNeeded];
//        [self.ViewHeadGroup addSubview:headV];
//    }
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
