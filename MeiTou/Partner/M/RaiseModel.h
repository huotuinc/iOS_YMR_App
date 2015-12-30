//
//  RaiseModel.h
//  MeiTou
//
//  Created by 刘琛 on 15/12/29.
//  Copyright © 2015年 车. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LevelModel.h"

@interface RaiseModel : NSObject

@property (nonatomic, strong) NSNumber *amount;
@property (nonatomic, strong) LevelModel *level;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSNumber *pid;

@end
