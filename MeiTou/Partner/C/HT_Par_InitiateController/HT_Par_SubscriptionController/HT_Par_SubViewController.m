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
#import "HT_HomePage_NavTitleCVIew.h"
static NSString *cellSub = @"cellSub";

@interface HT_Par_SubViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation HT_Par_SubViewController{
    UITableView *_tableView;
    UIView *_topView;//顶部视图
    UIView *_headerView;//_tableV 的headerV
    UIView *_bottomView;//底部视图
    HT_HomePage_NavTitleCVIew *_navView;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden=NO;
    self.navigationController.navigationBar.translucent = NO;
    [self changeNavigationBarLineHidden:YES];
    [self createBarButtonItem];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createNavTitleView];
    [self createHeadView];
    [self createTableView];
    [self createBottomView];
}
/**
 *  隐藏导航栏下面那条线
 *
 *  @param hidden <#hidden description#>
 */
- (void)changeNavigationBarLineHidden:(BOOL)hidden {
    if ([self.navigationController.navigationBar respondsToSelector:@selector(setBackgroundImage:forBarMetrics:)]) {
        NSArray *list = self.navigationController.navigationBar.subviews;
        for (id obj in list) {
            if ([obj isKindOfClass:[UIImageView class]]) {
                UIImageView *imageView = (UIImageView *)obj;
                NSArray *list2 = imageView.subviews;
                for (id obj2 in list2) {
                    if ([obj2 isKindOfClass:[UIImageView class]]) {
                        UIImageView *imageView2 = (UIImageView *)obj2;
                        imageView2.hidden = hidden;
                    }
                }
            }
        }
    }
}

-(void)createNavTitleView{
    NSArray *nib=[[NSBundle mainBundle]loadNibNamed:@"HT_HomePage_NavTitleCVIew" owner:nil options:nil];
    _navView=[nib firstObject];
    _navView.labelA.text=@"项目状况";
    _navView.labelB.text=@"预约人列表";
    _navView.imageVLineC.hidden=YES;
    _navView.imageVLineD.hidden=YES;
    UITapGestureRecognizer * tapB = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapTheListView)];
    [_navView.viewB addGestureRecognizer:tapB];
    _navView.frame=CGRectMake(0, 0, SCREEN_WITH/750*430, SCREEN_HEIGHT/1150*46);
    self.navigationItem.titleView=_navView;
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
    NSArray *nib=[[NSBundle mainBundle]loadNibNamed:@"HT_Par_SubProjectDoneHeaderCView" owner:nil options:nil];
    HT_Par_SubProjectDoneHeaderCView *headerView=[nib firstObject];
    headerView.frame=CGRectMake(0, 0, SCREEN_WITH,SCREEN_HEIGHT/1100*250/190*270);
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
//原来250是222
-(void)createTableView{
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0,0, SCREEN_WITH , SCREEN_HEIGHT-_bottomView.frame.size.height) style:UITableViewStylePlain];
    [_tableView registerNib:[UINib nibWithNibName:@"HT_Par_BuyMainTableViewCell" bundle:nil]forCellReuseIdentifier:cellSub];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    _tableView.tableHeaderView=_headerView;
    _tableView.backgroundColor=COLOR_BACK_MAIN;
    _tableView.showsVerticalScrollIndicator =NO;
    _tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableView];
}
/**
 *  tap事件
 */

-(void)tapTheListView{
    HT_Par_SubListViewController *list=[[HT_Par_SubListViewController alloc]init];
    [self.navigationController pushViewController:list animated:YES];
}
-(void)clickButtonSubscription{
    HT_Par_SubClaimViewController *claim=[[HT_Par_SubClaimViewController alloc]init];
    [self.navigationController pushViewController:claim animated:YES];
    
}
#pragma mark UITableViewDelegate
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    HT_Par_BuyMainTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellSub forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return (NSInteger)SCREEN_HEIGHT ;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WITH, 50)];
    return view;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 130.0f;
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
