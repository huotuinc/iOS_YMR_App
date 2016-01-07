//
//  AppDelegate.m
//  MeiTou
//
//  Created by che on 15/11/27.
//  Copyright © 2015年 车. All rights reserved.
//

#import "AppDelegate.h"
#import "RootViewController.h"
#import "Measure.h"
#import "WXApi.h"
#import "WXApiObject.h"
#import "LoginViewController.h"
//
//#import "MJExtension.h"
#import "UserModel.h"



@interface AppDelegate ()<WXApiDelegate>


//@property(nonatomic,strong) NSArray * users;


@end

@implementation AppDelegate




//- (void)xxx:(NSIndexPath *)index{
//    
//    UserModel *us = self.users[index.row]
//
//    
//    
//}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
//    NSMutableDictionary * dict = [NSMutableDictionary dictionary];
//    dict[@"name"] = @"123";
//    dict[@"passwd"] = @"122";
//    
//    [UserLoginTool loginRequestGet:@"init" parame:dict success:^(NSDictionary* json) {//
//        NSLog(@"init----%@",json);
//        
//        NSArray * users = [UserModel objectArrayWithKeyValuesArray:json[@"Userlist"]];
//        self.users = users;
//        
//    } failure:^(NSError *error) {//
//        NSLog(@"%@",error);
//    }];
////
    NSString * login = [[NSUserDefaults standardUserDefaults] objectForKey:LoginStatus];
    if ([login isEqualToString:Success]) {
        self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
        self.window.backgroundColor = [UIColor whiteColor];
        RootViewController *root=[[RootViewController alloc]init];
        self.window.rootViewController=root;

    }else {
        self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
        self.window.backgroundColor = [UIColor whiteColor];
        UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        LoginViewController *login = [story instantiateViewControllerWithIdentifier:@"LoginViewController"];
        self.window.rootViewController = login;
    }

    _maskLayer = [CALayer layer];
    [_maskLayer setFrame:CGRectMake(SCREEN_WITH, 0, 0, SCREEN_HEIGHT)];
    [_maskLayer setBackgroundColor:[UIColor colorWithWhite:0.000 alpha:0.400].CGColor];
    [_window.layer addSublayer:_maskLayer];
    self.maskLayer.hidden = YES;

    [WXApi registerApp:HuoBanMallBuyWeiXinAppId withDescription:@"行装"];
    
    return YES;
}



-(void) onResp:(BaseResp*)resp
{
    /*ErrCode ERR_OK = 0(用户同意)
     ERR_AUTH_DENIED = -4（用户拒绝授权）
     ERR_USER_CANCEL = -2（用户取消）
     code    用户换取access_token的code，仅在ErrCode为0时有效                         state   第三方程序发送时用来标识其请求的唯一性的标志，由第三方程序调用sendReq时传入，由微信终端回传，state字符串长度不能超过1K
     lang    微信客户端当前语言
     country 微信用户当前国家信息
     */
    if ([resp isKindOfClass:[SendAuthResp class]]) {
        SendAuthResp *aresp = (SendAuthResp *)resp;
        if (aresp.errCode== 0) {
            NSString *code = aresp.code;
            //            NSLog(@"----%@",code);
            //授权成功的code
            NSDictionary * dict = @{@"code":code};
            NSString * login = [[NSUserDefaults standardUserDefaults] objectForKey:LoginStatus];
            if ([login isEqualToString:Success]) {
                [[NSNotificationCenter defaultCenter] postNotificationName:@"ToGetUserInfoBuild" object:nil userInfo:dict];
                
            }else {
                [[NSNotificationCenter defaultCenter] postNotificationName:@"ToGetUserInfo" object:nil userInfo:dict];
            }
            return;
        }else if (aresp.errCode== -4 || aresp.errCode== -2 ){
            
            [[NSNotificationCenter defaultCenter] postNotificationName:@"ToGetUserInfoError" object:nil userInfo:nil];
        }
    }
    NSString *strMsg = [NSString stringWithFormat:@"errcode:%d", resp.errCode];
    NSString *strTitle = nil;
    if([resp isKindOfClass:[SendMessageToWXResp class]])
    {
        strTitle = [NSString stringWithFormat:@"发送媒体消息结果"];
        return;
    }
    if([resp isKindOfClass:[PayResp class]]){
        //支付返回结果，实际支付结果需要去微信服务器端查询
        strTitle = [NSString stringWithFormat:@"支付结果"];
        switch (resp.errCode) {
            case WXSuccess:
                strMsg = @"支付结果：成功！";
                //                NSLog(@"支付成功－PaySuccess，retcode = %d", resp.errCode);
                break;
                
            default:
                strMsg = [NSString stringWithFormat:@"支付结果：失败"];
                //                strMsg = [NSString stringWithFormat:@"支付结果：失败！retcode = %d, retstr = %@", resp.errCode,resp.errStr];
                //                NSLog(@"错误，retcode = %d, retstr = %@", resp.errCode,resp.errStr);
                break;
        }
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:strTitle message:strMsg delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alert show];
    }
}


/*************************************************************************************/
- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
    
    return [WXApi handleOpenURL:url delegate:self];
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    
    NSString *string =[url absoluteString];
    //    NSLog(@"%@",string);
    
    return [WXApi handleOpenURL:url delegate:self];
}

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<NSString*, id> *)options{
    
    NSString *string =[url absoluteString];
    //    NSLog(@"%@",string);
    
    return [WXApi handleOpenURL:url delegate:self];
    
}
/*************************************************************************************/


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
