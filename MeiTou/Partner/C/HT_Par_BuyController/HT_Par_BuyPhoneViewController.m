//
//  MainViewController.m
//  qwer
//
//  Created by che on 15/12/3.
//  Copyright © 2015年 车. All rights reserved.
//

#import "HT_Par_BuyPhoneViewController.h"
#import "HT_Par_BuyPayViewController.h"
#import "HT_Par_BuyPhoneCView.h"



@interface HT_Par_BuyPhoneViewController ()

@end

@implementation HT_Par_BuyPhoneViewController{
    UIView *_mainView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createMainView];
}
-(void)createMainView{
    
        NSArray *nib=[[NSBundle mainBundle]loadNibNamed:@"HT_Par_BuyPhoneCView" owner:nil options:nil];
        HT_Par_BuyPhoneCView *mainView=[nib firstObject];
    [mainView.buttonBound addTarget:self action:@selector(goToPayView) forControlEvents:UIControlEventTouchUpInside];
        mainView.frame=CGRectMake(0, 0, SCREEN_WITH, SCREEN_HEIGHT);
        _mainView=mainView;
        [self.view addSubview:_mainView];
//    NSArray *nib=[[NSBundle mainBundle]loadNibNamed:@"HT_Par_BuyPhoneView" owner:nil options:nil];
//    UIView *mainView=[nib firstObject];
//    mainView.frame=CGRectMake(0, 0, SCREEN_WITH, SCREEN_HEIGHT);
//    [self.view addSubview:mainView];
    
    
    
    
}
-(void)goToPayView{
    HT_Par_BuyPayViewController *pay=[[HT_Par_BuyPayViewController alloc]init];
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
