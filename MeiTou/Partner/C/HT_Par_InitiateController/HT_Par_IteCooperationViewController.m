//
//  HT_Par_IteCooperationViewController.m
//  MeiTou
//
//  Created by che on 15/12/7.
//  Copyright © 2015年 车. All rights reserved.
//

#import "HT_Par_IteCooperationViewController.h"
#import "HT_Par_ItePaymentOrderViewController.h"

#import "HT_Par_IteCooperationCView.h"
#import "HT_Par_IteChoicePickerView.h"
@interface HT_Par_IteCooperationViewController ()

@end

@implementation HT_Par_IteCooperationViewController{
    HT_Par_IteCooperationCView *_mainView;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden=NO;
    self.navigationController.navigationBar.translucent=NO;
    [self createNavgationBarTitle];
    [self createBarButtonItem];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createMainView];
}

-(void)createNavgationBarTitle{
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 44)];
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.font = [UIFont boldSystemFontOfSize:FONT_SIZE(36)];
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.text = @"我要合作";
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
    
    NSArray *nib=[[NSBundle mainBundle]loadNibNamed:@"HT_Par_IteCooperationCView" owner:nil options:nil];
    _mainView=[nib firstObject];
    [_mainView.buttonSubmit addTarget:self action:@selector(goToPayView) forControlEvents:UIControlEventTouchUpInside];
    _mainView.frame=CGRectMake(0, 0, SCREEN_WITH, SCREEN_HEIGHT);
    UITapGestureRecognizer * tapMoney = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapTheLabelSelect)];
    [_mainView.viewSelect addGestureRecognizer:tapMoney];
    [self.view addSubview:_mainView];
    
    
    
    
}

/**
 *  tap事件
 */
-(void)tapTheLabelSelect{
    HT_Par_IteChoicePickerView *picker = [[HT_Par_IteChoicePickerView alloc]init];
    picker.block = ^(HT_Par_IteChoicePickerView *view,UIButton *btn,HT_Par_IteChociePickerNModel *locate){
        _mainView.labelSelect.text = [NSString stringWithFormat:@"%@.00",locate];
    };
    [picker show];
    
}
-(void)goToPayView{
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
