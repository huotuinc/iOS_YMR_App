//
//  HT_HomePage_LeftViewController.m
//  MeiTou
//
//  Created by che on 15/11/27.
//  Copyright © 2015年 车. All rights reserved.
//

#import "HT_HomePage_LeftViewController.h"
#import "HT_HomePage_PersonViewTableViewController.h"
#import "HT_HomePageViewController.h"
#import "HT_About_CompanyViewController.h"
#import "HT_PartnerViewController.h"
#import "HT_InformationViewController.h"
#import "HT_HomePage_ChangeViewController.h"


#import "HT_HomePage_LeftTableViewCell.h"
#import "HT_HomePage_LeftHeadView.h"
#import "UIViewController+MMDrawerController.h"



@interface HT_HomePage_LeftViewController ()<NSXMLParserDelegate,UITableViewDelegate,UITableViewDataSource>



@end

@implementation HT_HomePage_LeftViewController{
    UIView *_headView;
    UITableView *_tableView;
    UIView *_baseView;
    UIImageView *_imageV;
    
    NSMutableArray *_iconArray;
//    HT_HomePage_LeftHeadView *_headView;
    
    NSMutableArray *_titleArray;
    
}

-(void)viewWillAppear:(BOOL)animated{
    
    
     _imageV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"xiand"]];
    _imageV.frame = self.view.bounds;
    _imageV.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    [self.view insertSubview:_imageV atIndex:0];
    

}
//-(void)viewDidLayoutSubviews
//{
//    [super viewDidLayoutSubviews];
//    
//    // Force your tableview margins (this may be a bad idea)
//    if ([_tableView respondsToSelector:@selector(setSeparatorInset:)]) {
//        [_tableView setSeparatorInset:UIEdgeInsetsZero];
//    }
//    
//    if ([_tableView respondsToSelector:@selector(setLayoutMargins:)]) {
//        [_tableView setLayoutMargins:UIEdgeInsetsZero];
//    }
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    [self createLocalData];
    [self createHeadView];
    [self createTableView];
    
}
/**
 *  创建数据
 */
-(void)createLocalData{
    _iconArray=[NSMutableArray arrayWithArray:@[@"SlidingMenu_content_left_home",@"SlidingMenu_content_left_account",@"SlidingMenu_content_left_meitou",@"SlidingMenu_content_left_partner",@"SlidingMenu_content_left_cosmetology",@"SlidingMenu_content_left_qiehuan"]];
    _titleArray=[NSMutableArray arrayWithArray:@[@"首页",@"账户",@"关于美投",@"财经资讯",@"美容资讯",@"账户切换"]];
}


-(void)createHeadView{
    NSArray *nib=[[NSBundle mainBundle]loadNibNamed:@"HT_HomePage_LeftHeadView" owner:nil options:nil];
    HT_HomePage_LeftHeadView *headView=[nib firstObject];
    headView.frame=CGRectMake(0, 0, SCREEN_WITH * SplitScreenRate, SCREEN_HEIGHT/1100*460);
    UITapGestureRecognizer * tapHead= [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapTheHeadView)];
    [headView.headView addGestureRecognizer:tapHead];
    UITapGestureRecognizer * tapHelp = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapTheHelpView)];
    [headView.viewHelp addGestureRecognizer:tapHelp];
    _headView=headView;
    _headView.backgroundColor=[UIColor clearColor];//
    [self.view addSubview:_headView];
}

-(void)createTableView{
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT/1100*450, SCREEN_WITH * SplitScreenRate, SCREEN_HEIGHT/1100*480) style:UITableViewStylePlain];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    _tableView.separatorColor = COLOR_LEFTVC_CELLS;
    _tableView.backgroundColor=[UIColor clearColor];
    _tableView.tableFooterView = [[UIView alloc] init];
    [self.view addSubview:_tableView];
}



-(void)tapTheHeadView{
    NSLog(@"tap");
    HT_HomePage_PersonViewTableViewController *person=[[HT_HomePage_PersonViewTableViewController alloc]init];
    [self.navigationController pushViewController:person animated:YES];
    

}
-(void)tapTheHelpView{
    UIAlertView *alter  = [[UIAlertView alloc]initWithTitle:[NSString stringWithFormat:@"88888888"] message:nil delegate: self cancelButtonTitle:@"取消" otherButtonTitles: @"呼叫",nil];
    
    [alter show];
    

}



#pragma mark UITableViewDelegate

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * str = @"cell";
    HT_HomePage_LeftTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:str];
    if (!cell) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"HT_HomePage_LeftTableViewCell" owner:nil options:nil] lastObject];
    }
    cell.alpha=0;
    cell.backgroundColor=[UIColor clearColor];
    cell.imageVType.image=[UIImage imageNamed:[NSString stringWithFormat:@"%@",_iconArray[indexPath.row]]];
    cell.labelName.text=_titleArray[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    


    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_titleArray count];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return _tableView.frame.size.height/[_titleArray count];
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row==0) {
        HT_HomePageViewController *home = [[HT_HomePageViewController alloc] init];
        UINavigationController *centernav = [[UINavigationController alloc] initWithRootViewController:home];
        [self.mm_drawerController setCenterViewController:centernav withCloseAnimation:YES completion:nil];
    }
    if (indexPath.row==1) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"person" object:nil userInfo:nil];
        [self.mm_drawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:^(BOOL finished) {
            
        }];
    }
    if (indexPath.row==2) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"about" object:nil userInfo:nil];
        [self.mm_drawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:^(BOOL finished) {
            
        }];
    }
    if (indexPath.row==3) {

        [[NSNotificationCenter defaultCenter] postNotificationName:@"partner" object:nil userInfo:nil];
        [self.mm_drawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:^(BOOL finished) {
            
        }];
    }
    if (indexPath.row==4) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"information" object:nil userInfo:nil];
        [self.mm_drawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:^(BOOL finished) {
            
        }];
    }
    if (indexPath.row==5) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"change" object:nil userInfo:nil];
        [self.mm_drawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:^(BOOL finished) {
            
        }];
//        HT_HomePageViewController *home = [[HT_HomePageViewController alloc] init];
//        UINavigationController *centernav = [[UINavigationController alloc] initWithRootViewController:home];
//        [self.mm_drawerController setCenterViewController:centernav withCloseAnimation:YES completion:nil];
    }
}
/**
 *  cell分割线完全填充
 */
-(void)viewDidLayoutSubviews {
    if ([_tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [_tableView setSeparatorInset:UIEdgeInsetsZero];
        
    }
    if ([_tableView respondsToSelector:@selector(setLayoutMargins:)])  {
        [_tableView setLayoutMargins:UIEdgeInsetsZero];
    }
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPat{
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]){
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
}
//-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    // Remove seperator inset
//    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
//        [cell setSeparatorInset:UIEdgeInsetsZero];
//    }
//    
//    // Prevent the cell from inheriting the Table View's margin settings
//    if ([cell respondsToSelector:@selector(setPreservesSuperviewLayoutMargins:)]) {
//        [cell setPreservesSuperviewLayoutMargins:NO];
//    }
//    
//    // Explictly set your cell's layout margins
//    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
//        [cell setLayoutMargins:UIEdgeInsetsZero];
//    }
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillDisappear:(BOOL)animated{
    self.navigationController.navigationBar.hidden=NO;
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
