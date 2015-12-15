//
//  MainViewController.m
//  qwer
//
//  Created by che on 15/12/3.
//  Copyright © 2015年 车. All rights reserved.
//

#import "HT_Par_BoundPhoneViewController.h"
#import "HT_Par_ChangePhoneViewController.h"

#import "HT_HomePage_BoundPhoneCView.h"



@interface HT_Par_BoundPhoneViewController ()

@end

@implementation HT_Par_BoundPhoneViewController{
    HT_HomePage_BoundPhoneCView *_mainView;
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
    
        NSArray *nib=[[NSBundle mainBundle]loadNibNamed:@"HT_HomePage_BoundPhoneCView" owner:nil options:nil];
        _mainView=[nib firstObject];
    [_mainView.buttonBound addTarget:self action:@selector(goToNextView) forControlEvents:UIControlEventTouchUpInside];
        _mainView.frame=CGRectMake(0, 0, SCREEN_WITH, SCREEN_HEIGHT);
        [self.view addSubview:_mainView];

    
    
    
}
-(void)goToNextView{
    HT_Par_ChangePhoneViewController *change=[[HT_Par_ChangePhoneViewController alloc]init];
    [self.navigationController pushViewController:change animated:YES];

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