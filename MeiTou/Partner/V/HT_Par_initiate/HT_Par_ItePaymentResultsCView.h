//
//  HT_Par_Ite_PaymentOrderCView.h
//  MeiTou
//
//  Created by che on 15/12/7.
//  Copyright © 2015年 车. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HT_Par_ItePaymentResultsCView : UITableViewCell

@property (weak, nonatomic) IBOutlet UIView *ViewBase;
@property (weak, nonatomic) IBOutlet UIView *ViewA;
@property (weak, nonatomic) IBOutlet UIView *ViewB;
@property (weak, nonatomic) IBOutlet UIView *ViewC;
@property (weak, nonatomic) IBOutlet UILabel *labelState;
@property (weak, nonatomic) IBOutlet UILabel *labelPay;
@property (weak, nonatomic) IBOutlet UILabel *labelType;
@property (weak, nonatomic) IBOutlet UILabel *labelMoney;
@property (weak, nonatomic) IBOutlet UILabel *labelCreate;
@property (weak, nonatomic) IBOutlet UILabel *labelDate;

@end
