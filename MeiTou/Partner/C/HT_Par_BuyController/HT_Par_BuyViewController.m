//
//  HT_Par_BuyViewController.m
//  MeiTou
//
//  Created by che on 15/12/2.
//  Copyright © 2015年 车. All rights reserved.
//

#import "HT_Par_BuyViewController.h"
#import "HT_Par_BuyListViewController.h"
#import "HT_Par_BoundPhoneViewController.h"
#import "HT_HomePage_NavTitleCVIew.h"
#import "HT_Par_MainTopView.h"
#import "HT_Par_BuyHeaderView.h"
#import "HT_Par_BuyBottomView.h"
#import "HT_Par_BuyMainTableViewCell.h"


static NSString *cellBuy = @"cellBuy";

@interface HT_Par_BuyViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation HT_Par_BuyViewController{
    UITableView *_tableView;
    UIView *_topView;//顶部视图
    UIView *_headerView;//_tableV 的headerV
    UIView *_bottomView;//底部视图
    UIImageView *_imageV;
    HT_HomePage_NavTitleCVIew *_navView;
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden=NO;
    self.navigationController.navigationBar.translucent = NO;
    

    [self createBarButtonItem];
    
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createNavTitleView];
    [self createHeadView];
    [self createTableView];
    [self createBottomView];
    
//    NSLog(@"*****************************");
//    NSLog(@"%f",SCREEN_HEIGHT/1100*1000);
 

    
    
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
    _navView.frame=CGRectMake(0, 0, 175, 44);
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
    NSArray *nib=[[NSBundle mainBundle]loadNibNamed:@"HT_Par_BuyHeaderView" owner:nil options:nil];
    HT_Par_BuyHeaderView *headerView=[nib firstObject];
    headerView.frame=CGRectMake(0, 0, SCREEN_WITH, SCREEN_HEIGHT/1100*250);
    _headerView=headerView;
}

-(void)createBottomView{
    NSArray *nib=[[NSBundle mainBundle]loadNibNamed:@"HT_Par_BuyBottomView" owner:nil options:nil];
    HT_Par_BuyBottomView *bottomView=[nib firstObject];
    bottomView.frame=CGRectMake(0,SCREEN_HEIGHT-(SCREEN_HEIGHT/1100*120)-64, SCREEN_WITH, SCREEN_HEIGHT/1100*120);
    [bottomView.buttonSubscription addTarget:self action:@selector(clickButtonSubscription) forControlEvents:UIControlEventTouchUpInside];
    
       _bottomView=bottomView;
    [self.view insertSubview:_bottomView aboveSubview:_tableView];
    
    [self.view addSubview:_bottomView];
    
    
}
-(void)createTableView{
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WITH , SCREEN_HEIGHT-_bottomView.frame.size.height) style:UITableViewStylePlain];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    _tableView.tableHeaderView=_headerView;
    _tableView.backgroundColor=COLOR_BACK_MAIN;
    [_tableView registerNib:[UINib nibWithNibName:@"HT_Par_BuyMainTableViewCell" bundle:nil]forCellReuseIdentifier:cellBuy];
    _tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    _tableView.showsVerticalScrollIndicator =NO;
    [self.view addSubview:_tableView];
}
/**
 *  tap事件
 */

-(void)tapTheListView{
    HT_Par_BuyListViewController *list=[[HT_Par_BuyListViewController alloc]init];
    [self.navigationController pushViewController:list animated:YES];
}
-(void)clickButtonSubscription{
    HT_Par_BoundPhoneViewController *auth=[[HT_Par_BoundPhoneViewController alloc]init];
    [self.navigationController pushViewController:auth animated:YES];

}
#pragma mark UITableViewDelegate
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
   
    HT_Par_BuyMainTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellBuy forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
//    cell.labelTitle.text=
//    cell.labelContent.text=
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return [self sizeToFont:[UIFont systemFontOfSize:FONT_SIZE(24)] WithWidth:SCREEN_WITH lineWidth:1].height;

}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
   
}
/**
 *  计算label的高度
 *
 *  @param font      字体大小
 *  @param width     label宽度
 *  @param lineWidth 行间距
 *
 *  @return size
 */
-(CGSize)sizeToFont:(UIFont *)font WithWidth:(CGFloat)width lineWidth:(CGFloat)lineWidth{
     NSString *str=@"大事了多久啊了解到哦啊简单,阿斯大家阿斯哦降低啊是假的哦啊,但撒娇哦啊是假的哦撒娇的哦爱激动,sdajidjasoidjasjdaos,大事了多久啊了解到哦啊简单,阿斯大家阿斯哦降低啊是假的哦啊,但撒娇哦啊是假的哦撒娇的哦爱激动,sdajidjasoidjasjdaos,大事了多久啊了解到哦啊简单,阿斯大家阿斯哦降低啊是假的哦啊,但撒娇哦啊是假的哦撒娇的哦爱激动,sdajidjasoidjasjdaos,大事了多久啊了解到哦啊简单,阿斯大家阿斯哦降低啊是假的哦啊,但撒娇哦啊是假的哦撒娇的哦爱激动,sdajidjasoidjasjdaos,大事了多久啊了解到哦啊简单,阿斯大家阿斯哦降低啊是假的哦啊,但撒娇哦啊是假的哦撒娇的哦爱激动,sdajidjasoidjasjdaos,大事了多久啊了解到哦啊简单,阿斯大家阿斯哦降低啊是假的哦啊,但撒娇哦啊是假的哦撒娇的哦爱激动,sdajidjasoidjasjdaos,大事了多久啊了解到哦啊简单,阿斯大家阿斯哦降低啊是假的哦啊,但撒娇哦啊是假的哦撒娇的哦爱激动,sdajidjasoidjasjdaos,大事了多久啊了解到哦啊简单,阿斯大家阿斯哦降低啊是假的哦啊,但撒娇哦啊是假的哦撒娇的哦爱激动,sdajidjasoidjasjdaos,大事了多久啊了解到哦啊简单,阿斯大家阿斯哦降低啊是假的哦啊,但撒娇哦啊是假的哦撒娇的哦爱激动,sdajidjasoidjasjdaos,大事了多久啊了解到哦啊简单,阿斯大家阿斯哦降低啊是假的哦啊,但撒娇哦啊是假的哦撒娇的哦爱激动,sdajidjasoidjasjdaos,大事了多久啊了解到哦啊简单,阿斯大家阿斯哦降低啊是假的哦啊,但撒娇哦啊是假的哦撒娇的哦爱激动,sdajidjasoidjasjdaos,大事了多久啊了解到哦啊简单,阿斯大家阿斯哦降低啊是假的哦啊,但撒娇哦啊是假的哦撒娇的哦爱激动,sdajidjasoidjasjdaos,大事了多久啊了解到哦啊简单,阿斯大家阿斯哦降低啊是假的哦啊,但撒娇哦啊是假的哦撒娇的哦爱激动,sdajidjasoidjasjdaos,大事了多久啊了解到哦啊简单,阿斯大家阿斯哦降低啊是假的哦啊,但撒娇哦啊是假的哦撒娇的哦爱激动,sdajidjasoidjasjdaos,大事了多久啊了解到哦啊简单,阿斯大家阿斯哦降低啊是假的哦啊,但撒娇哦啊是假的哦撒娇的哦爱激动,sdajidjasoidjasjdaos,大事了多久啊了解到哦啊简单,阿斯大家阿斯哦降低啊是假的哦啊,但撒娇哦啊是假的哦撒娇的哦爱激动,sdajidjasoidjasjdaos,大事了多久啊了解到哦啊简单,阿斯大家阿斯哦降低啊是假的哦啊,但撒娇哦啊是假的哦撒娇的哦爱激动,sdajidjasoidjasjdaos,好烦地沟还是的价格哦都是减肥企鹅万恶我去问额外企鹅我去恶趣味额前往俄我去恶趣味额前往俄千万额外企鹅去额外企鹅我去恶趣味好烦地沟还是的价格哦都是减肥企鹅万恶我去问额外企鹅我去恶趣味额前往俄我去恶趣味额前往俄千万额外企鹅去额外企鹅我去恶趣味好烦地沟还是的价格哦都是减肥企鹅万恶我去问额外企鹅我去恶趣味额前往俄我去恶趣味额前往俄千万额外企鹅去额外企鹅我去恶趣味好烦地沟还是的价格哦都是减肥企鹅万恶我去问额外企鹅我去恶趣味额前往俄我去恶趣味额前往俄千万额外企鹅去额外企鹅我去恶趣味好烦地沟还是的价格哦都是减肥企鹅万恶我去问额外企鹅我去恶趣味额前往俄我去恶趣味额前往俄千万额外企鹅去额外企鹅我去恶趣味好烦地沟还是的价格哦都是减肥企鹅万恶我去问额外企鹅我去恶趣味额前往俄我去恶趣味额前往俄千万额外企鹅去额外企鹅我去恶趣味哈哈哈哈哈哈哈哈哈哈哈额额额额额";
    
    NSMutableParagraphStyle *sy=[NSMutableParagraphStyle new];
    [sy setLineSpacing:lineWidth];
    CGSize size;
    NSDictionary *dic=[NSDictionary dictionaryWithObjectsAndKeys:font,NSFontAttributeName,sy,NSParagraphStyleAttributeName, nil];
    size=[str boundingRectWithSize:CGSizeMake(SCREEN_WITH, MAXFLOAT) options:NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:dic context:nil].size;
    return size;
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
