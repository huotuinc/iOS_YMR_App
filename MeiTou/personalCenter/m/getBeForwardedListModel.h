//
//  getBeForwardedListModel.h
//  MeiTou
//
//  Created by che on 16/1/11.
//  Copyright © 2016年 车. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ShareType.h"
/**
 *  获取别人转发我的文章
 */
@interface getBeForwardedListModel : NSObject

@property (nonatomic, strong) NSNumber *headUrl;
@property (nonatomic, strong) NSString *img;
@property (nonatomic, strong) ShareType *shareType;
@property (nonatomic, strong) NSString *intro;
@property (nonatomic, strong) NSNumber *pId;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *userHeadUrl;
@property (nonatomic, strong) NSNumber *userId;

@end
