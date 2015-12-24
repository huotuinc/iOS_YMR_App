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
#import "HT_Par_SearchViewController.h"
#import "HT_Infor_SearchViewController.h"

#import "HT_Infor_MainTableViewCell.h"
#import "HT_Infor_BottomTabBarCView.h"
#import "HT_Par_SearchCView.h"
#import "InformationModel.h"



static NSString *cellIMain = @"cellIMain";
@interface HT_InformationViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) NSString *searchKey;

@property (nonatomic, strong) NSMutableArray *shareList;

@end

@implementation HT_InformationViewController{
    UITableView *_tableView;
    HT_Par_SearchCView *_topView;//搜索框
    HT_Infor_BottomTabBarCView *_bottomView;
    UIView *_clearView;//用于添加imageVShare的tap事件
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden=NO;
    self.navigationController.navigationBar.translucent=NO;
    [self createBarButtonItem];
    [_tableView registerNib:[UINib nibWithNibName:@"HT_Infor_MainTableViewCell" bundle:nil]forCellReuseIdentifier:cellIMain];
    
    [self getNewShareList];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor cyanColor];
    self.shareList = [NSMutableArray array];
    
    [self createTopView];
    [self createTableView];
    [self createBottomView];
}

/**
 *  下拉刷新
 */
- (void)getNewShareList {
    
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    dic[@"lastId"] = @0;
    dic[@"key"] = self.searchKey;
    
    
    [UserLoginTool loginRequestGet:@"searchShareList" parame:dic success:^(id json) {
       
        LWLog(@"%@",json);
        
        if ([json[@"systemResultCode"] intValue] == 1 && [json[@"resultCode"] intValue] == 1) {
            
            NSArray *temp = [InformationModel objectArrayWithKeyValuesArray:json[@"resultData"][@"list"]];
            
            [self.shareList removeAllObjects];
            
            [self.shareList addObjectsFromArray:temp];
            
            [_tableView reloadData];
        }
        
    } failure:^(NSError *error) {
        LWLog(@"%@",error);
    }];
    
}

/**
 *  上拉加载更多
 */
- (void)getMoreShareList {
    
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    dic[@"key"] = self.searchKey;
    InformationModel *info = [self.shareList lastObject];
    dic[@"lastId"] = info.pid;
    
    
    [UserLoginTool loginRequestGet:@"searchShareList" parame:dic success:^(id json) {
        
        NSLog(@"%@",json);
        
        if ([json[@"systemResultCode"] intValue] == 1 && [json[@"resultCode"] intValue] == 1) {
            
            NSArray *temp = [InformationModel objectArrayWithKeyValuesArray:json[@"resultData"][@"list"]];
            
            [self.shareList addObjectsFromArray:temp];
            
            [_tableView reloadData];
        }
        
    } failure:^(NSError *error) {
        NSLog(@"%@",error);
    }];
    
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
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT/1100*70, SCREEN_WITH , SCREEN_HEIGHT) style:UITableViewStyleGrouped];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    _tableView.backgroundColor = COLOR_BACK_MAIN;
    _tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableView];
   
}
-(void)createClearView{
    _clearView=[[UIView alloc]initWithFrame:CGRectMake(SCREEN_WITH/2-SCREEN_WITH/640*90/2, _bottomView.frame.origin.y-SCREEN_WITH/640*90/2, SCREEN_WITH/640*90, SCREEN_WITH/640*90/2)];
    _clearView.backgroundColor=[UIColor clearColor];
    UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapTheClearView)];
    [_clearView addGestureRecognizer:tap];
    [self.view insertSubview:_clearView aboveSubview:_bottomView];

}

-(void)createBottomView{
    NSArray *nib=[[NSBundle mainBundle]loadNibNamed:@"HT_Infor_BottomTabBarCView" owner:nil options:nil];
    _bottomView=[nib firstObject];
    _bottomView.frame=CGRectMake(0,SCREEN_HEIGHT-(SCREEN_HEIGHT/1100*90)-64, SCREEN_WITH, SCREEN_HEIGHT/1100*90);
    _bottomView.imageVShare.userInteractionEnabled=YES;
    UITapGestureRecognizer * tapA = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapTheShareView)];
    [_bottomView.imageVShare addGestureRecognizer:tapA];
    [self.view addSubview:_bottomView];
    [self createClearView];


}

-(void)createTopView{
    NSArray *nib= [[NSBundle mainBundle]loadNibNamed:@"HT_Par_SearchCView" owner:nil options:nil];
    _topView=[nib firstObject];
    _topView.frame=CGRectMake(0, 0, SCREEN_WITH , SCREEN_HEIGHT/1100*70);
    UIView *viewSearch=[[UIView alloc]initWithFrame:_topView.frame];
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapTheSearchView)];
    [viewSearch addGestureRecognizer:tap];
    [self.view addSubview:_topView];
    [self.view addSubview:viewSearch];
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
-(void)tapTheSearchView{
    HT_Infor_SearchViewController *search=[[HT_Infor_SearchViewController alloc]init];
    [self.navigationController pushViewController:search animated:YES];
    
}
-(void)tapTheClearView{
    HT_Infor_ShareViewController *share=[[HT_Infor_ShareViewController alloc]init];
    [self.navigationController pushViewController:share animated:YES];
}
-(void)tapTheShareView{
    NSLog(@"dsfgdshfds***************");
    HT_Infor_ShareViewController *share=[[HT_Infor_ShareViewController alloc]init];
    [self.navigationController pushViewController:share animated:YES];
}
#pragma mark UITableViewDelegate
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
        HT_Infor_MainTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIMain forIndexPath:indexPath];
    if (indexPath.section==0) {
        cell.imageVState.image=[UIImage imageNamed:@"zhiding"];
    }
    if (indexPath.section==1) {
    }
    if (indexPath.section==2) {
    }

    cell.backgroundColor=COLOR_BACK_MAIN;
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    return cell;
    
    
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return SCREEN_HEIGHT/1150*635 ;
    
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
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 1;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WITH, 1)];
    return view;
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
