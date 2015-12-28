//
//  CommentModel.h
//  MeiTou
//
//  Created by 刘琛 on 15/12/25.
//  Copyright © 2015年 车. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ReplyModel.h"
#import "LevelModel.h"

@interface CommentModel : NSObject

@property (nonatomic, strong) NSNumber *commentQuantity;
@property (nonatomic, strong) NSString *content;
@property (nonatomic, strong) LevelModel *level;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSNumber *pid;
@property (nonatomic, strong) NSNumber *praiseQuantity;
@property (nonatomic, strong) NSNumber *time;
@property (nonatomic, strong) NSArray *replyModels;
@property (nonatomic, strong) NSString *userHeadUrl;


@end
