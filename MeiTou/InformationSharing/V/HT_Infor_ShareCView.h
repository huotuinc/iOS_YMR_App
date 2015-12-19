//
//  HT_Information_ShareView.h
//  MeiTou
//
//  Created by che on 15/11/27.
//  Copyright © 2015年 车. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HT_Infor_ShareCView : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *labelTitle;
@property (weak, nonatomic) IBOutlet UITextField *textFTitle;
@property (weak, nonatomic) IBOutlet UITextField *textFContent;
@property (weak, nonatomic) IBOutlet UIImageView *imageVPhoto;
@property (weak, nonatomic) IBOutlet UIImageView *imageVEmotion;
@property (weak, nonatomic) IBOutlet UILabel *labelPoint;
@property (weak, nonatomic) IBOutlet UIButton *buttonAdd;
@property (weak, nonatomic) IBOutlet UILabel *labelAdd;
@property (weak, nonatomic) IBOutlet UIView *viewBase;
@property (weak, nonatomic) IBOutlet UIView *viewTop;
@property (weak, nonatomic) IBOutlet UILabel *labelPhoto;
@property (weak, nonatomic) IBOutlet UILabel *labelEmotion;
@property (weak, nonatomic) IBOutlet UIView *viewMain;

@end
