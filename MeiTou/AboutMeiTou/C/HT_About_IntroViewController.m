//
//  HT_About_IntroViewController.m
//  MeiTou
//
//  Created by che on 15/12/8.
//  Copyright © 2015年 车. All rights reserved.
//

#import "HT_About_IntroViewController.h"

#import "HT_About_IntroTableViewCell.h"
#import "HT_About_TopCView.h"
#import "HT_About_HeaderCView.h"


static NSString *cellIntro = @"cellIntro";

@interface HT_About_IntroViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation HT_About_IntroViewController{
    UITableView *_tableView;
    UIView *_topView;//顶部视图
    UIView *_headerView;//_tableV 的headerV
    UIView *_bottomView;//底部视图
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden=NO;
    self.navigationController.navigationBar.translucent = NO;
    [_tableView registerNib:[UINib nibWithNibName:@"HT_About_IntroTableViewCell" bundle:nil]forCellReuseIdentifier:cellIntro];
    [self createBarButtonItem];

    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor whiteColor];
    
    [self createTopView];
    [self createHeadView];
    [self createTableView];
    
    
    
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
-(void)createTopView{
    
    NSArray  *nib= [[NSBundle mainBundle]loadNibNamed:@"HT_About_TopCView" owner:nil options:nil];
    HT_About_TopCView *topView=[nib firstObject];
    topView.frame=CGRectMake(0, 0, SCREEN_WITH , SCREEN_HEIGHT/1100*80);
    _topView=topView;
    [self.view addSubview:_topView];
    
}
-(void)createHeadView{
    NSArray *nib=[[NSBundle mainBundle]loadNibNamed:@"HT_About_HeaderCView" owner:nil options:nil];
    HT_About_HeaderCView *headerView=[nib firstObject];
    headerView.frame=CGRectMake(0, 0, SCREEN_WITH, SCREEN_HEIGHT/1100*222);
    _headerView=headerView;
}


-(void)createTableView{
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, _topView.frame.origin.y+_topView.frame.size.height, SCREEN_WITH , SCREEN_HEIGHT/1100*(615+222)) style:UITableViewStylePlain];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    _tableView.tableHeaderView=_headerView;
    _tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableView];
}

#pragma mark UITableViewDelegate
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *_cell;
    HT_About_IntroTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIntro forIndexPath:indexPath];
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
