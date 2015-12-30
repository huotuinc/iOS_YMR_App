//
//  HT_Par_IteViewController.m
//  MeiTou
//
//  Created by che on 15/12/3.
//  Copyright © 2015年 车. All rights reserved.
//

#import "HT_Par_IteViewController.h"
#import "HT_Par_IteListViewController.h"
#import "HT_Par_IteResultViewController.h"
#import "HT_Par_IteCooperationViewController.h"
#import "HT_Par_IteOrderViewController.h"

#import "HT_Par_MainTopView.h"
#import "HT_Par_IteProjectDoingHeaderCView.h"
#import "HT_Par_IteProjectDoneHeaderCView.h"
#import "HT_HomePage_NavTitleCVIew.h"
#import "HT_Par_BuyMainTableViewCell.h"
#import "HT_Par_IteBottomCView.h"
#import "LevelUpView.h"
static NSString *cellIte = @"cellIte";

@interface HT_Par_IteViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation HT_Par_IteViewController{
    UITableView *_tableView;
    UIView *_headerView;
    UIView *_bottomView;
    LevelUpView *_levelUpView;
    UIImageView *_imageVTop;
    HT_HomePage_NavTitleCVIew *_navView;
}


-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden=NO;
    self.navigationController.navigationBar.translucent = NO;
    self.view.backgroundColor=COLOR_BACK_MAIN;
    [_tableView registerNib:[UINib nibWithNibName:@"HT_Par_BuyMainTableViewCell" bundle:nil]forCellReuseIdentifier:cellIte];
    [self createBarButtonItem];
    
    
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor whiteColor];
    [self createNavTitleView];
    [self createHeadView];
    [self createTableView];
    [self createBottomView];
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
    NSLog(@"点击了");
    _levelUpView=[[LevelUpView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WITH, SCREEN_HEIGHT)];
    [[UIApplication sharedApplication].keyWindow addSubview:_levelUpView];

}


-(void)createHeadView{
    if (1) {
        NSArray *nib=[[NSBundle mainBundle]loadNibNamed:@"HT_Par_IteProjectDoneHeaderCView" owner:nil options:nil];
        HT_Par_IteProjectDoneHeaderCView *headerView=[nib firstObject];
        headerView.frame=CGRectMake(0, 0, SCREEN_WITH, SCREEN_HEIGHT/1100*250/190*270);
        UITapGestureRecognizer * tapHeadGroup = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapTheHeadGroup)];
        [headerView.viewHeadGroup addGestureRecognizer:tapHeadGroup];
        _headerView=headerView;
        
    }else{
//        NSArray *nib=[[NSBundle mainBundle]loadNibNamed:@"HT_Par_IteProjectDoingHeaderCView" owner:nil options:nil];
//        HT_Par_IteProjectDoingHeaderCView *headerView=[nib firstObject];
//        headerView.frame=CGRectMake(0, 0, SCREEN_WITH, SCREEN_HEIGHT/1100*222);
//        _headerView=headerView;
    
    }
    
}
-(void)createTableView{
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WITH , SCREEN_HEIGHT -SCREEN_HEIGHT/1100*120) style:UITableViewStylePlain];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    _tableView.tableHeaderView=_headerView;
    _tableView.backgroundColor=COLOR_BACK_MAIN;
    _tableView.showsVerticalScrollIndicator =NO;
    [self.view addSubview:_tableView];
    
    
    
}
-(void)createBottomView{
    //    SCREEN_HEIGHT-(SCREEN_HEIGHT/1100*100)
    NSArray *nib=[[NSBundle mainBundle]loadNibNamed:@"HT_Par_IteBottomCView" owner:nil options:nil];
    HT_Par_IteBottomCView *bottomView=[nib firstObject];
    bottomView.frame=CGRectMake(0,SCREEN_HEIGHT-(SCREEN_HEIGHT/1100*120)-64, SCREEN_WITH, SCREEN_HEIGHT/1100*120);
    [bottomView.buttonCooperation addTarget:self action:@selector(clickButtonCooperation) forControlEvents:UIControlEventTouchUpInside];
    [bottomView.buttonOrder addTarget:self action:@selector(clickButtonOrder) forControlEvents:UIControlEventTouchUpInside];
    
    _bottomView=bottomView;
    [self.view addSubview:_bottomView];
//    [self.view bringSubviewToFront:_bottomView];

    
}
/**
 *  tap事件
 */
-(void)tapTheListView{
    HT_Par_IteListViewController *list=[[HT_Par_IteListViewController alloc]init];
    [self.navigationController pushViewController:list animated:YES];
}

-(void)tapTheHeadGroup{
    HT_Par_IteResultViewController *result=[[HT_Par_IteResultViewController alloc]init];
    [self.navigationController pushViewController:result animated:YES];
}
/**
 *  点击事件
 */
-(void)clickButtonCooperation{
    HT_Par_IteCooperationViewController *cooperation=[[HT_Par_IteCooperationViewController alloc]init];
    [self.navigationController pushViewController:cooperation animated:YES];
}
-(void)clickButtonOrder{
    HT_Par_IteOrderViewController *order=[[HT_Par_IteOrderViewController alloc]init];
    [self.navigationController pushViewController:order animated:YES];
}

#pragma mark UITableViewDelegate
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *_cell;
    HT_Par_BuyMainTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIte forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    _cell=cell;
    
    return _cell;
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
