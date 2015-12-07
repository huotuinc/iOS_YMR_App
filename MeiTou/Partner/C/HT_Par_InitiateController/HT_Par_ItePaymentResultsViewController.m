//
//  HT_Par_ItePaymentResultsViewController.m
//  MeiTou
//
//  Created by che on 15/12/7.
//  Copyright © 2015年 车. All rights reserved.
//

#import "HT_Par_ItePaymentResultsViewController.h"

#import "HT_Par_ItePaymentResultsCView.h"

@interface HT_Par_ItePaymentResultsViewController ()

@end

@implementation HT_Par_ItePaymentResultsViewController{
    UIView *_mainView;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createMainView];
}
-(void)createMainView{
    NSArray  *nib= [[NSBundle mainBundle]loadNibNamed:@"HT_Par_ItePaymentResultsCView" owner:nil options:nil];
    HT_Par_ItePaymentResultsCView *mainView=[nib firstObject];
    mainView.frame=CGRectMake(0, 0, SCREEN_WITH, SCREEN_HEIGHT);
    _mainView=mainView;
    [self.view addSubview:_mainView];
    
    
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