//
//  HT_Par_IteOrderViewController.m
//  MeiTou
//
//  Created by che on 15/12/7.
//  Copyright © 2015年 车. All rights reserved.
//

#import "HT_Par_IteOrderViewController.h"

#import "HT_Par_IteOrderCView.h"

@interface HT_Par_IteOrderViewController ()

@end

@implementation HT_Par_IteOrderViewController{
    UIView *_mainView;
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
    
    NSArray *nib=[[NSBundle mainBundle]loadNibNamed:@"HT_Par_IteOrderCView" owner:nil options:nil];
    HT_Par_IteOrderCView *mainView=[nib firstObject];
    [mainView.buttonSubmit addTarget:self action:@selector(clickButtonSubmit) forControlEvents:UIControlEventTouchUpInside];
    mainView.frame=CGRectMake(0, 0, SCREEN_WITH, SCREEN_HEIGHT);
    _mainView=mainView;
    [self.view addSubview:_mainView];
    
    
    
    
}
-(void)clickButtonSubmit{
    NSLog(@"点击了按钮");

    
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
