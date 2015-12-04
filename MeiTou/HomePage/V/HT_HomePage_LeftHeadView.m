//
//  HT_HomePage_LeftHeadView.m
//  MeiTou
//
//  Created by che on 15/11/29.
//  Copyright © 2015年 车. All rights reserved.
//

#import "HT_HomePage_LeftHeadView.h"
#import "HT_Par_IteResult_HeadView.h"

@implementation HT_HomePage_LeftHeadView

- (void)awakeFromNib {
    // Initialization code
    NSArray  *nib= [[NSBundle mainBundle]loadNibNamed:@"HT_Par_IteResult_HeadView" owner:nil options:nil];
    UIView *headV=[nib firstObject];
   
    
    _LabelName.textAlignment=NSTextAlignmentCenter;
    _LabelName.text=@"小车";
    
    [self.headView addSubview:headV];
//    self.headView.backgroundColor=[UIColor redColor];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}



@end
