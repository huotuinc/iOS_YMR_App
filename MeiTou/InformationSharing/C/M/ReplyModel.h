//
//  ReplyModel.h
//  MeiTou
//
//  Created by 刘琛 on 15/12/25.
//  Copyright © 2015年 车. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ReplyModel : NSObject

@property (nonatomic, strong) NSString *content;
@property (nonatomic, strong) NSString *replyName;
@property (nonatomic, strong) NSString *rid;
@property (nonatomic, strong) NSString *toReplyName;
@property (nonatomic, strong) NSNumber *userId;
@property (nonatomic, strong) NSNumber *replyId;
@end
