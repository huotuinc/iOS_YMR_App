//
//  MainTableViewCell.h
//  Reply
//
//  Created by che on 15/12/28.
//  Copyright © 2015年 车. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 *  回复主要的cell
 */
@interface HT_Infor_CommentTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *labelMain;
@property (weak, nonatomic) IBOutlet UIImageView *imageVLineA;
@property (weak, nonatomic) IBOutlet UIImageView *imageVLineB;
@property (weak, nonatomic) IBOutlet UIView *viewBack;

@end
