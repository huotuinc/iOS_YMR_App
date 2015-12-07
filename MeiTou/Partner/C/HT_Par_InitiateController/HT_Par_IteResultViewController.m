//
//  HT_Par_IteResultViewController.m
//  MeiTou
//
//  Created by che on 15/12/4.
//  Copyright © 2015年 车. All rights reserved.
//

#import "HT_Par_IteResultViewController.h"
#import "HT_Par_IteResultTableViewCell.h"

static NSString *cellIResult = @"cellIResult";

@interface HT_Par_IteResultViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation HT_Par_IteResultViewController{
    UITableView *_tableView;
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden=NO;
    self.navigationController.navigationBar.translucent=NO;
    [_tableView registerNib:[UINib nibWithNibName:@"HT_Par_IteResultTableViewCell" bundle:nil]forCellReuseIdentifier:cellIResult];
    
    
    
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createTableView];
}
-(void)createTableView{
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WITH , SCREEN_HEIGHT) style:UITableViewStylePlain];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    [self.view addSubview:_tableView];
    
}
#pragma mark UITableViewDelegate
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *_cell;
    HT_Par_IteResultTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIResult forIndexPath:indexPath];
    
    
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    _cell=cell;
    return _cell;
    
    
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return SCREEN_HEIGHT/1100*187;
    
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