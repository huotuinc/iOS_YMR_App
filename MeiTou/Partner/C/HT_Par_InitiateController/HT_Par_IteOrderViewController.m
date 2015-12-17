//
//  HT_Par_IteOrderViewController.m
//  MeiTou
//
//  Created by che on 15/12/7.
//  Copyright © 2015年 车. All rights reserved.
//

#import "HT_Par_IteOrderViewController.h"

#import "HT_Par_IteOrderCView.h"
#import "HT_Par_IteChoicePickerView.h"
@interface HT_Par_IteOrderViewController ()

@end

@implementation HT_Par_IteOrderViewController{
    HT_Par_IteOrderCView *_mainView;
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
    
    NSArray *nib=[[NSBundle mainBundle]loadNibNamed:@"HT_Par_IteOrderCView" owner:nil options:nil];
    _mainView=[nib firstObject];
    [_mainView.buttonSubmit addTarget:self action:@selector(clickButtonSubmit) forControlEvents:UIControlEventTouchUpInside];
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
        _mainView.labelState.text=[NSString stringWithFormat:@"我有%@万,我要找人合作众筹",locate];
    };
    [picker show];
    
}
-(void)clickButtonSubmit{
    NSLog(@"点击了按钮");

    
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
