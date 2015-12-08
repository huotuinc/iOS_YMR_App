//
//  HT_News_MainTableViewCell.h
//  HTTableViewCell
//
//  Created by che on 15/11/23.
//  Copyright © 2015年 车. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HT_Infor_MainTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *viewBase;
@property (weak, nonatomic) IBOutlet UIImageView *imageVHead;
@property (weak, nonatomic) IBOutlet UILabel *labelTitle;
@property (weak, nonatomic) IBOutlet UIImageView *imageVState;
@property (weak, nonatomic) IBOutlet UILabel *labelDate;
@property (weak, nonatomic) IBOutlet UIImageView *imageVMain;
@property (weak, nonatomic) IBOutlet UIImageView *imageVNice;
@property (weak, nonatomic) IBOutlet UIImageView *imageVComment;
@property (weak, nonatomic) IBOutlet UIImageView *imageVShare;
@property (weak, nonatomic) IBOutlet UILabel *labelContent;
@property (weak, nonatomic) IBOutlet UILabel *labelNice;
@property (weak, nonatomic) IBOutlet UILabel *labelComment;
@property (weak, nonatomic) IBOutlet UILabel *labelShare;
@property (weak, nonatomic) IBOutlet UILabel *labelScore;
@property (weak, nonatomic) IBOutlet UILabel *labelCount;
@property (weak, nonatomic) IBOutlet UIView *viewHeadGroup;

@end
