//
//  SystemMessageCell.m
//  MeiTou
//
//  Created by 刘琛 on 15/12/8.
//  Copyright © 2015年 车. All rights reserved.
//

#import "SystemMessageCell.h"

@implementation SystemMessageCell

- (void)awakeFromNib {
    // Initialization code
    _labelNotice.text=@"系统消息: 系统消息系统消息系统消息系统消息";
    _labelDate.text=@"2015-10-10";
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
