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


static NSString *cellMain = @"cellMain";


@interface HT_PartnerViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation HT_PartnerViewController{
    UITableView *_tableView;
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden=NO;
    self.navigationController.navigationBar.translucent=NO;
    self.navigationController.navigationBar.barTintColor = NAVBARCOLOR1;

    [_tableView registerNib:[UINib nibWithNibName:@"HT_Par_MainTableViewCell" bundle:nil]forCellReuseIdentifier:cellMain];

    [self createBarButtonItem];
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor cyanColor];
    
//    [_tableView registerNib:[UINib nibWithNibName:@"HT_Cpn_MainTableViewCell" bundle:nil]forCellReuseIdentifier:cellMain];
    
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
//    HT_HomePageViewController *home=[[HT_HomePageViewController alloc]init];
//    UINavigationController *centernav = [[UINavigationController alloc] initWithRootViewController:home];
//    [self.navigationController popToViewController:centernav animated:YES];
    for (UIViewController *temp in self.navigationController.viewControllers) {
        if ([temp isKindOfClass:[HT_HomePageViewController class]]) {
            [self.navigationController popToViewController:temp animated:YES];
        }
    }
    NSLog(@"1111");
}
-(void)clickRightButton{
    
}

-(void)createTableView{
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WITH , SCREEN_HEIGHT) style:UITableViewStylePlain];
    _tableView.delegate=self;
    _tableView.dataSource=self;
//    _tableView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:_tableView];
    
    

}
#pragma mark UITableViewDelegate
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *_cell;
    if (indexPath.section==0) {
        HT_Par_MainTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellMain forIndexPath:indexPath];
        cell.imageVTop.image=[UIImage imageNamed:@"1"];
        cell.labelDate.text=@"10-10";
        cell.LabelTitle.text=@"11111111111111111111";
        cell.labelContent.text=@"12月1日-2日，习主席出访津巴布韦。 津巴布韦总统府将赠送数件国礼，包括其特有的石雕。送给习主席的是狮子石雕，题为“友好的狮子”，意指中国像健壮的雄狮，有力量却从不对外露出獠牙利爪， 和平处事；送给彭丽媛的是母女石雕，意为世界大同，赞颂母爱。（央视记者顾雪嘉）";
        
        cell.labelRight.text=@"5W";
        cell.labelLeft.text=@"10W";
        
        [cell.ButtonGo setTitle:@"我要购买" forState:UIControlStateNormal];
        [cell.ButtonGo setBackgroundColor:[UIColor cyanColor]];
//        cell.labelSurfaceProgress.frame.size.width=(30/100)*cell.labelBottomProgress.frame.size.width;
        
        _cell=cell;
        

    }
    if (indexPath.section==1) {
        HT_Par_MainTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellMain forIndexPath:indexPath];
        cell.imageVTop.image=[UIImage imageNamed:@"1"];
        cell.labelDate.text=@"10-10";
        cell.LabelTitle.text=@"2222222222222222222";
        [cell.ButtonGo setTitle:@"我要发起" forState:UIControlStateNormal];
        [cell.ButtonGo setBackgroundColor:[UIColor redColor]];
        _cell=cell;
        
    }
    if (indexPath.section==2) {
        HT_Par_MainTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellMain forIndexPath:indexPath];
        cell.imageVTop.image=[UIImage imageNamed:@"1"];
        cell.labelDate.text=@"10-10";
        cell.LabelTitle.text=@"3333333333333";
        [cell.ButtonGo setTitle:@"我要认购" forState:UIControlStateNormal];
        [cell.ButtonGo setBackgroundColor:[UIColor yellowColor]];
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

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
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
