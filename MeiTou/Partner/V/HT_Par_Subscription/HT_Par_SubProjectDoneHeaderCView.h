//
//  HT_Cpn_IteProjectHeaderViewTableViewCell.h
//  HTTableViewCell
//
//  Created by che on 15/11/26.
//  Copyright © 2015年 车. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HT_Par_SubProjectDoneHeaderCView : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *labelDate;
@property (weak, nonatomic) IBOutlet UILabel *labelTime;
@property (weak, nonatomic) IBOutlet UILabel *labelPrice;
@property (weak, nonatomic) IBOutlet UILabel *labelTarget;
@property (weak, nonatomic) IBOutlet UILabel *labelDone;
@property (weak, nonatomic) IBOutlet UILabel *labelMoney;
@property (weak, nonatomic) IBOutlet UIView *ViewHeadGroup;
@property (weak, nonatomic) IBOutlet UILabel *labelSuccess;
@property (weak, nonatomic) IBOutlet UILabel *labelTitle;
@property (weak, nonatomic) IBOutlet UILabel *labelEnd;
@property (weak, nonatomic) IBOutlet UILabel *labelStart;
@property (weak, nonatomic) IBOutlet UILabel *labelBought;
@property (weak, nonatomic) IBOutlet UILabel *labelRest;
@property (weak, nonatomic) IBOutlet UILabel *labelBoughtNO;

@property (weak, nonatomic) IBOutlet UIImageView *imageVA;
@property (weak, nonatomic) IBOutlet UIImageView *imageVB;
@property (weak, nonatomic) IBOutlet UIImageView *imageVC;
@property (weak, nonatomic) IBOutlet UIImageView *imageVD;
@property (weak, nonatomic) IBOutlet UIImageView *imageVE;
@property (weak, nonatomic) IBOutlet UIImageView *imageVMore;
@property (weak, nonatomic) IBOutlet UIView *viewHeadGroup;
@property (weak, nonatomic) IBOutlet UIImageView *imageVRight;

@property (weak, nonatomic) IBOutlet UILabel *labelResult;
@property (weak, nonatomic) IBOutlet UIImageView *imagevLine;
@property (weak, nonatomic) IBOutlet UIImageView *imageVLineA;

@property (weak, nonatomic) IBOutlet UIImageView *imageVTop;
@property (weak, nonatomic) IBOutlet UIImageView *imageVState;
@property (weak, nonatomic) IBOutlet UIProgressView *viewProgress;
@end
