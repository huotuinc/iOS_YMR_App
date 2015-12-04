//
//  HT_Par_IteViewController.m
//  MeiTou
//
//  Created by che on 15/12/3.
//  Copyright © 2015年 车. All rights reserved.
//

#import "HT_Par_IteViewController.h"
#import "HT_Par_IteListViewController.h"
#import "HT_Par_IteResultViewController.h"

#import "HT_Par_MainTopView.h"
#import "HT_Par_IteProjectDoingHeaderCView.h"
#import "HT_Par_IteProjectDoneHeaderCView.h"
#import "HT_Par_BuyMainTableViewCell.h"
#import "HT_Par_IteBottomCView.h"
static NSString *cellIte = @"cellIte";

@interface HT_Par_IteViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation HT_Par_IteViewController{
    UITableView *_tableView;
    UIView *_topView;
    UIView *_headerView;
    UIView *_bottomView;
}


-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden=NO;
    self.navigationController.navigationBar.translucent = NO;
    [_tableView registerNib:[UINib nibWithNibName:@"HT_Par_BuyMainTableViewCell" bundle:nil]forCellReuseIdentifier:cellIte];
    
    
    
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor whiteColor];
    
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
    if (1) {
        NSArray *nib=[[NSBundle mainBundle]loadNibNamed:@"HT_Par_IteProjectDoneHeaderCView" owner:nil options:nil];
        HT_Par_IteProjectDoneHeaderCView *headerView=[nib firstObject];
        headerView.frame=CGRectMake(0, 0, SCREEN_WITH, SCREEN_HEIGHT/1100*222/190*270);
        UITapGestureRecognizer * tapHeadGroup = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapTheHeadGroup)];
        [headerView.ViewHeadGroup addGestureRecognizer:tapHeadGroup];
        _headerView=headerView;
        
    }else{
//        NSArray *nib=[[NSBundle mainBundle]loadNibNamed:@"HT_Par_IteProjectDoingHeaderCView" owner:nil options:nil];
//        HT_Par_IteProjectDoingHeaderCView *headerView=[nib firstObject];
//        headerView.frame=CGRectMake(0, 0, SCREEN_WITH, SCREEN_HEIGHT/1100*222);
//        _headerView=headerView;
    
    }
    
}
-(void)createTableView{
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, _topView.frame.origin.y+_topView.frame.size.height, SCREEN_WITH , SCREEN_HEIGHT/1100*(615+222/190*270)) style:UITableViewStylePlain];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    _tableView.tableHeaderView=_headerView;
    //    _tableView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:_tableView];
    
    
    
}
-(void)createBottomView{
    //    SCREEN_HEIGHT-(SCREEN_HEIGHT/1100*100)
    NSArray *nib=[[NSBundle mainBundle]loadNibNamed:@"HT_Par_IteBottomCView" owner:nil options:nil];
    HT_Par_IteBottomCView *bottomView=[nib firstObject];
    bottomView.frame=CGRectMake(0,SCREEN_HEIGHT-(SCREEN_HEIGHT/1100*100)-64, SCREEN_WITH, SCREEN_HEIGHT/1100*100);
//    [bottomView.buttonSubscription addTarget:self action:@selector(clickButtonSubscription) forControlEvents:UIControlEventTouchUpInside];
    
    _bottomView=bottomView;
    //    [self.view insertSubview:_bottomView aboveSubview:_tableView];
    
    [self.view addSubview:_bottomView];
    
    
    //    NSLog(@"%f",SCREEN_HEIGHT);
    //    NSLog(@"%f",SCREEN_HEIGHT-(SCREEN_HEIGHT/1100*100));
    //    NSLog(@"%f",SCREEN_HEIGHT/1100*100);
    
}
/**
 *  tap事件
 */
-(void)tapThePersonView{
    HT_Par_IteListViewController *list=[[HT_Par_IteListViewController alloc]init];
    [self.navigationController pushViewController:list animated:YES];
}

-(void)tapTheHeadGroup{
    HT_Par_IteResultViewController *result=[[HT_Par_IteResultViewController alloc]init];
    [self.navigationController pushViewController:result animated:YES];

}
#pragma mark UITableViewDelegate
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *_cell;
    HT_Par_BuyMainTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIte forIndexPath:indexPath];
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
