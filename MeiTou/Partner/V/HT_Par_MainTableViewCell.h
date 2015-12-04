//
//  HT_Cpn_MainTableViewCell.h
//  MeiTou
//
//  Created by che on 15/12/1.
//  Copyright © 2015年 车. All rights reserved.
//
//
#import <UIKit/UIKit.h>

@interface HT_Par_MainTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageVTop;
@property (weak, nonatomic) IBOutlet UILabel *LabelTitle;
@property (weak, nonatomic) IBOutlet UILabel *labelDate;
@property (weak, nonatomic) IBOutlet UILabel *labelContent;
@property (weak, nonatomic) IBOutlet UILabel *labelLeft;
@property (weak, nonatomic) IBOutlet UILabel *labelRight;
@property (weak, nonatomic) IBOutlet UILabel *labelBottomProgress;
@property (weak, nonatomic) IBOutlet UILabel *labelSurfaceProgress;
@property (weak, nonatomic) IBOutlet UIButton *ButtonGo;
@property (weak, nonatomic) IBOutlet UIView *A_AView
;

@end
