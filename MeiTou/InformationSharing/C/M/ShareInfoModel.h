//
//  ShareInfoModel.h
//  MeiTou
//
//  Created by che on 16/1/8.
//  Copyright © 2016年 车. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ShareInfoModel : NSObject

@property (nonatomic, strong) NSString *content;
@property (nonatomic, strong) NSString *img;
@property (nonatomic, strong) NSNumber *totalIntegral;
@property (nonatomic, strong) NSNumber *praiseQuantity;
@property (nonatomic, strong) NSNumber *relayQuantity;
@property (nonatomic, strong) NSNumber *relayReward;
@property (nonatomic, strong) NSNumber *useIntegral;
@property (nonatomic, strong) NSNumber *time;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *transmitUrl;

@end
