//
//  HT_HomePage_TopUpViewController.m
//  MeiTou
//
//  Created by che on 15/12/14.
//  Copyright © 2015年 车. All rights reserved.
//

#import "HT_HomePage_TopUpViewController.h"
#import "HT_HomePage_PointsViewController.h"

#import "HT_HomePage_TopUpCView.h"

@interface HT_HomePage_TopUpViewController ()

@end

@implementation HT_HomePage_TopUpViewController{
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
    
    NSArray *nib=[[NSBundle mainBundle]loadNibNamed:@"HT_HomePage_TopUpCView" owner:nil options:nil];
    HT_HomePage_TopUpCView *mainView=[nib firstObject];
    [mainView.buttonBuy addTarget:self action:@selector(goToPayView) forControlEvents:UIControlEventTouchUpInside];

    
    UITapGestureRecognizer * tapViewPay = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapTheViewPay)];
    [mainView.viewPay addGestureRecognizer:tapViewPay];
    UITapGestureRecognizer * tapViewWei = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapTheViewWei)];
    [mainView.viewWei addGestureRecognizer:tapViewWei];
    UITapGestureRecognizer *tapViewUp=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapTheViewUp)];
    [mainView.viewUp addGestureRecognizer:tapViewUp];
    UITapGestureRecognizer *tapViewMore=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapTheViewMore)];
    [mainView.viewMore addGestureRecognizer:tapViewMore];

    mainView.viewLevelUp.hidden=YES;
    mainView.buttonPay.selected=YES;
    mainView.frame=CGRectMake(0, 0, SCREEN_WITH, SCREEN_HEIGHT);
    _mainView=mainView;
    [self.view addSubview:_mainView];
    
    
    
    
}
/**
 *  点击 tap事件
 */

-(void)goToPayView{
    HT_HomePage_PointsViewController *point=[[HT_HomePage_PointsViewController alloc]init];
    [self.navigationController pushViewController:point animated:YES];
    
}

-(void)tapTheViewPay{
    for (int i=0; i<2; i++) {
        UIButton *btn=(UIButton *)[self.view viewWithTag:100+i];
        btn.selected=NO;
        if (btn.tag==100) {
            btn.selected=YES;
        }
    }

}
-(void)tapTheViewWei{
    for (int i=0; i<2; i++) {
        UIButton *btn=(UIButton *)[self.view viewWithTag:100+i];
        btn.selected=NO;
        if (btn.tag==101) {
            btn.selected=YES;
        }
    }

}
-(void)tapTheViewUp{
    for (int i=0; i<2; i++) {
        UIView *view=(UIView *)[self.view viewWithTag:200+i];
        view.hidden=YES;
        if (view.tag==200) {
            view.hidden=NO;
        }
    }

}
-(void)tapTheViewMore{
    for (int i=0; i<2; i++) {
        UIView *view=(UIView *)[self.view viewWithTag:200+i];
        view.hidden=YES;
        if (view.tag==201) {
            view.hidden=NO;
        }
    }

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
