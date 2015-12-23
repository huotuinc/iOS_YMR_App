//
//  InformationModel.h
//  MeiTou
//
//  Created by 刘琛 on 15/12/23.
//  Copyright © 2015年 车. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ShareType.h"

@interface InformationModel : NSObject

@property (nonatomic, assign) BOOL boutique;
@property (nonatomic, strong) NSNumber *commentQuantity;
@property (nonatomic, strong) NSString *content;
@property (nonatomic, strong) NSArray *headUrls;
@property (nonatomic, strong) NSString *img;
@property (nonatomic, strong) NSString *intro;
@property (nonatomic, strong) NSNumber *pid;
@property (nonatomic, strong) NSNumber *praiseQuantity;
@property (nonatomic, strong) NSNumber *relayQuantity;
@property (nonatomic, strong) NSNumber *relayScore;
@property (nonatomic, strong) ShareType *shareType;
@property (nonatomic, strong) NSNumber *time;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, assign) BOOL top;
@property (nonatomic, strong) NSString *userHeadUrl;

@end
