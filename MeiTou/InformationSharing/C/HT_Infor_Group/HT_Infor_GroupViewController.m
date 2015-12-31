//
//  HT_Infor_GroupViewController.m
//  MeiTou
//
//  Created by che on 15/12/7.
//  Copyright © 2015年 车. All rights reserved.
//

#import "HT_Infor_GroupViewController.h"
#import "HT_Infor_GroupWebViewController.h"
#import "HT_Par_BuyViewController.h"

#import "HT_Infor_HeadCView.h"
#import "HT_Infor_GroupTableViewCell.h"
#import "HT_Infor_BottomCView.h"
#import <BlocksKit+UIKit.h>

static NSString *cellGMain = @"cellGMain";

@interface HT_Infor_GroupViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation HT_Infor_GroupViewController{
    UITableView *_tableView;
    HT_Infor_HeadCView *_headerView;//tbV的headerView
    UIView *_bottomView;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden=NO;
    self.navigationController.navigationBar.translucent=NO;
    [_tableView registerNib:[UINib nibWithNibName:@"HT_Infor_GroupTableViewCell" bundle:nil]forCellReuseIdentifier:cellGMain];
    [self createBarButtonItem];
    
    

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createHeaderView];
    [self createTableView];
    [self createBottomView];
}

-(void)createBarButtonItem{
    UIButton *buttonL=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 18, 18)];
    [buttonL setBackgroundImage:[UIImage imageNamed:@"common_title_top_back"] forState:UIControlStateNormal];
    [buttonL addTarget:self action:@selector(clickLightButton) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *bbiL=[[UIBarButtonItem alloc]initWithCustomView:buttonL];
    self.navigationItem.leftBarButtonItem=bbiL;
    
    UIButton *buttonR=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 18, 18)];
    [buttonR setBackgroundImage:[UIImage imageNamed:@"common_title_top_more"]forState:UIControlStateNormal];
    [buttonR addTarget:self action:@selector(clickRightButton) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *bbiR=[[UIBarButtonItem alloc]initWithCustomView:buttonR];
    self.navigationItem.rightBarButtonItem=bbiR;
}
/**
 *
 */
-(void)clickLightButton{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)clickRightButton{
    
}
-(void)createHeaderView{

    
    NSArray *nib=[[NSBundle mainBundle]loadNibNamed:@"HT_Infor_HeadCView" owner:nil options:nil];
    _headerView=[nib firstObject];
    _headerView.frame=CGRectMake(0, 0, SCREEN_WITH, SCREEN_HEIGHT/1150*380);
}

-(void)createTableView{
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WITH , SCREEN_HEIGHT/1150*(1150-90)) style:UITableViewStylePlain];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    _tableView.tableHeaderView=_headerView;
    [self.view addSubview:_tableView];
   
}

-(void)createBottomView{
    NSArray *nib=[[NSBundle mainBundle]loadNibNamed:@"HT_Infor_BottomCView" owner:nil options:nil];
    HT_Infor_BottomCView *bottomView=[nib firstObject];
    bottomView.frame=CGRectMake(0, SCREEN_HEIGHT/1150*(1150-90)-64, SCREEN_WITH, SCREEN_HEIGHT/1150*90);
    [bottomView.buttonGo addTarget:self action:@selector(clickButtonGo) forControlEvents:UIControlEventTouchUpInside];
    [bottomView.buttonGo setTitle:@"去拼团" forState:UIControlStateNormal];

    _bottomView=bottomView;
    [self.view addSubview:_bottomView];

}
-(void)clickButtonGo{
//    HT_Par_BuyViewController *web=[[HT_Par_BuyViewController alloc]init];
//    [self.navigationController pushViewController:web animated:YES];
//    NSLog(@"111");
}
#pragma mark UITableViewDelegate
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *_cell;
    HT_Infor_GroupTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellGMain forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    _cell=cell;
    
    return _cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return SCREEN_HEIGHT ;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
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
