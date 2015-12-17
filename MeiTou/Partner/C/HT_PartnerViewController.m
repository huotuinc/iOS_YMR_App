//
//  HT_PartnerViewController.m
//  MeiTou
//
//  Created by che on 15/12/1.
//  Copyright © 2015年 车. All rights reserved.
//

#import "HT_PartnerViewController.h"
#import "HT_Par_BuyViewController.h"
#import "HT_Par_IteViewController.h"
#import "HT_Par_SubViewController.h"
#import "HT_Par_MainTableViewCell.h"
#import "HT_HomePageViewController.h"
#import "HT_Par_SearchViewController.h"

#import "HT_Par_SearchCView.h"


static NSString *cellMain = @"cellMain";


@interface HT_PartnerViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation HT_PartnerViewController{
    HT_Par_SearchCView *_topView;
    UITableView *_tableView;
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden=NO;
    self.navigationController.navigationBar.translucent=NO;
    self.navigationController.navigationBar.barTintColor = COLOR_NAVBAR_A;

    [_tableView registerNib:[UINib nibWithNibName:@"HT_Par_MainTableViewCell" bundle:nil]forCellReuseIdentifier:cellMain];
    


    [self createBarButtonItem];
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    [_tableView registerNib:[UINib nibWithNibName:@"HT_Cpn_MainTableViewCell" bundle:nil]forCellReuseIdentifier:cellMain];
    [self createTopView];
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

    for (UIViewController *temp in self.navigationController.viewControllers) {
        if ([temp isKindOfClass:[HT_HomePageViewController class]]) {
            [self.navigationController popToViewController:temp animated:YES];
        }
    }
    NSLog(@"1111");
}
-(void)clickRightButton{
    
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

-(void)createTableView{
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, _topView.frame.origin.y+_topView.frame.size.height, SCREEN_WITH , SCREEN_HEIGHT-64) style:UITableViewStyleGrouped];
    _tableView.showsHorizontalScrollIndicator=NO;
    _tableView.delegate=self;
    _tableView.dataSource=self;
    [self.view addSubview:_tableView];
    
    

}
/**
 *  tap事件
 */
-(void)tapTheSearchView{
    HT_Par_SearchViewController *search=[[HT_Par_SearchViewController alloc]init];
    [self.navigationController pushViewController:search animated:YES];

}
#pragma mark UITableViewDelegate
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *_cell;
    if (indexPath.section==0) {
        HT_Par_MainTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellMain forIndexPath:indexPath];
        cell.labelDate.text=@"10-10";
        cell.LabelTitle.text=@"众筹会议项目名称";
        cell.labelContent.text=@"12月1日-2日，习主席出访津巴布韦。 津巴布韦总统府将赠送数件国礼，包括其特有的石雕。送给习主席的是狮子石雕，题为“友好的狮子”，意指中国像健壮的雄狮，有力量却从不对外露出獠牙利爪， 和平处事；送给彭丽媛的是母女石雕，意为世界大同，赞颂母爱。（央视记者顾雪嘉）";
        cell.labelRight.text=@"预约金$1500";
        cell.labelLeft.text=@"20/50人预约";
        [cell.ButtonGo setTitle:@"我要购买" forState:UIControlStateNormal];
        [cell.ButtonGo setBackgroundColor:COLOR_BUTTON_RED];
        _cell=cell;
        

    }
    if (indexPath.section==1) {
        HT_Par_MainTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellMain forIndexPath:indexPath];
        cell.labelDate.text=@"10-10";
        cell.LabelTitle.text=@"众筹合作项目名称";
        cell.labelLeft.text=@"目标金额150万";
        cell.labelRight.text=@"剩余100万";
        [cell.ButtonGo setTitle:@"我要发起" forState:UIControlStateNormal];
        [cell.ButtonGo setBackgroundColor:COLOR_BUTTON_INITIATE];
        _cell=cell;
        
    }
    if (indexPath.section==2) {
        HT_Par_MainTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellMain forIndexPath:indexPath];
        cell.labelDate.text=@"10-10";
        cell.LabelTitle.text=@"众筹认购项目名称";
        cell.labelLeft.text=@"目标金额150万";
        cell.labelRight.text=@"起购5万";
        [cell.ButtonGo setTitle:@"我要认购" forState:UIControlStateNormal];
        [cell.ButtonGo setBackgroundColor:COLOR_BUTTON_ORANGE];
        _cell=cell;
        
    }
    return _cell;

    
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return SCREEN_HEIGHT/1150*515;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        HT_Par_BuyViewController *buy=[[HT_Par_BuyViewController alloc]init];
        [self.navigationController pushViewController:buy animated:YES];

    }
    if (indexPath.section==1) {
        HT_Par_IteViewController *ite=[[HT_Par_IteViewController alloc]init];
        [self.navigationController pushViewController:ite animated:YES];
    }
    if (indexPath.section==2) {
        HT_Par_SubViewController *sub=[[HT_Par_SubViewController alloc]init];
        [self.navigationController pushViewController:sub animated:YES];
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10.00;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 1.00;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *view=[[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WITH, 5)];
    return view;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *view=[[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WITH, 1)];
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
