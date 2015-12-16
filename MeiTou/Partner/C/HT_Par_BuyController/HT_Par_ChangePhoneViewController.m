//
//  HT_Par_ChangePhoneViewController.m
//  MeiTou
//
//  Created by che on 15/12/14.
//  Copyright © 2015年 车. All rights reserved.
//

#import "HT_Par_ChangePhoneViewController.h"
#import "HT_Par_LoginPhoneViewController.h"

#import "HT_Par_ChangePhoneCView.h"
@interface HT_Par_ChangePhoneViewController ()

@end

@implementation HT_Par_ChangePhoneViewController{
    HT_Par_ChangePhoneCView *_mainView;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden=NO;
    self.navigationController.navigationBar.translucent=NO;
    [self createBarButtonItem];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createMainView];
}
-(void)createBarButtonItem{
    UIButton *buttonL=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 18, 18)];
    [buttonL setBackgroundImage:[UIImage imageNamed:@"common_title_top_back"] forState:UIControlStateNormal];
    [buttonL addTarget:self action:@selector(clickLightButton) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *bbiL=[[UIBarButtonItem alloc]initWithCustomView:buttonL];
    self.navigationItem.leftBarButtonItem=bbiL;
    
    
}
/**
 *
 */
-(void)clickLightButton{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)createMainView{
    
    NSArray *nib=[[NSBundle mainBundle]loadNibNamed:@"HT_Par_ChangePhoneCView" owner:nil options:nil];
    _mainView=[nib firstObject];
    [_mainView.buttonBound addTarget:self action:@selector(goToNextView) forControlEvents:UIControlEventTouchUpInside];
    _mainView.frame=CGRectMake(0, 0, SCREEN_WITH, SCREEN_HEIGHT);
    [self.view addSubview:_mainView];
    
    
    
    
}
-(void)goToNextView{
    HT_Par_LoginPhoneViewController *login=[[HT_Par_LoginPhoneViewController alloc]init];
    [self.navigationController pushViewController:login animated:YES];
    
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
