//
//  HT_Infor_CommentReplyCView.h
//  MeiTou
//
//  Created by che on 16/1/12.
//  Copyright © 2016年 车. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HT_Infor_CommentReplyCView : UITableViewCell
@property (weak, nonatomic) IBOutlet UITextView *viewText;
@property (weak, nonatomic) IBOutlet UIButton *buttonSend;
@property (weak, nonatomic) IBOutlet UIView *viewBack;
@property (weak, nonatomic) IBOutlet UIButton *buttonCancel;

@end
