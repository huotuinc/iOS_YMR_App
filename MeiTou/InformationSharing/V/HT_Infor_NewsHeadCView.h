//
//  HT_Cpn_IteProjectDoingHeaderViewTableViewCell.h
//  HTTableViewCell
//
//  Created by che on 15/11/26.
//  Copyright © 2015年 车. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HT_Infor_NewsHeadCView : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageVTop;
@property (weak, nonatomic) IBOutlet UIImageView *imageVLineA;
@property (weak, nonatomic) IBOutlet UIImageView *imageVLineB;
@property (weak, nonatomic) IBOutlet UIImageView *imageVLineC;
@property (weak, nonatomic) IBOutlet UIImageView *imageVLineD;

@property (weak, nonatomic) IBOutlet UILabel *labelTitle;
@property (weak, nonatomic) IBOutlet UILabel *labeEnd;

@property (weak, nonatomic) IBOutlet UIView *viewBase;

@property (weak, nonatomic) IBOutlet UILabel *labelScore;

@property (weak, nonatomic) IBOutlet UILabel *labelStart;
@property (weak, nonatomic) IBOutlet UILabel *labelStartM;
@property (weak, nonatomic) IBOutlet UILabel *labelTarget;
@property (weak, nonatomic) IBOutlet UILabel *labelTargetM;

@property (weak, nonatomic) IBOutlet UILabel *labelH;
@property (weak, nonatomic) IBOutlet UILabel *labelM;
@property (weak, nonatomic) IBOutlet UILabel *labelS;
@property (weak, nonatomic) IBOutlet UILabel *labelSymbolA;
@property (weak, nonatomic) IBOutlet UILabel *labelSymbolB;

@end
