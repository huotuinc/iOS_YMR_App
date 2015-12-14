//
//  HT_HomePage_PointsViewController.m
//  MeiTou
//
//  Created by che on 15/12/9.
//  Copyright © 2015年 车. All rights reserved.
//

#import "HT_HomePage_PointsViewController.h"
#import "HT_HomePage_LevelUpViewController.h"

#import "HT_HomePage_PointsCView.h"

@interface HT_HomePage_PointsViewController ()

@end

@implementation HT_HomePage_PointsViewController{
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
    
    NSArray *nib=[[NSBundle mainBundle]loadNibNamed:@"HT_HomePage_PointsCView" owner:nil options:nil];
    HT_HomePage_PointsCView *mainView=[nib firstObject];
    mainView.frame=CGRectMake(0, 0, SCREEN_WITH, SCREEN_HEIGHT);
    [mainView.buttonTreasury addTarget:self action:@selector(clickButtonTreasury) forControlEvents:UIControlEventTouchUpInside];
    _mainView=mainView;
    [self.view addSubview:_mainView];
    
    
    
    
}

-(void)clickButtonTreasury{
    HT_HomePage_LevelUpViewController *level=[[HT_HomePage_LevelUpViewController alloc]init];
    [self.navigationController pushViewController:level animated:YES];
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
