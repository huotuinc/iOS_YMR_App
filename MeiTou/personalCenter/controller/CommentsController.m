//
//  CommentsController.m
//  MeiTou
//
//  Created by 刘琛 on 15/12/8.
//  Copyright © 2015年 车. All rights reserved.
//

#import "CallMeController.h"
#import "CommentsController.h"
#import "PraiseController.h"
#import "CommentsCell.h"
#import "selectView.h"
#import <UIBarButtonItem+BlocksKit.h>
#import "getCommentListModel.h"
#import "UserInfo.h"

@interface CommentsController ()<UITableViewDataSource,UITableViewDelegate,SelectViewDelegate>

@property (nonatomic, strong) selectView *selectV;

@property (nonatomic, strong) UIButton *titleButton;

@property (nonatomic, strong) NSMutableArray *commentList;
@property (nonatomic, strong) UserInfo *user;


@end

@implementation CommentsController

static NSString *commentIdentify = @"commentsIdentify";

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createBarButtonItem];
    [self.tableView registerNib:[UINib nibWithNibName:@"CommentsCell" bundle:nil] forCellReuseIdentifier:commentIdentify];
    
    self.selectV = [[selectView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WITH, 111) AndSelectTag:0];
    self.selectV.delegate = self;
    self.selectV.hidden = YES;
    self.tableView.backgroundColor = COLOR_BACK_MAIN;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.selectV];
    
    NSString * path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *fileName = [path stringByAppendingPathComponent:WeiXinUserInfo];
    self.user = [NSKeyedUnarchiver unarchiveObjectWithFile:fileName];
    
    [self getCommentList];
    
    _titleButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _titleButton.frame = CGRectMake(0, 0, 100, 30);
    [_titleButton setImage:[UIImage imageNamed:@"heda"] forState:UIControlStateNormal];
    [_titleButton setTitle:@"我的评论" forState:UIControlStateNormal];
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
 *  下拉刷新
 */
- (void)getCommentList {
    
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    dic[@"lastId"] = @0;
    dic[@"userId"]= self.user.userId;
    
    [UserLoginTool loginRequestGet:@"getCommentList" parame:dic success:^(id json) {
        
        LWLog(@"%@",json);
        
        if ([json[@"systemResultCode"] intValue] == 1 && [json[@"resultCode"] intValue] == 1) {
            
            NSArray *temp = [getCommentListModel objectArrayWithKeyValuesArray:json[@"resultData"][@"list"]];
            
            [self.commentList removeAllObjects];
            
            [self.commentList addObjectsFromArray:temp];
            
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
- (void)getMoreCommentList {
    
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    getCommentListModel *com = [self.commentList lastObject];
    dic[@"lastId"] = com.pId;
    dic[@"userId"]= self.user.userId;
    
    
    
    [UserLoginTool loginRequestGet:@"getCommentList" parame:dic success:^(id json) {
        
        LWLog(@"%@",json);
        
        if ([json[@"systemResultCode"] intValue] == 1 && [json[@"resultCode"] intValue] == 1) {
            
            NSArray *temp = [getCommentListModel objectArrayWithKeyValuesArray:json[@"resultData"][@"list"]];
            
            [self.commentList addObjectsFromArray:temp];
            
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}

/**
 *
 */
-(void)clickLightButton{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)clickRightButton{
    
}


#pragma mark tableView

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 159 + 26;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}
//
//@property (weak, nonatomic) IBOutlet UIImageView *userLogo;
//@property (weak, nonatomic) IBOutlet UILabel *userName;
//
//@property (weak, nonatomic) IBOutlet UILabel *time;
//
//@property (weak, nonatomic) IBOutlet UILabel *detail;
//
//@property (weak, nonatomic) IBOutlet UIImageView *articleLogo;
//
//@property (weak, nonatomic) IBOutlet UILabel *articleTitle;
//
//@property (weak, nonatomic) IBOutlet UILabel *articleDetail;
//
//@property (weak, nonatomic) IBOutlet UIButton *reback;
//
//@property (weak, nonatomic) IBOutlet UIButton *forwarding;
//@property (weak, nonatomic) IBOutlet UIButton *comments;
//@property (weak, nonatomic) IBOutlet UIButton *praise;

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CommentsCell *cell = [tableView dequeueReusableCellWithIdentifier:commentIdentify forIndexPath:indexPath];
    getCommentListModel *model=_commentList[indexPath.row];
    [cell.userLogo sd_setImageWithURL:[NSURL URLWithString:model.userHeadUrl]];
    [cell.articleLogo sd_setImageWithURL:[NSURL URLWithString:model.img]];
    cell.time.text=[self changeTheTimeStamps:model.commentTime];
    cell.detail.text=model.commentComment;
    cell.articleTitle.text=model.title;
    cell.articleDetail.text=model.intro;
    [cell.reback bk_whenTapped:^{
        LWLog(@"点击了回复");
    }];
    [cell.forwarding bk_whenTapped:^{
        LWLog(@"点击了回1");
    }];
    [cell.comments bk_whenTapped:^{
        LWLog(@"点击了回2");
    }];
    [cell.praise bk_whenTapped:^{
        LWLog(@"点击了回3");
    }];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark selectView 

- (void)selectClick:(NSInteger)tag {
    
    UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    self.selectV.hidden = YES;
    [self.titleButton setImage:[UIImage imageNamed:@"heda"] forState:UIControlStateNormal];
    //点击后转跳到相应页面
    if (tag == 2) {
        CallMeController *comment = [story instantiateViewControllerWithIdentifier:@"CallMeController"];
        [self.navigationController pushViewController:comment animated:YES];
        
    }else if (tag == 1) {
        PraiseController *praise = [story instantiateViewControllerWithIdentifier:@"PraiseController"];
        [self.navigationController pushViewController:praise animated:YES];
    }else if (tag == 3) {
        
        
    }
}

- (void)cannelClick {
    [self.titleButton setImage:[UIImage imageNamed:@"hehe"] forState:UIControlStateNormal];
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

@end
