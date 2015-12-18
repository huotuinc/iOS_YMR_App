//
//  HT_Cpn_IteResultTableViewCell.h
//  HTTableViewCell
//
//  Created by che on 15/11/24.
//  Copyright © 2015年 车. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HT_Par_IteResultTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *ViewHead;
@property (weak, nonatomic) IBOutlet UIImageView *imageVHead;
@property (weak, nonatomic) IBOutlet UIImageView *imageVlevel;
@property (weak, nonatomic) IBOutlet UILabel *labelDate;
@property (weak, nonatomic) IBOutlet UILabel *labelName;
@property (weak, nonatomic) IBOutlet UIView *ViewHeadGroup;
@property (weak, nonatomic) IBOutlet UIView *viewBase;
@property (weak, nonatomic) IBOutlet UIImageView *imageVpoint;

@end
