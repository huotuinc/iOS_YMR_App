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
#import "LoginViewController.h"
//
//#import "MJExtension.h"
//#import "UserModel.h"



@interface AppDelegate ()


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
//    
//    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
//    self.window.backgroundColor = [UIColor whiteColor];
//    UIStoryboard *story = [UIStoryboard storyboardWithName:@"Mian" bundle:nil];
//    LoginViewController *login = [story instantiateViewControllerWithIdentifier:@"LoginViewController"];
//    self.window.rootViewController = login;
    
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    RootViewController *root=[[RootViewController alloc]init];
    self.window.rootViewController=root;
    
    _maskLayer = [CALayer layer];
    [_maskLayer setFrame:CGRectMake(SCREEN_WITH, 0, 0, SCREEN_HEIGHT)];
    [_maskLayer setBackgroundColor:[UIColor colorWithWhite:0.000 alpha:0.400].CGColor];
    [_window.layer addSublayer:_maskLayer];
    self.maskLayer.hidden = YES;

    return YES;
}

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
