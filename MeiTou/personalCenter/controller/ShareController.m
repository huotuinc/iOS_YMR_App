//
//  ShareController.m
//  MeiTou
//
//  Created by 刘琛 on 15/12/18.
//  Copyright © 2015年 车. All rights reserved.
//

#import "ShareController.h"
#import "ShareCell.h"
#import "selectView.h"
#import "UserInfo.h"
#import "getUserShareListModel.h"
@interface ShareController ()<UITableViewDelegate,UITableViewDataSource,SelectViewDelegate>

@property (nonatomic, strong) selectView *selectV;

@property (nonatomic, strong) UIButton *titleButton;

@property (nonatomic, strong) NSMutableArray *shareList;
@property (nonatomic, strong) UserInfo *user;

@end

@implementation ShareController

static NSString *sharIdentify = @"shareIdentify";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createBarButtonItem];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"ShareCell" bundle:nil] forCellReuseIdentifier:sharIdentify];
    
    self.selectV = [[selectView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WITH, 111) AndSelectTag:3];
    self.selectV.delegate = self;
    self.selectV.hidden = YES;
    self.tableView.backgroundColor = COLOR_LINE_B;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.selectV];
    
    
    _titleButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _titleButton.frame = CGRectMake(0, 0, 100, 30);
    [_titleButton setImage:[UIImage imageNamed:@"heda"] forState:UIControlStateNormal];
    [_titleButton setTitle:@"我的转发" forState:UIControlStateNormal];
    [_titleButton layoutIfNeeded];
    [_titleButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_titleButton setTitleEdgeInsets:UIEdgeInsetsMake(0, -16, 0, 16)];
    [_titleButton setImageEdgeInsets:UIEdgeInsetsMake(0, _titleButton.titleLabel.bounds.size.width, 0, -_titleButton.titleLabel.bounds.size.width)];
    self.navigationItem.titleView = _titleButton;
    [_titleButton bk_whenTapped:^{
        if (self.selectV.hidden) {
            [_titleButton setImage:[UIImage imageNamed:@"hehe"] forState:UIControlStateNormal];
            self.selectV.hidden = NO;
        }else {
            [_titleButton setImage:[UIImage imageNamed:@"heda"] forState:UIControlStateNormal];
            self.selectV.hidden = YES;
        }
        
    }];
    
    
}
/**
 *
 */
-(void)clickLightButton{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)clickRightButton{
    
}



/**
 *  下拉刷新
 */
- (void)getUserShareList {
    
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    dic[@"lastId"] = @0;
    dic[@"userId"]= self.user.userId;
    
    [UserLoginTool loginRequestGet:@"getUserShareList" parame:dic success:^(id json) {
        
        LWLog(@"%@",json);
        
        if ([json[@"systemResultCode"] intValue] == 1 && [json[@"resultCode"] intValue] == 1) {
            
            NSArray *temp = [getUserShareListModel objectArrayWithKeyValuesArray:json[@"resultData"][@"list"]];
            
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
- (void)getMoreUserShareList {
    
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    getUserShareListModel *info = [self.shareList lastObject];
    dic[@"lastId"] = info.pId;
    dic[@"userId"]= self.user.userId;
    
    
    
    [UserLoginTool loginRequestGet:@"getUserShareList" parame:dic success:^(id json) {
        
        LWLog(@"%@",json);
        
        if ([json[@"systemResultCode"] intValue] == 1 && [json[@"resultCode"] intValue] == 1) {
            
            NSArray *temp = [getUserShareListModel objectArrayWithKeyValuesArray:json[@"resultData"][@"list"]];
            
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

#pragma mark tableView 
//@property (weak, nonatomic) IBOutlet UILabel *title;
//@property (weak, nonatomic) IBOutlet UILabel *time;
//@property (weak, nonatomic) IBOutlet UILabel *integral;
//@property (weak, nonatomic) IBOutlet UIButton *success;
//@property (weak, nonatomic) IBOutlet UIImageView *titleImage;
//@property (weak, nonatomic) IBOutlet UILabel *details;
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    ShareCell *cell = [tableView dequeueReusableCellWithIdentifier:sharIdentify forIndexPath:indexPath];
    
    getUserShareListModel *model=_shareList[indexPath.row];
    [cell.titleImage sd_setImageWithURL:[NSURL URLWithString:model.img]];
    cell.time.text=[self changeTheTimeStamps:model.time];
    cell.integral.text=[NSString stringWithFormat:@"%@积分",model.integral];;
    cell.title.text=model.title;
    cell.details.text=model.intro;
    if ([model.shareType.value isEqualToNumber:[NSNumber numberWithInteger:0]]) {
        cell.success.titleLabel.text=@"审核中";
        cell.success.backgroundColor=COLOR_BUTTON_RED;
    }else if ([model.shareType.value isEqualToNumber:[NSNumber numberWithInteger:1]]) {
        cell.success.titleLabel.text=@"通过";
        cell.success.backgroundColor=[UIColor redColor];
    }else if ([model.shareType.value isEqualToNumber:[NSNumber numberWithInteger:0]]) {
        cell.success.titleLabel.text=@"失败";
        cell.success.backgroundColor=COLOR_BACK_MAIN;
    }
    return cell;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 300;
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
