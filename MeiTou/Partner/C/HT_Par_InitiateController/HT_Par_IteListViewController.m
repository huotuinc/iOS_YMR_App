//
//  HT_Par_IteListViewController.m
//  MeiTou
//
//  Created by che on 15/12/4.
//  Copyright © 2015年 车. All rights reserved.
//

#import "HT_Par_IteListViewController.h"
#import "HT_Par_IteListTableViewCell.h"

static NSString *cellIList = @"cellIList";

@interface HT_Par_IteListViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation HT_Par_IteListViewController{
    UITableView *_tableView;
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden=NO;
    self.navigationController.navigationBar.translucent=NO;
    [_tableView registerNib:[UINib nibWithNibName:@"HT_Par_IteListTableViewCell" bundle:nil]forCellReuseIdentifier:cellIList];
    [self createBarButtonItem];
    
    
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createTableView];
}
-(void)createBarButtonItem{
    UIButton *buttonL=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 18, 18)];
    [buttonL setBackgroundImage:[UIImage imageNamed:@"common_title_top_back"] forState:UIControlStateNormal];
    [buttonL addTarget:self action:@selector(clickLightButton) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *bbiL=[[UIBarButtonItem alloc]initWithCustomView:buttonL];
    self.navigationItem.leftBarButtonItem=bbiL;
    
//    UIButton *buttonR=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 18, 18)];
//    [buttonR setBackgroundImage:[UIImage imageNamed:@"common_title_top_more"]forState:UIControlStateNormal];
//    [buttonR addTarget:self action:@selector(clickRightButton) forControlEvents:UIControlEventTouchUpInside];
//    UIBarButtonItem *bbiR=[[UIBarButtonItem alloc]initWithCustomView:buttonR];
//    self.navigationItem.rightBarButtonItem=bbiR;
}
/**
 *
 */
-(void)clickLightButton{
    [self.navigationController popViewControllerAnimated:YES];
}
//-(void)clickRightButton{
//    
//}
-(void)createTableView{
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WITH , SCREEN_HEIGHT) style:UITableViewStylePlain];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    [self.view addSubview:_tableView];
    
}
#pragma mark UITableViewDelegate
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *_cell;
    
    HT_Par_IteListTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIList        forIndexPath:indexPath];

    
    
    _cell=cell;
    return _cell;
    
    
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return SCREEN_HEIGHT/8;
    
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
