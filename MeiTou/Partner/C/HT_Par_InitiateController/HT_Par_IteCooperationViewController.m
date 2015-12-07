//
//  HT_Par_IteCooperationViewController.m
//  MeiTou
//
//  Created by che on 15/12/7.
//  Copyright © 2015年 车. All rights reserved.
//

#import "HT_Par_IteCooperationViewController.h"
#import "HT_Par_ItePaymentOrderViewController.h"

@interface HT_Par_IteCooperationViewController ()

@end

@implementation HT_Par_IteCooperationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor yellowColor];
    UIButton *btn=[[UIButton alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    btn.backgroundColor=[UIColor redColor];
    [btn addTarget:self action:@selector(clickButtonPaying) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}
-(void)clickButtonPaying{
    HT_Par_ItePaymentOrderViewController *pay=[[HT_Par_ItePaymentOrderViewController alloc]init];
    [self.navigationController pushViewController:pay animated:YES];

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
