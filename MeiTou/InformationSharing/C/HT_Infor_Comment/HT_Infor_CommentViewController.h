//
//  HT_Infor_CommentViewController.h
//  MeiTou
//
//  Created by che on 15/12/7.
//  Copyright © 2015年 车. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HT_Infor_CommentViewController : UIViewController

@property (nonatomic, assign) NSNumber *  ridComment; // 回复-回复
@property (nonatomic, assign) NSNumber *  shareId;
@property (nonatomic, assign) NSNumber *  praiseQuantityNews;//被点赞数 文章
@property (nonatomic, assign) NSNumber *  praiseQuantityReply;//被点赞数 评论
@property (nonatomic,strong) NSString *content;//分享 内容
@property (nonatomic,strong) NSString *imgUrl;//分享 封面图片
@property (nonatomic,strong) NSString *title;//分享 标题

@property (nonatomic, assign) BOOL NICE;

@end
