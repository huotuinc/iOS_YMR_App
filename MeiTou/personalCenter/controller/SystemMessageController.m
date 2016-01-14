//
//  SystemMessageController.m
//  MeiTou
//
//  Created by 刘琛 on 15/12/8.
//  Copyright © 2015年 车. All rights reserved.
//

#import "SystemMessageController.h"
#import "SystemMessageCell.h"
#import "UserInfo.h"
@interface SystemMessageController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *shareList;
@property (nonatomic, strong) UserInfo *user;

@end



@implementation SystemMessageController

static NSString *SysIndentify = @"SysIndentify";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createBarButtonItem];
    
    self.tableView.backgroundColor = [UIColor colorWithWhite:0.792 alpha:1.000];
    [self.tableView registerNib:[UINib nibWithNibName:@"SystemMessageCell" bundle:nil] forCellReuseIdentifier:SysIndentify];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
 *  下拉刷新
 */
//- (void)getCommentList {
//    
//    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
//    dic[@"lastId"] = @0;
//    dic[@"list"] = self.searchKey;
//    dic[@"userId"]= self.user.userId;
//    
//    [UserLoginTool loginRequestGet:@"getCommentList" parame:dic success:^(id json) {
//        
//        LWLog(@"%@",json);
//        
//        if ([json[@"systemResultCode"] intValue] == 1 && [json[@"resultCode"] intValue] == 1) {
//            
//            NSArray *temp = [getCommentListModel objectArrayWithKeyValuesArray:json[@"resultData"][@"list"]];
//            
//            [self.commentList removeAllObjects];
//            
//            [self.commentList addObjectsFromArray:temp];
//            
//            [_tableView reloadData];
//        }
//        [_tableView.mj_header endRefreshing];
//        
//    } failure:^(NSError *error) {
//        LWLog(@"%@",error);
//    }];
//    
//}
//
///**
// *  上拉加载更多
// */
//- (void)getMoreCommentList {
//    
//    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
//    dic[@"key"] = self.searchKey;
//    getCommentListModel *info = [self.shareList lastObject];
//    dic[@"lastId"] = info.pid;
//    dic[@"userId"]= self.user.userId;
//    
//    
//    
//    [UserLoginTool loginRequestGet:@"getCommentList" parame:dic success:^(id json) {
//        
//        LWLog(@"%@",json);
//        
//        if ([json[@"systemResultCode"] intValue] == 1 && [json[@"resultCode"] intValue] == 1) {
//            
//            NSArray *temp = [getCommentListModel objectArrayWithKeyValuesArray:json[@"resultData"][@"list"]];
//            
//            [self.commentList addObjectsFromArray:temp];
//            
//            [_tableView reloadData];
//        }
//        [_tableView.mj_footer endRefreshing];
//    } failure:^(NSError *error) {
//        LWLog (@"%@",error);
//    }];
//    
//}

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



#pragma mark tableView 

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SystemMessageCell *cell = [tableView dequeueReusableCellWithIdentifier:SysIndentify forIndexPath:indexPath];
    return cell;
}

@end
