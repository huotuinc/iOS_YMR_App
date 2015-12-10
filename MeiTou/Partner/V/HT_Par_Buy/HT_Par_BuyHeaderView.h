//
//  HT_Cpn_IteProjectDoingHeaderViewTableViewCell.h
//  HTTableViewCell
//
//  Created by che on 15/11/26.
//  Copyright © 2015年 车. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HT_Par_BuyHeaderView : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageVTop;
@property (weak, nonatomic) IBOutlet UIImageView *imageVLine;
@property (weak, nonatomic) IBOutlet UILabel *labelTitle;
@property (weak, nonatomic) IBOutlet UILabel *labeEnd;
@property (weak, nonatomic) IBOutlet UILabel *labelTime;
@property (weak, nonatomic) IBOutlet UILabel *labelDate;
@property (weak, nonatomic) IBOutlet UILabel *labelDone;
@property (weak, nonatomic) IBOutlet UILabel *labelPerson;
@property (weak, nonatomic) IBOutlet UIView *viewBase;
@property (weak, nonatomic) IBOutlet UIProgressView *viewProgress;
@property (weak, nonatomic) IBOutlet UIView *viewC;

@end
