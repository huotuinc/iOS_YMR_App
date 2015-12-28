//
//  CommentModel.m
//  MeiTou
//
//  Created by 刘琛 on 15/12/25.
//  Copyright © 2015年 车. All rights reserved.
//

#import "CommentModel.h"

@implementation CommentModel

- (NSDictionary *)objectClassInArray
{
    return @{@"replyModels":[ReplyModel class]};
}

@end
