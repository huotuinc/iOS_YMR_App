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
#import "UserInfo.h"

#import "MJRefresh.h"
#import "UIScrollView+MJRefresh.h"


static NSString *cellIMain = @"cellIMain";
@interface HT_InformationViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) NSString *searchKey;

@property (nonatomic, strong) NSMutableArray *shareList;

@property (nonatomic, strong) UserInfo *user;

@end

@implementation HT_InformationViewController{
    UITableView *_tableView;
    HT_Par_SearchCView *_topView;//搜索框
    HT_Infor_BottomTabBarCView *_bottomView;
    UIView *_clearView;//用于添加imageVShare的tap事件
    NSNumber * _goWhere;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:NO]; 
    self.navigationController.navigationBar.translucent=NO;
    [self changeNavigationBarLineHidden:NO];
    
    NSString * path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *fileName = [path stringByAppendingPathComponent:WeiXinUserInfo];
    self.user = [NSKeyedUnarchiver unarchiveObjectWithFile:fileName];
    
    [_tableView registerNib:[UINib nibWithNibName:@"HT_Infor_MainTableViewCell" bundle:nil]forCellReuseIdentifier:cellIMain];
    [self createBarButtonItem];
    
    [self getNewShareList];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor cyanColor];
    self.shareList = [NSMutableArray array];
    

    
    [self setupRefresh];
    
    
//    [self createTopView];
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
-(void)createNavgationBarTitle{
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 44)];
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.font = [UIFont boldSystemFontOfSize:FONT_SIZE(32)];
    titleLabel.textColor = [UIColor blackColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.text = @"爱美容";
    self.navigationItem.titleView = titleLabel;
}
- (void)setupRefresh
{
    
    
    MJRefreshNormalHeader * headRe = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(getNewShareList)];
    _tableView.mj_header = headRe;
    // 1.下拉刷新(进入刷新状态就会调用self的headerRereshing)
    //    [self.tableView addHeaderWithTarget:self action:@selector(getNewData)];
    //#warning 自动刷新(一进入程序就下拉刷新)
    //    [self.tableView headerBeginRefreshing];
    // 设置文字(也可以不设置,默认的文字在MJRefreshConst中修改)
    //    self.tableView.headerPullToRefreshText = @"下拉可以刷新了";
    //    self.tableView.headerReleaseToRefreshText = @"松开马上刷新了";
    //    self.tableView.headerRefreshingText = @"正在刷新最新数据,请稍等";
    
    // 2.上拉加载更多(进入刷新状态就会调用self的footerRereshing)
    
    MJRefreshAutoNormalFooter * Footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(getMoreShareList)];
    _tableView.mj_footer = Footer;
    
//        [_tableView addFooterWithTarget:self action:@selector(getMoreGoodList)];
    
    
}

/**
 *  下拉刷新
 */
- (void)getNewShareList {
    
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    dic[@"lastId"] = @0;
    dic[@"key"] = self.searchKey;
    dic[@"userId"]= self.user.userId;
    
    [UserLoginTool loginRequestGet:@"searchShareList" parame:dic success:^(id json) {
        
        LWLog(@"%@",json);
        
        if ([json[@"systemResultCode"] intValue] == 1 && [json[@"resultCode"] intValue] == 1) {
            
            NSArray *temp = [InformationModel objectArrayWithKeyValuesArray:json[@"resultData"][@"list"]];
            
            [self.shareList removeAllObjects];
            
            [self.shareList addObjectsFromArray:temp];
            
            [_tableView reloadData];
        }
        [_tableView.mj_header endRefreshing];
        
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
    dic[@"userId"]= self.user.userId;
    
    
    
    [UserLoginTool loginRequestGet:@"searchShareList" parame:dic success:^(id json) {
        
        LWLog(@"%@",json);
        
        if ([json[@"systemResultCode"] intValue] == 1 && [json[@"resultCode"] intValue] == 1) {
            
            NSArray *temp = [InformationModel objectArrayWithKeyValuesArray:json[@"resultData"][@"list"]];
            
            [self.shareList addObjectsFromArray:temp];
            
            [_tableView reloadData];
        }
        [_tableView.mj_footer endRefreshing];
    } failure:^(NSError *error) {
        LWLog (@"%@",error);
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
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WITH , SCREEN_HEIGHT-64-SCREEN_HEIGHT/1100*(90)) style:UITableViewStyleGrouped];
    NSLog(@"**************%f**********",_bottomView.frame.size.height);
    _tableView.delegate=self;
    _tableView.dataSource=self;
    _tableView.backgroundColor = COLOR_BACK_MAIN;
    _tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableView];
    [self setupRefresh];
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
    _bottomView.imageVSearch.userInteractionEnabled=YES;
    UITapGestureRecognizer * tapB = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapTheSearchView)];
    [_bottomView.imageVSearch addGestureRecognizer:tapB];
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
    HT_Infor_ShareViewController *share=[[HT_Infor_ShareViewController alloc]init];
    [self.navigationController pushViewController:share animated:YES];
}

#pragma mark UITableViewDelegate
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    HT_Infor_MainTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIMain forIndexPath:indexPath];
    if (_shareList.count != 0) {
        InformationModel *model =_shareList[indexPath.section];
        if (model.top==YES) {
            cell.imageVState.image=[UIImage imageNamed:@"zhiding"];
        }
        cell.labelDate.text=[self changeTheTimeStamps:(NSNumber *)model.time];
        cell.labelNice.text=[NSString stringWithFormat:@"%@",model.praiseQuantity];
        cell.labelShare.text=[NSString stringWithFormat:@"%@",model.relayScore];
        cell.labelComment.text=[NSString stringWithFormat:@"%@",model.commentQuantity];
        cell.labelScore.attributedText=[self GetAttributedString:[NSString stringWithFormat:@"转发得%@分",model.relayScore] withKeyWord:[NSString stringWithFormat:@"%@分",model.relayScore]  KeyWordColor:COLOR_BUTTON_RED];
        cell.labelCount.text=[NSString stringWithFormat:@"%@个赞",model.pid];
        cell.labelContent.text=model.content;
        cell.labelTitle.text = model.title;
        [cell.imageVMain sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",model.img]] placeholderImage:[UIImage imageNamed:@""]];
        
        [cell.imageVHead sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",model.userHeadUrl]] placeholderImage:[UIImage imageNamed:@""]];
    }
    
    
    cell.backgroundColor=COLOR_BACK_MAIN;
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
//    return _shareList.count;
    return 3;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return SCREEN_HEIGHT/1150*635 ;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    InformationModel *model =_shareList[indexPath.section];
    _goWhere=model.shareType.value;
    NSLog(@"------------=======%@",_goWhere);
//    NSLog(@"/////////// %@ \\\\\\\\",[NSNumber numberWithInt:1]);
//    if ([_goWhere isEqualToNumber:[NSNumber numberWithInt:0]]||[_goWhere isEqualToNumber:[NSNumber numberWithInt:2]]) {
//        HT_Infor_NewsViewController *news=[[HT_Infor_NewsViewController alloc]init];
//        [self.navigationController pushViewController:news animated:YES];
        HT_Infor_CommentViewController *comment=[[HT_Infor_CommentViewController alloc]init];
        comment.shareId=model.pid;
    if (model.praise==1) {
        comment.NICE=YES;
        
    }else{
        comment.NICE=NO;

    }
//        NSLog(@"%f",comment.shareId);
        [self.navigationController pushViewController:comment animated:YES];
//    }
//    
//    if ([_goWhere isEqualToNumber:[NSNumber numberWithInt:1]]||[_goWhere isEqualToNumber:[NSNumber numberWithInt:3]]) {
//        HT_Infor_GroupViewController *group=[[HT_Infor_GroupViewController alloc]init];
//        [self.navigationController pushViewController:group animated:YES];
//    }
//    if ([_goWhere isEqualToNumber:[NSNumber numberWithInt:2]]) {
//        HT_Infor_GroupViewController *group=[[HT_Infor_GroupViewController alloc]init];
//        [self.navigationController pushViewController:group animated:YES];
//    }
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
#pragma theMethodInTableViewCell

/**
 *  创建关键字高亮字体颜色的字符串
 *
 *  @param strText    原内容
 *  @param strKeyWord 关键字
 *  @param Color      关键字颜色
 *
 *  @return
 */
-(NSMutableAttributedString*)GetAttributedString:(NSString*)strText withKeyWord:(NSString*)strKeyWord KeyWordColor:(UIColor*)Color
{
    if (strText==nil || strKeyWord==nil || Color==nil)
    {
        return nil;
    }
    
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:strText];
    if ( [strKeyWord isEqualToString:@""] )
    {
        return str;
    }
    
    NSRange range = [strText rangeOfString:strKeyWord];
    if (range.location == NSNotFound)
    {
        return str;
    }
    
    [str addAttribute:NSForegroundColorAttributeName value:Color range:range];
    
    return str;
}
/**
 *  13位时间戳转为正常时间(可设置样式)
 *
 *  @param time 时间戳
 *
 *  @return
 */
-(NSString *)changeTheTimeStamps:(NSNumber *)time{
    //实例化一个NSDateFormatter对象
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //设定时间格式,这里可以设置成自己需要的格式
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    //将13位时间戳转为正常时间格式
    NSString * str = [dateFormatter stringFromDate:[NSDate dateWithTimeIntervalSince1970:[time longLongValue]/1000]];
    return str;
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
