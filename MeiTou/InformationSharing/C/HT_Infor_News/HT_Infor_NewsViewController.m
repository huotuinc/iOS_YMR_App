//
//  HT_Infor_NewsViewController.m
//  MeiTou
//
//  Created by che on 15/12/7.
//  Copyright © 2015年 车. All rights reserved.
//

#import "HT_Infor_NewsViewController.h"
#import "HT_Infor_ShareViewController.h"

#import "HT_Infor_NewsHeadCView.h"
#import "HT_Infor_BottomCView.h"
#import "HT_Par_BuyMainTableViewCell.h"

static NSString *cellIBuy=@"cellIBuy";
@interface HT_Infor_NewsViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation HT_Infor_NewsViewController{
    UITableView *_tableView;
    UIView *_headerView;//_tableV 的headerV
    UIView *_bottomView;//底部视图
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden=NO;
    self.navigationController.navigationBar.translucent = NO;
    

    [self createBarButtonItem];
    
    
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor whiteColor];

    [self createHeadView];
    [self createTableView];
    [self createBottomView];
    
    //    NSLog(@"*****************************");
    //    NSLog(@"%f",SCREEN_HEIGHT/1100*1000);
    
    
    
    
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

-(void)createHeadView{
    NSArray *nib=[[NSBundle mainBundle]loadNibNamed:@"HT_Infor_NewsHeadCView" owner:nil options:nil];
    HT_Infor_NewsHeadCView *headerView=[nib firstObject];
    headerView.frame=CGRectMake(0, 0, SCREEN_WITH, SCREEN_HEIGHT/1150*170);
    _headerView=headerView;
}

-(void)createBottomView{
    NSArray *nib=[[NSBundle mainBundle]loadNibNamed:@"HT_Infor_BottomCView" owner:nil options:nil];
    HT_Infor_BottomCView *bottomView=[nib firstObject];
    bottomView.frame=CGRectMake(0, SCREEN_HEIGHT/1150*(1150-90)-64, SCREEN_WITH, SCREEN_HEIGHT/1150*90);
    [bottomView.buttonGo addTarget:self action:@selector(clickButtonGo) forControlEvents:UIControlEventTouchUpInside];
    _bottomView=bottomView;
    [self.view addSubview:_bottomView];
    
}
-(void)createTableView{
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WITH , SCREEN_HEIGHT/1150*(1150-90)-64) style:UITableViewStyleGrouped];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    _tableView.tableHeaderView=_headerView;
    [_tableView registerNib:[UINib nibWithNibName:@"HT_Par_BuyMainTableViewCell" bundle:nil] forCellReuseIdentifier:cellIBuy];
    [self.view addSubview:_tableView];
}
-(void)clickButtonGo{
    HT_Infor_ShareViewController *share=[[HT_Infor_ShareViewController alloc]init];
    [self.navigationController pushViewController:share animated:YES];
}

#pragma mark UITableViewDelegate
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    HT_Par_BuyMainTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIBuy forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
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
