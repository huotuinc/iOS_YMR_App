//
//  UserLoginTool.m
//  fanmore---
//
//  Created by lhb on 15/5/21.
//  Copyright (c) 2015年 HT. All rights reserved.
//

#import "UserLoginTool.h"
#import "AFNetworking.h"
#import "NSDictionary+HuoBanMallSign.h"
//#import <MKNetworkKit.h>


@interface UserLoginTool()

@end



@implementation UserLoginTool

+ (void)loginRequestGet:(NSString *)urlStr parame:(NSMutableDictionary *)params success:(void (^)(id json))success failure:(void (^)(NSError *error))failure{
    
    NSMutableString * url = [NSMutableString stringWithFormat:@"%@/%@",MainUrl,urlStr];
    NSMutableDictionary * paramsOption = [NSMutableDictionary dictionary];
    paramsOption[@"appSecret"] = HTYMRSCREAT;
    paramsOption[@"timestamp"] = apptimesSince1970;
    paramsOption[@"operation"] = OPERATION_parame;
    paramsOption[@"version"] =AppVersion;
    NSString * token = [[NSUserDefaults standardUserDefaults] stringForKey:AppToken];
    paramsOption[@"token"] = token?token:@"";
    paramsOption[@"imei"] = DeviceNo;
    if (params != nil) { //传入参数不为空
        [paramsOption addEntriesFromDictionary:params];
    }
    paramsOption[@"sign"] = [NSDictionary asignWithMutableDictionary:paramsOption];  //计算asign
    [paramsOption removeObjectForKey:@"appSecret"];
    AFHTTPRequestOperationManager * manager  = [AFHTTPRequestOperationManager manager];
    [manager GET:url parameters:paramsOption success:^void(AFHTTPRequestOperation * request, id json) {
        NSLog(@"%@",request);
       success(json);
    } failure:^void(AFHTTPRequestOperation * reponse, NSError * error) {
        failure(error);
        NSLog(@"%@",reponse);
    }];
}


+ (void)loginRequestPost:(NSString *)urlStr parame:(NSMutableDictionary *)params success:(void (^)(id json))success failure:(void (^)(NSError *error))failure{
    
    
    
    
    AFHTTPRequestOperationManager * manager  = [AFHTTPRequestOperationManager manager];
    [manager POST:urlStr parameters:params success:^void(AFHTTPRequestOperation * requset, id json) {
        NSLog(@"%@",requset);
        success(json);
    } failure:^void(AFHTTPRequestOperation * reponse, NSError * error) {
        
        NSLog(@"%@",reponse);
        failure(error);
    }];
}



@end
