//
//  HT_Cpn_IteSubscriptionTableViewCell.h
//  HTTableViewCell
//
//  Created by che on 15/11/23.
//  Copyright © 2015年 车. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HT_Par_IteOrderCCView : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *labelName;
@property (weak, nonatomic) IBOutlet UILabel *labelTel;
@property (weak, nonatomic) IBOutlet UILabel *labelMoney;
@property (weak, nonatomic) IBOutlet UILabel *labelMark;
@property (weak, nonatomic) IBOutlet UILabel *labelNotice;
@property (weak, nonatomic) IBOutlet UILabel *labelSelect;
@property (weak, nonatomic) IBOutlet UITextField *textFname;
@property (weak, nonatomic) IBOutlet UITextField *textFTel;
@property (weak, nonatomic) IBOutlet UITextField *textFMark;
@property (weak, nonatomic) IBOutlet UIButton *buttonSubmit;
@property (weak, nonatomic) IBOutlet UIView *viewMoney;

@property (weak, nonatomic) IBOutlet UIView *viewSelect;

@end
