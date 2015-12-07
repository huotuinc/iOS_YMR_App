//
//  HT_Par_Ite_PaymentOrderCView.h
//  MeiTou
//
//  Created by che on 15/12/7.
//  Copyright © 2015年 车. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HT_Par_ItePaymentOrderCView : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *viewBase;
@property (weak, nonatomic) IBOutlet UIView *viewA;
@property (weak, nonatomic) IBOutlet UIView *viewB;
@property (weak, nonatomic) IBOutlet UIView *viewC;
@property (weak, nonatomic) IBOutlet UIView *viewD;
@property (weak, nonatomic) IBOutlet UILabel *labelMoney;
@property (weak, nonatomic) IBOutlet UILabel *labelLevel;
@property (weak, nonatomic) IBOutlet UILabel *labelTitle;
@property (weak, nonatomic) IBOutlet UIImageView *imageVPay;
@property (weak, nonatomic) IBOutlet UIButton *buttonPay;
@property (weak, nonatomic) IBOutlet UIImageView *imageVWei;
@property (weak, nonatomic) IBOutlet UIButton *buttonWei;
@property (weak, nonatomic) IBOutlet UIButton *buttonPaying;
@end
