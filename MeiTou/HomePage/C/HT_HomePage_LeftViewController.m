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
#import "HT_AboutMeiTouViewController.h"
#import "HT_PartnerViewController.h"
#import "HT_InformationViewController.h"


#import "HT_HomePage_LeftTableViewCell.h"
#import "HT_HomePage_LeftHeadView.h"
#import "HT_HomePage_LeftBottomView.h"

#import "UIViewController+MMDrawerController.h"

@interface HT_HomePage_LeftViewController ()<NSXMLParserDelegate,UITableViewDelegate,UITableViewDataSource>



@end

@implementation HT_HomePage_LeftViewController{
    UITableView *_tableView;
    UIView *_baseView;
//    HT_HomePage_LeftHeadView *_headView;
    
    NSMutableArray *_titleArray;
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];



}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _titleArray=[NSMutableArray arrayWithArray:@[@"首页",@"账户",@"关于美投",@"合伙人",@"爱美容"]];
    

    [self createHeadView];
    [self createTableView];
    [self createButtonBottom];
    
}

-(void)createHeadView{
    NSArray *nib=[[NSBundle mainBundle]loadNibNamed:@"HT_HomePage_LeftHeadView" owner:nil options:nil];
    UIView *headView=[nib firstObject];
    headView.frame=CGRectMake(0, 0, SCREEN_WITH * SplitScreenRate, SCREEN_HEIGHT/1100*460);
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapTheHeadView)];
    [headView addGestureRecognizer:tap];
    [self.view addSubview:headView];
}

-(void)createTableView{
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT/1100*450, SCREEN_WITH * SplitScreenRate, SCREEN_HEIGHT/1100*400) style:UITableViewStylePlain];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    [self.view addSubview:_tableView];
}

-(void)createButtonBottom{
    
    NSArray  *nib= [[NSBundle mainBundle]loadNibNamed:@"HT_HomePage_LeftBottomView" owner:nil options:nil];
    UIView *bottomView=[nib firstObject];
    bottomView.frame=CGRectMake(0, _tableView.frame.origin.y+_tableView.frame.size.height, SCREEN_WITH * SplitScreenRate,SCREEN_HEIGHT/1100*145);
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapThebottomView)];
    [bottomView addGestureRecognizer:tap];
    [self.view addSubview:bottomView];

}

-(void)tapTheHeadView{
    NSLog(@"tap");
    HT_HomePage_PersonViewTableViewController *person=[[HT_HomePage_PersonViewTableViewController alloc]init];
    [self.navigationController pushViewController:person animated:YES];
    

}
-(void)tapThebottomView{
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
    
    cell.labelName.text=_titleArray[indexPath.row];
    cell.backgroundColor=[UIColor redColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;


    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return _tableView.frame.size.height/5;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row==0) {
        HT_HomePageViewController *home = [[HT_HomePageViewController alloc] init];
        UINavigationController *centernav = [[UINavigationController alloc] initWithRootViewController:home];
        [self.mm_drawerController setCenterViewController:centernav withCloseAnimation:YES completion:nil];
    }
    if (indexPath.row==1) {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        HT_HomePage_PersonViewTableViewController * person = [storyboard instantiateViewControllerWithIdentifier:@"HT_HomePage_PersonViewTableViewController"];

        UINavigationController *centernav = [[UINavigationController alloc] initWithRootViewController:person];
        [self.mm_drawerController setCenterViewController:centernav withCloseAnimation:YES completion:nil];
        
    }
    if (indexPath.row==2) {
//        HT_AboutMeiTouViewController *about=[[HT_AboutMeiTouViewController alloc ]init];
//        [self.navigationController pushViewController:about animated:YES];
//        NSLog(@"333");
        HT_AboutMeiTouViewController *about = [[HT_AboutMeiTouViewController alloc] init];
        UINavigationController *centernav = [[UINavigationController alloc] initWithRootViewController:about];
        
        [self.mm_drawerController setCenterViewController:centernav withCloseAnimation:YES completion:nil];

    }
    if (indexPath.row==3) {
//        HT_PartnerViewController *partner=[[HT_PartnerViewController alloc ]init];
//        [self.navigationController pushViewController:partner animated:YES];
        HT_PartnerViewController *partner = [[HT_PartnerViewController alloc] init];
        UINavigationController *centernav = [[UINavigationController alloc] initWithRootViewController:partner];
        [self.mm_drawerController setCenterViewController:centernav withCloseAnimation:YES completion:nil];


    }
    if (indexPath.row==4) {
//        HT_InformationViewController *information=[[HT_InformationViewController alloc ]init];
//        [self.navigationController pushViewController:information animated:YES];
        HT_InformationViewController *information = [[HT_InformationViewController alloc] init];
        UINavigationController *centernav = [[UINavigationController alloc] initWithRootViewController:information];
        [self.mm_drawerController setCenterViewController:centernav withCloseAnimation:YES completion:nil];

    }
}

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
