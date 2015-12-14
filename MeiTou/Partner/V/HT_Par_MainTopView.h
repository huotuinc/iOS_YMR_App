//
//  HT_Cpn_IteTopViewTableViewCell.h
//  HTTableViewCell
//
//  Created by che on 15/11/26.
//  Copyright © 2015年 车. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HT_Par_MainTopView : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *ViewProgect;
@property (weak, nonatomic) IBOutlet UIView *ViewPerson;
@property (weak, nonatomic) IBOutlet UILabel *labelPerson;
@property (weak, nonatomic) IBOutlet UILabel *labelProject;
@property (weak, nonatomic) IBOutlet UIImageView *imageVProject;
@property (weak, nonatomic) IBOutlet UIImageView *imageVPerson;
@property (weak, nonatomic) IBOutlet UIImageView *imageVLine;
@property (weak, nonatomic) IBOutlet UIImageView *imageVLineB;

@end
