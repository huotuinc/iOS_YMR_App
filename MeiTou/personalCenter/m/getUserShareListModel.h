//
//  getUserShareListModel.h
//  MeiTou
//
//  Created by che on 16/1/11.
//  Copyright © 2016年 车. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ShareType.h"
#import "CheckType.h"
/**
 *  获取我分享的文章

 */
@interface getUserShareListModel : NSObject

@property (nonatomic, strong) CheckType *checkType;

@property (nonatomic, strong) NSString *img;
@property (nonatomic, strong) NSNumber *integral;
@property (nonatomic, strong) NSString *intro;
@property (nonatomic, strong) NSNumber *pId;
@property (nonatomic, strong) ShareType *shareType;
@property (nonatomic, strong) NSNumber *time;
@property (nonatomic, strong) NSString *title;


@end
