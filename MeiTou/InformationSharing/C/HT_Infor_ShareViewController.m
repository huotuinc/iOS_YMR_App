//
//  HT_Infor_ShareViewController.m
//  MeiTou
//
//  Created by che on 15/12/10.
//  Copyright © 2015年 车. All rights reserved.
//

#import "HT_Infor_ShareViewController.h"

#import "HT_Infor_ShareCView.h"

@interface HT_Infor_ShareViewController ()

@end

@implementation HT_Infor_ShareViewController{
    HT_Infor_ShareCView *_mainView;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden=NO;
    self.navigationController.navigationBar.translucent=NO;
    self.view.backgroundColor=[UIColor whiteColor];
    [self createBarButtonItem];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createMainView];
}
-(void)createBarButtonItem{
    UIButton *buttonL=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WITH/640*110 , 30)];
    [buttonL setBackgroundColor:COLOR_NAVBAR_A];
    [buttonL setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
     [buttonL setTitle:@"取消" forState:UIControlStateNormal];
    [buttonL addTarget:self action:@selector(clickLightButton) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *bbiL=[[UIBarButtonItem alloc]initWithCustomView:buttonL];
    self.navigationItem.leftBarButtonItem=bbiL;
//    
    UIButton *buttonR=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WITH/640*110 , 30)];
    [buttonR setBackgroundColor:COLOR_BUTTON_RED];
    [buttonR setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];

    [buttonR setTitle:@"发表" forState:UIControlStateNormal];
    [buttonR addTarget:self action:@selector(clickRightButton) forControlEvents:UIControlEventTouchUpInside];
    buttonR.layer.cornerRadius=3;
    buttonR.layer.masksToBounds=YES;
    UIBarButtonItem *bbiR=[[UIBarButtonItem alloc]initWithCustomView:buttonR];
    self.navigationItem.rightBarButtonItem=bbiR;
}
/**
 *
 */
-(void)clickLightButton{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)clickRightButton{
}

-(void)createMainView{
    
    NSArray *nib=[[NSBundle mainBundle]loadNibNamed:@"HT_Infor_ShareCView" owner:nil options:nil];
    _mainView=[nib firstObject];
    _mainView.frame=CGRectMake(0, 0, SCREEN_WITH, SCREEN_HEIGHT-64);
    [self.view addSubview:_mainView];
    
    
    
    
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
