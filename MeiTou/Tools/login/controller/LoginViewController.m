//
//  LoginViewController.m
//  MeiTou
//
//  Created by 刘琛 on 15/12/24.
//  Copyright © 2015年 车. All rights reserved.
//

#import "LoginViewController.h"
#import "UserInfo.h"
#import "AQuthModel.h"
#import "WXApi.h"
#import "WXApiObject.h"
#import "AccountTool.h"
#import "AppDelegate.h"
#import "RootViewController.h"

@interface LoginViewController ()<WXApiDelegate>

- (IBAction)loginBtnClick:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UIImageView *image;
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.image.contentMode = UIViewContentModeScaleAspectFit;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(OquthByWeiXinSuccess:) name:@"ToGetUserInfo" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(WeiXinFailureToUserOrigin1) name:@"ToGetUserInfoError" object:nil];
    
//    [UIViewController MonitorNetWork];
    
    
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    
    
}


- (void)OquthByWeiXinSuccess:(NSNotification *) note{

    LWLog(@"-=------------%@",note);
    AQuthModel * account = [AccountTool account];
    if (account.refresh_token.length) {
        [self toRefreshaccess_token];
    }else{
        [self accessTokenWithCode:note.userInfo[@"code"]];
    }

    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"ToGetUserInfo" object:nil];
}


- (IBAction)loginBtnClick:(id)sender {
    if ([AccountTool verifyAccess_Token_Effect]) {
        [self toRefreshaccess_token]; //刷新access_token
    }else{
        if ([WXApi isWXAppInstalled]) {
            [self WeiXinLog];
        }else {
//            [SVProgressHUD showErrorWithStatus:@"你没有安装微信，请使用手机登录"];
            [self WeiXinFailureToUserOrigin1];
        }
    }
}


/**
 *  刷新access_token
 */
- (void)toRefreshaccess_token{
    
    
    __weak LoginViewController * wself = self;
    AQuthModel * mode = [AccountTool account];
    NSString * ss = [NSString stringWithFormat:@"https://api.weixin.qq.com/sns/oauth2/refresh_token?appid=%@&grant_type=refresh_token&refresh_token=%@",HuoBanMallBuyWeiXinAppId,mode.refresh_token];
    [UserLoginTool loginWeiXinRequestGet:ss parame:nil success:^(id json) {
        AQuthModel * aquth = [AQuthModel objectWithKeyValues:json];
        [AccountTool saveAccount:aquth];
        //获取用户信息
        [wself getUserInfo:aquth];
    } failure:^(NSError *error) {
        //        NSLog(@"%@",error.description);
    }];
}


/**
 *  微信授权登录
 */
- (void)WeiXinLog{
    
    //构造SendAuthReq结构体
    SendAuthReq* req =[[SendAuthReq alloc ] init];
    req.scope = @"snsapi_userinfo" ;
    req.state = @"123" ;
    //第三方向微信终端发送一个SendAuthReq消息结构
    [WXApi sendAuthReq:req viewController:self delegate:self];
}

- (void)accessTokenWithCode:(NSString * )code
{
    
    
    __weak LoginViewController * wself = self;
    //进行授权
    NSString *url =[NSString stringWithFormat:@"https://api.weixin.qq.com/sns/oauth2/access_token?appid=%@&secret=%@&code=%@&grant_type=authorization_code",HuoBanMallBuyWeiXinAppId,HuoBanMallShareSdkWeiXinSecret,code];
    [UserLoginTool loginWeiXinRequestGet:url parame:nil success:^(id json) {
        
        //        NSLog(@"accessTokenWithCode%@",json);
        AQuthModel * aquth = [AQuthModel objectWithKeyValues:json];
        [AccountTool saveAccount:aquth];
        //获取用户信息
        [wself getUserInfo:aquth];
    } failure:^(NSError *error) {
                NSLog(@"%@",error.description);
    }];
}

/**
 *  微信授权登录后返回的用户信息
 */
-(void)getUserInfo:(AQuthModel*)aquth
{
    __weak LoginViewController * wself = self;
    NSMutableDictionary * parame = [NSMutableDictionary dictionary];
    parame[@"access_token"] = aquth.access_token;
    parame[@"openid"] = aquth.openid;
    [UserLoginTool loginWeiXinRequestGet:@"https://api.weixin.qq.com/sns/userinfo" parame:parame success:^(id json) {
        UserInfo * userInfo = [UserInfo objectWithKeyValues:json];
        //向服务端提供微信数据
        [wself toPostWeiXinUserMessage:userInfo];
        //获取主地址
//        [wself toGetMainUrl];
        //微信授权成功后获取支付参数
//        [wself WeiXinLoginSuccessToGetPayParameter];
        //获得用户账户列表
//        [wself GetUserList:userInfo.unionid];
        
    } failure:^(NSError *error) {
        //        NSLog(@"%@",error.description);
    }];
    
}


- (void)toPostWeiXinUserMessage:(UserInfo *) user{
    
    __weak LoginViewController * wself = self;
    NSMutableDictionary * parame = [NSMutableDictionary dictionary];
    parame[@"sex"] = [NSString stringWithFormat:@"%ld",(long)[user.sex integerValue]];
    parame[@"nickname"] = user.nickname;
    parame[@"openid"] = user.openid;
    parame[@"city"] = user.city;
    parame[@"country"] = user.country;
    parame[@"province"] = user.province;
    parame[@"headimgurl"] = user.headimgurl;
    parame[@"unionid"] = user.unionid;
 
    [UserLoginTool loginRequestPostWithFile:@"login" parame:parame success:^(id json) {
        LWLog(@"%@",json);
        if ([json[@"systemResultCode"] intValue] == 1 && [json[@"resultCode"] intValue] == 1) {
            UserInfo *tempUser = [UserInfo objectWithKeyValues:json[@"resultData"][@"data"]];
            tempUser.city = user.city;
            tempUser.country = user.country;
            tempUser.headimgurl = user.headimgurl;
            tempUser.language = user.language;
            tempUser.openid = user.openid;
            tempUser.privilege = user.privilege;
            tempUser.province = user.province;
            tempUser.unionid = user.unionid;

            /**
             *  <#Description#>
             *
             *  @param NSDocumentDirectory <#NSDocumentDirectory description#>
             *  @param NSUserDomainMask    <#NSUserDomainMask description#>
             *  @param YES                 <#YES description#>
             *
             *  @return <#return value description#>
             */
            NSString * path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
            NSString *fileName = [path stringByAppendingPathComponent:WeiXinUserInfo];
            [NSKeyedArchiver archiveRootObject:tempUser toFile:fileName];
            
//            UserInfo *user = [NSKeyedUnarchiver unarchiveObjectWithFile:fileName];
            
            
            [self UserLoginSuccess];
        }
    } failure:^(NSError *error) {
        LWLog(@"%@",error);
    }withFileKey:nil];
    
}


/**
 *  用户登录成功
 *
 *  @param note <#note description#>
 */
- (void)UserLoginSuccess{
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [[NSUserDefaults standardUserDefaults] setObject:Success forKey:LoginStatus];
    
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        //        [MBProgressHUD hideHUD];
        
//        AppDelegate * de = (AppDelegate *)[[UIApplication sharedApplication] delegate];
//        de.SwitchAccount = @"first";
        RootViewController * root = [[RootViewController alloc] init];
        [UIApplication sharedApplication].keyWindow.rootViewController = root;
    });
}



- (void)WeiXinFailureToUserOrigin1{
    
//    IponeVerifyViewController * iphone = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"IponeVerifyViewController"];
//    UINavigationController *nav =[[UINavigationController alloc] initWithRootViewController:iphone];
//    [self presentViewController:nav animated:YES completion:nil];
    
    //    NSLog(@"xxxx没有危险客户端");
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
