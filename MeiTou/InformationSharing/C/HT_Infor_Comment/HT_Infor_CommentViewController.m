//
//  HT_Infor_CommentViewController.m
//  MeiTou
//
//  Created by che on 15/12/7.
//  Copyright © 2015年 车. All rights reserved.
//

#import "HT_Infor_CommentViewController.h"

#import "HT_Infor_CommentHeadCView.h"
#import "HT_Infor_CommentTableViewCell.h"
#import "HT_Infor_BottomCView.h"
#import "HT_Infor_CommentCellHeaderView.h"

static NSString *cellIComment=@"cellIComment";
@interface HT_Infor_CommentViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation HT_Infor_CommentViewController{
    UITableView *_tableView;
    HT_Infor_CommentHeadCView *_headView;
    HT_Infor_BottomCView *_bottomView;
    HT_Infor_CommentCellHeaderView *_headerView;
    UIView *_footerView;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden=NO;
    self.navigationController.navigationBar.translucent=NO;
    //    self.navigationController.navigationBar.barTintColor = [];
    [self createBarButtonItem];

    
    
    
    
    
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor cyanColor];
    [self createHeadView];
    [self createFooterView];
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
-(void)createHeadView{
    NSArray *nib=[[NSBundle mainBundle]loadNibNamed:@"HT_Infor_CommentHeadCView" owner:nil options:nil];
    _headView=[nib firstObject];
    _headView.frame=CGRectMake(0, 0, SCREEN_WITH, SCREEN_HEIGHT/1150*500);
    
}
-(void)createFooterView{
    _footerView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WITH, 300)];
}
-(void)createTableView{
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WITH , SCREEN_HEIGHT) style:UITableViewStyleGrouped];
    [_tableView registerNib:[UINib nibWithNibName:@"HT_Infor_CommentTableViewCell" bundle:nil]forCellReuseIdentifier:cellIComment];

    _tableView.delegate=self;
    _tableView.dataSource=self;
    _tableView.tableHeaderView=_headView;
    _tableView.tableFooterView=_footerView;
    _tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableView];
    
}

-(void)createBottomView{
    NSArray *nib=[[NSBundle mainBundle]loadNibNamed:@"HT_Infor_BottomCView" owner:nil options:nil];
    _bottomView=[nib firstObject];
    _bottomView.frame=CGRectMake(0,SCREEN_HEIGHT-(SCREEN_HEIGHT/1100*90)-64, SCREEN_WITH, SCREEN_HEIGHT/1100*90);
    [self.view addSubview:_bottomView];
    
}
/**
 *
 */
-(void)clickLightButton{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)clickRightButton{

    
}
#pragma mark UITableViewDelegate
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    HT_Infor_CommentTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIComment forIndexPath:indexPath];
    if (indexPath.section==0) {
        NSLog(@"111111111");
    }
    if (indexPath.section==1) {
        for (int i=0; i<2; i++) {
            UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(0, cell.viewBase.frame.size.height/2*i, SCREEN_WITH, cell.viewBase.frame.size.height/2)];
            if (i==0) {
                label.text=@"  小丽: 奋斗第大佛个话题有人疼";
            }else{
                label.text=@"  东东回复小丽 :但是减肥各地舒服";
            }
            label.font=[UIFont systemFontOfSize:FONT_SIZE(22)];
            label.textColor=COLOR_TEXT_DATE;
            [cell.viewBase addSubview:label];
        }
    }

    
    
    return cell;
    
    
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2  ;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        return 0;
    }else{
        return SCREEN_HEIGHT/1150*100;

    }
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return SCREEN_HEIGHT/1150*250;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    NSArray *nib=[[NSBundle mainBundle]loadNibNamed:@"HT_Infor_CommentCellHeaderView" owner:nil options:nil];
    _headView=[nib firstObject];
    return _headView;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIImageView *imageV=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WITH, 1)];
    imageV.image=[UIImage imageNamed:@"line1"];
    return imageV;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 1.00;
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
