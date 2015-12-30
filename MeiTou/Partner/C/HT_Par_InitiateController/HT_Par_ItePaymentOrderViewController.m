//
//  HT_Par_ItePaymentViewController.m
//  MeiTou
//
//  Created by che on 15/12/7.
//  Copyright © 2015年 车. All rights reserved.
//

#import "HT_Par_ItePaymentOrderViewController.h"
#import "HT_Par_ItePaymentResultsViewController.h"
#import "HT_Par_ItePaymentOrderCView.h"
@interface HT_Par_ItePaymentOrderViewController ()

@end

@implementation HT_Par_ItePaymentOrderViewController{
    HT_Par_ItePaymentOrderCView * _mainView;//主视图
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden=NO;
    self.navigationController.navigationBar.translucent=NO;
    [self createBarButtonItem];
    [self createNavgationBarTitle];
    
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createMainView];
    
}
-(void)createNavgationBarTitle{
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 44)];
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.font = [UIFont boldSystemFontOfSize:FONT_SIZE(32)];
    titleLabel.textColor = [UIColor blackColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.text = @"积分充值";
    self.navigationItem.titleView = titleLabel;
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
    
    NSArray *nib=[[NSBundle mainBundle]loadNibNamed:@"HT_Par_ItePaymentOrderCView" owner:nil options:nil];
    _mainView=[nib firstObject];
    [_mainView.buttonBuy addTarget:self action:@selector(goToResultView) forControlEvents:UIControlEventTouchUpInside];
    
    UITapGestureRecognizer * tapViewPay = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapTheViewPay)];
    [_mainView.viewPay addGestureRecognizer:tapViewPay];
    UITapGestureRecognizer * tapViewWei = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapTheViewWei)];
    [_mainView.viewWei addGestureRecognizer:tapViewWei];

    _mainView.buttonPay.selected=YES;
    _mainView.backgroundColor=COLOR_BACK_MAIN;
    _mainView.frame=CGRectMake(0, 0, SCREEN_WITH, SCREEN_HEIGHT);
    //    _mainView=mainView;
    [self.view addSubview:_mainView];
    
    
    
    
}
/**
 *  点击 tap事件
 */

-(void)goToResultView{
    HT_Par_ItePaymentResultsViewController *result=[[HT_Par_ItePaymentResultsViewController alloc]init];
    [self.navigationController pushViewController:result animated:YES];
    
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



-(void)clickButtonPaying{
    HT_Par_ItePaymentResultsViewController *result=[[HT_Par_ItePaymentResultsViewController alloc]init];
    [self.navigationController pushViewController:result animated:YES];
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
