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
    UIView * _mainView;//主视图
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createMainView];
    
}
-(void)createMainView{
    NSArray  *nib= [[NSBundle mainBundle]loadNibNamed:@"HT_Par_ItePaymentOrderCView" owner:nil options:nil];
    HT_Par_ItePaymentOrderCView *mainView=[nib firstObject];
    mainView.frame=CGRectMake(0, 0, SCREEN_WITH, SCREEN_HEIGHT);
    [mainView.buttonPaying addTarget:self action:@selector(clickButtonPaying) forControlEvents:UIControlEventTouchUpInside];
    _mainView=mainView;
    [self.view addSubview:_mainView];
    

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
