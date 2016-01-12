//
//  updateUserProfileModel.h
//  MeiTou
//
//  Created by che on 16/1/11.
//  Copyright © 2016年 车. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserLevel.h"
/**
 *  更新用户个人信息
 */
@interface updateUserProfileModel : NSObject

@property (nonatomic, strong) NSString *headUrl;
@property (nonatomic, assign) BOOL isBindMobile;
@property (nonatomic, strong) NSNumber *merchantId;
@property (nonatomic, strong) NSString *mobile;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *nickName;
@property (nonatomic, strong) NSNumber *score;
@property (nonatomic, strong) NSNumber *sex;
@property (nonatomic, strong) NSString *token;
@property (nonatomic, strong) NSNumber *userId;

@property (nonatomic, strong) NSString *userName;


@end
