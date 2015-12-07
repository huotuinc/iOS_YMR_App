//
//  HT_Par_SubViewController.m
//  MeiTou
//
//  Created by che on 15/12/7.
//  Copyright © 2015年 车. All rights reserved.
//

#import "HT_Par_SubViewController.h"
#import "HT_Par_SubListViewController.h"
#import "HT_Par_SubClaimViewController.h"

#import "HT_Par_MainTopView.h"
#import "HT_Par_SubProjectDoingHeaderCView.h"
#import "HT_Par_SubProjectDoneHeaderCView.h"
#import "HT_Par_SubBottomView.h"
#import "HT_Par_BuyMainTableViewCell.h"

static NSString *cellSub = @"cellSub";

@interface HT_Par_SubViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation HT_Par_SubViewController{
    UITableView *_tableView;
    UIView *_topView;//顶部视图
    UIView *_headerView;//_tableV 的headerV
    UIView *_bottomView;//底部视图
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden=NO;
    self.navigationController.navigationBar.translucent = NO;
    [_tableView registerNib:[UINib nibWithNibName:@"HT_Par_BuyMainTableViewCell" bundle:nil]forCellReuseIdentifier:cellSub];
 
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createTopView];
    [self createHeadView];
    [self createTableView];
    [self createBottomView];
}

-(void)createTopView{
    
    NSArray  *nib= [[NSBundle mainBundle]loadNibNamed:@"HT_Par_MainTopView" owner:nil options:nil];
    HT_Par_MainTopView *topView=[nib firstObject];
    topView.frame=CGRectMake(0, 0, SCREEN_WITH , SCREEN_HEIGHT/1100*80);
    
    UITapGestureRecognizer * tapPerson = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapThePersonView)];
    [topView.ViewPerson addGestureRecognizer:tapPerson];
    _topView=topView;
    [self.view addSubview:_topView];
    
}
-(void)createHeadView{
    NSArray *nib=[[NSBundle mainBundle]loadNibNamed:@"HT_Par_SubProjectDoneHeaderCView" owner:nil options:nil];
    HT_Par_SubProjectDoneHeaderCView *headerView=[nib firstObject];
    headerView.frame=CGRectMake(0, 0, SCREEN_WITH,SCREEN_HEIGHT/1100*222/190*270);
    _headerView=headerView;
}

-(void)createBottomView{
    //    SCREEN_HEIGHT-(SCREEN_HEIGHT/1100*100)
    NSArray *nib=[[NSBundle mainBundle]loadNibNamed:@"HT_Par_SubBottomView" owner:nil options:nil];
    HT_Par_SubBottomView *bottomView=[nib firstObject];
    bottomView.frame=CGRectMake(0,SCREEN_HEIGHT-(SCREEN_HEIGHT/1100*100)-64, SCREEN_WITH, SCREEN_HEIGHT/1100*100);
    [bottomView.buttonSubscription addTarget:self action:@selector(clickButtonSubscription) forControlEvents:UIControlEventTouchUpInside];
    
    _bottomView=bottomView;
    //    [self.view insertSubview:_bottomView aboveSubview:_tableView];
    
    [self.view addSubview:_bottomView];
    
    
    //    NSLog(@"%f",SCREEN_HEIGHT);
    //    NSLog(@"%f",SCREEN_HEIGHT-(SCREEN_HEIGHT/1100*100));
    //    NSLog(@"%f",SCREEN_HEIGHT/1100*100);
    
}
-(void)createTableView{
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, _topView.frame.origin.y+_topView.frame.size.height, SCREEN_WITH , SCREEN_HEIGHT/1100*(615+222)) style:UITableViewStylePlain];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    _tableView.tableHeaderView=_headerView;
    _tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableView];
}
/**
 *  tap事件
 */

-(void)tapThePersonView{
    HT_Par_SubListViewController *list=[[HT_Par_SubListViewController alloc]init];
    [self.navigationController pushViewController:list animated:YES];
}
-(void)clickButtonSubscription{
    HT_Par_SubClaimViewController *claim=[[HT_Par_SubClaimViewController alloc]init];
    [self.navigationController pushViewController:claim animated:YES];
    
}
#pragma mark UITableViewDelegate
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *_cell;
    HT_Par_BuyMainTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellSub forIndexPath:indexPath];
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
