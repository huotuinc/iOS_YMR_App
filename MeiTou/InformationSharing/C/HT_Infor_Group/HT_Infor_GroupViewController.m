//
//  HT_Infor_GroupViewController.m
//  MeiTou
//
//  Created by che on 15/12/7.
//  Copyright © 2015年 车. All rights reserved.
//

#import "HT_Infor_GroupViewController.h"

#import "HT_Infor_HeadCView.h"
#import "HT_Infor_GroupTableViewCell.h"

static NSString *cellGMain = @"cellGMain";

@interface HT_Infor_GroupViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation HT_Infor_GroupViewController{
    UITableView *_tableView;
    UIView *_headerView;//tbV的headerView
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden=NO;
    self.navigationController.navigationBar.translucent=NO;
    [_tableView registerNib:[UINib nibWithNibName:@"HT_Infor_GroupTableViewCell" bundle:nil]forCellReuseIdentifier:cellGMain];

    
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createHeaderView];
    [self createTableView];
}
-(void)createHeaderView{
    NSArray *nib=[[NSBundle mainBundle]loadNibNamed:@"HT_Infor_HeadCView" owner:nil options:nil];
    HT_Infor_GroupViewController *headerView=[nib firstObject];
    _headerView=headerView;
    

}
-(void)createTableView{
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WITH , SCREEN_HEIGHT) style:UITableViewStylePlain];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    _tableView.tableHeaderView=_headerView;
    [self.view addSubview:_tableView];
   
}
#pragma mark UITableViewDelegate
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *_cell;
    HT_Infor_GroupTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellGMain forIndexPath:indexPath];
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
