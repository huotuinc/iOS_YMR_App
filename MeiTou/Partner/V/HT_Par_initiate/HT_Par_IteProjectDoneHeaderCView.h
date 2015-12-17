//
//  HT_Cpn_IteProjectHeaderViewTableViewCell.h
//  HTTableViewCell
//
//  Created by che on 15/11/26.
//  Copyright © 2015年 车. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HT_Par_IteProjectDoneHeaderCView : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageVTop;
@property (weak, nonatomic) IBOutlet UIImageView *imagevState;
@property (weak, nonatomic) IBOutlet UILabel *labelTitle;
@property (weak, nonatomic) IBOutlet UIImageView *imageVLine;


@property (weak, nonatomic) IBOutlet UILabel *labelEnd;
@property (weak, nonatomic) IBOutlet UILabel *labelDate;
@property (weak, nonatomic) IBOutlet UILabel *labelTime;
@property (weak, nonatomic) IBOutlet UILabel *labelStart;
@property (weak, nonatomic) IBOutlet UILabel *labelPrice;
@property (weak, nonatomic) IBOutlet UILabel *labelAttend;
@property (weak, nonatomic) IBOutlet UILabel *labelPerson;
@property (weak, nonatomic) IBOutlet UILabel *labelTarget;
@property (weak, nonatomic) IBOutlet UILabel *labelMoney;
@property (weak, nonatomic) IBOutlet UILabel *labelDone;
@property (weak, nonatomic) IBOutlet UILabel *labelTip;
@property (weak, nonatomic) IBOutlet UILabel *labelResult;
@property (weak, nonatomic) IBOutlet UILabel *labelSuccess;
@property (weak, nonatomic) IBOutlet UIImageView *imageVline;

@property (weak, nonatomic) IBOutlet UIImageView *imageVRight;
@property (weak, nonatomic) IBOutlet UIProgressView *viewProgress;
@property (weak, nonatomic) IBOutlet UIView *viewHeadGroup;

@end
