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
}

- (void)layoutSubviews {
    [super layoutSubviews];
    NSArray  *nib= [[NSBundle mainBundle]loadNibNamed:@"HT_Par_IteResult_HeadView" owner:nil options:nil];
    HT_Par_IteResult_HeadView *headV=[nib firstObject];
    
    [self.ViewHead layoutIfNeeded];
     [self.ViewHead addSubview:headV];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
