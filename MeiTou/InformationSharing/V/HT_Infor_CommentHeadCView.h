//
//  HT_News_HeadTableViewCell.h
//  HTTableViewCell
//
//  Created by che on 15/11/25.
//  Copyright © 2015年 车. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HT_Infor_CommentHeadCView : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *labelTitle;
@property (weak, nonatomic) IBOutlet UILabel *labelDate;
@property (weak, nonatomic) IBOutlet UILabel *labelScore;
@property (weak, nonatomic) IBOutlet UIImageView *imageVMain;
@property (weak, nonatomic) IBOutlet UILabel *labelContent;
@property (weak, nonatomic) IBOutlet UIImageView *imageVLineA;
@property (weak, nonatomic) IBOutlet UIImageView *imageVBack;
@property (weak, nonatomic) IBOutlet UIImageView *imageVLineB;

@end
