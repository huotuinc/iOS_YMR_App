//
//  getPraiseListModel.h
//  MeiTou
//
//  Created by che on 16/1/11.
//  Copyright © 2016年 车. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ShareType.h"
/**
 *  获取别人对我文章点赞的列表
 */
@interface getPraiseListModel : NSObject

@property (nonatomic, strong) NSString *img;
@property (nonatomic, strong) NSString *intro;
@property (nonatomic, strong) NSNumber *pId;
@property (nonatomic, strong) ShareType *shareType;
@property (nonatomic, strong) NSNumber *sId;
@property (nonatomic, strong) NSNumber *time;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *userHeadUrl;
@property (nonatomic, strong) NSString *userName;

@end
