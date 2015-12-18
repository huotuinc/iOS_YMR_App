//
//  HT_Cpn_BuyListTableViewCell.h
//  HTTableViewCell
//
//  Created by che on 15/11/23.
//  Copyright © 2015年 车. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HT_Infor_CommentCellHeaderView : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageVHead;
@property (weak, nonatomic) IBOutlet UIImageView *imageVLevel;
@property (weak, nonatomic) IBOutlet UILabel *labelContent;
@property (weak, nonatomic) IBOutlet UIImageView *imageVComment;
@property (weak, nonatomic) IBOutlet UIImageView *imageVNice;
@property (weak, nonatomic) IBOutlet UILabel *labelComment;
@property (weak, nonatomic) IBOutlet UILabel *labelNice;

@property (weak, nonatomic) IBOutlet UILabel *labelName;
@property (weak, nonatomic) IBOutlet UILabel *labelDate;
@property (weak, nonatomic) IBOutlet UIImageView *imageVPoint;
@end
