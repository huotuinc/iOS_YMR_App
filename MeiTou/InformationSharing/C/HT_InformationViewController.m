//
//  HT_InformationViewController.m
//  MeiTou
//
//  Created by che on 15/12/1.
//  Copyright © 2015年 车. All rights reserved.
//

#import "HT_InformationViewController.h"
#import "HT_Infor_NewsViewController.h"
#import "HT_Infor_CommentViewController.h"
#import "HT_Infor_GroupViewController.h"
#import "HT_Infor_ShareViewController.h"

#import "HT_Infor_MainTableViewCell.h"
#import "HT_Infor_BottomTabBarCView.h"


static NSString *cellIMain = @"cellIMain";
@interface HT_InformationViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation HT_InformationViewController{
    UITableView *_tableView;
    UIView *_bottomView;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden=NO;
    self.navigationController.navigationBar.translucent=NO;
//    self.navigationController.navigationBar.barTintColor = [];
    [self createBarButtonItem];
    [_tableView registerNib:[UINib nibWithNibName:@"HT_Infor_MainTableViewCell" bundle:nil]forCellReuseIdentifier:cellIMain];
    
    
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor cyanColor];

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

-(void)createTableView{
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WITH , SCREEN_HEIGHT) style:UITableViewStylePlain];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    //    _tableView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:_tableView];
   
}

-(void)createBottomView{
    NSArray *nib=[[NSBundle mainBundle]loadNibNamed:@"HT_Infor_BottomTabBarCView" owner:nil options:nil];
    HT_Infor_BottomTabBarCView *bottomView=[nib firstObject];
    bottomView.frame=CGRectMake(0,SCREEN_HEIGHT-(SCREEN_HEIGHT/1100*90)-64, SCREEN_WITH, SCREEN_HEIGHT/1100*90);
    _bottomView=bottomView;
    [self.view addSubview:_bottomView];

}
/**
 *
 */
-(void)clickLightButton{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)clickRightButton{
    HT_Infor_ShareViewController *share=[[HT_Infor_ShareViewController alloc]init];
    [self.navigationController pushViewController:share animated:YES];

}
#pragma mark UITableViewDelegate
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *_cell;
        HT_Infor_MainTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIMain forIndexPath:indexPath];
    if (indexPath.section==0) {
        cell.labelTitle.text=@"第一种第一种第一种第一种第一种";
    }
    if (indexPath.section==1) {
        cell.labelTitle.text=@"第二种第二种第二种第二种";
    }
    if (indexPath.section==2) {
        cell.labelTitle.text=@"第三种第三种";
    }
    _cell=cell;

    
    return _cell;
    
    
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return SCREEN_HEIGHT/1150*635;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        HT_Infor_NewsViewController *news=[[HT_Infor_NewsViewController alloc]init];
        [self.navigationController pushViewController:news animated:YES];
    }
    if (indexPath.section==1) {
        HT_Infor_CommentViewController *comment=[[HT_Infor_CommentViewController alloc]init];
        [self.navigationController pushViewController:comment animated:YES];
    }
    if (indexPath.section==2) {
        HT_Infor_GroupViewController *group=[[HT_Infor_GroupViewController alloc]init];
        [self.navigationController pushViewController:group animated:YES];
    }


}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
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
