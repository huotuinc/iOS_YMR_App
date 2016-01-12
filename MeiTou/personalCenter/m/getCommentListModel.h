//
//  getCommentListModel.h
//  MeiTou
//
//  Created by che on 16/1/11.
//  Copyright © 2016年 车. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ShareType.h"
/**
 *  获取别人对我文章的评论列表
 */
@interface getCommentListModel : NSObject

@property (nonatomic, strong) NSNumber *cId;
@property (nonatomic, strong) NSString *commentComment;
@property (nonatomic, strong) NSString *commentName;
@property (nonatomic, strong) NSNumber *commentTime;
@property (nonatomic, strong) NSNumber *commentUserId;
@property (nonatomic, strong) NSString *img;
@property (nonatomic, strong) ShareType *shareType;
@property (nonatomic, strong) NSString *intro;
@property (nonatomic, strong) NSNumber *pId;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *userHeadUrl;
@property (nonatomic, strong) NSString *userName;
@end
