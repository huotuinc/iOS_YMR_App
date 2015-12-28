//
//  CrowdModel.h
//  MeiTou
//
//  Created by 刘琛 on 15/12/28.
//  Copyright © 2015年 车. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ShareType.h"

@interface CrowdModel : NSObject

@property (nonatomic, strong) NSNumber *currentBooking;
@property (nonatomic, strong) NSNumber *currentMoeny;
@property (nonatomic, strong) NSNumber *endTime;
@property (nonatomic, strong) NSNumber *pid;
@property (nonatomic, strong) NSString *puctureUrl;
@property (nonatomic, strong) NSNumber *startMoeny;
@property (nonatomic, strong) NSNumber *startTime;
@property (nonatomic, strong) NSString *summary;
@property (nonatomic, strong) NSNumber *time;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSNumber *toBooking;
@property (nonatomic, strong) NSNumber *toMoeny;
@property (nonatomic, strong) ShareType *type;


@end
