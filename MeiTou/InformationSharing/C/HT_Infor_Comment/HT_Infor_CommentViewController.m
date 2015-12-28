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
#import "CommentModel.h"
#import "UserInfo.h"


static NSString *cellIComment=@"cellIComment";
@interface HT_Infor_CommentViewController ()<UITableViewDelegate,UITableViewDataSource,UIActionSheetDelegate>

@property (nonatomic, strong) NSMutableArray *commentList;

@property (nonatomic, strong) UserInfo *user;

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
    
    [self getNewShareList];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor cyanColor];
    [self createHeadView];
    [self createFooterView];
    [self createTableView];
    [self createBottomView];
    
    
    NSString * path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *fileName = [path stringByAppendingPathComponent:WeiXinUserInfo];
    self.user = [NSKeyedUnarchiver unarchiveObjectWithFile:fileName];
}


#pragma mark 网络请求列表数据
/**
 *  下拉刷新
 */
- (void)getNewShareList {
    
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    dic[@"lastId"] = @0;
    dic[@"shareId"] = @2;
#warning 修改shareId
    [UserLoginTool loginRequestGet:@"searchShareCommentList" parame:dic success:^(id json) {
        
        LWLog(@"%@",json);
        
        if ([json[@"systemResultCode"] intValue] == 1 && [json[@"resultCode"] intValue] == 1) {
            [self.commentList removeAllObjects];
            
            NSArray *temp = [CommentModel objectArrayWithKeyValuesArray:json[@"resultData"][@"list"]];
            
            
            [self.commentList addObjectsFromArray:temp];
            
            
            [_tableView reloadData];
        }
        
    } failure:^(NSError *error) {
        LWLog(@"%@",error);
    }];
    
}

/**
 *  上拉加载更多
 */
- (void)getMoreShareList {
    
    CommentModel *model = [self.commentList lastObject];
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    dic[@"lastId"] = model.pid;
    dic[@"shareId"] = @2;
#warning 修改shareId
    [UserLoginTool loginRequestGet:@"searchShareCommentList" parame:dic success:^(id json) {
        
        LWLog(@"%@",json);
        
        if ([json[@"systemResultCode"] intValue] == 1 && [json[@"resultCode"] intValue] == 1) {
            
            NSArray *temp = [CommentModel objectArrayWithKeyValuesArray:json[@"resultData"][@"list"]];
            
            
            [self.commentList addObjectsFromArray:temp];
            
            [_tableView reloadData];
        }
        
    } failure:^(NSError *error) {
        NSLog(@"%@",error);
    }];
    
}

#pragma mark  网络请求回复评论

-(void)addCommentWithInformation {
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    dic[@"userId"] = self.user.userId;
    dic[@"shareId"] = @2;
    dic[@"content"] =  @"哈哈哈哈哈哈哈哈哈哈哈哈";
#warning 修改shareId 以及content
    [UserLoginTool loginRequestPostWithFile:@"addComment" parame:dic success:^(id json) {
        LWLog(@"%@",json);
        if ([json[@"systemResultCode"] intValue] == 1 && [json[@"resultCode"] intValue] == 1) {
            LWLog(@"%@",json[@"systemResultDescription"]);
        }else {
            LWLog(@"%@",json[@"systemResultDescription"]);
        }
        
    } failure:^(NSError *error) {
        
    } withFileKey:nil];
    
    
}

#pragma mark 网络请求增加评论

- (void)addReplyWithComment {
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    dic[@"userId"] = self.user.userId;
    dic[@"parentId"] = @1;
    dic[@"content"] = @"啊啊啊啊啊啊啊";
#warning 修改parentId 以及content
    [UserLoginTool loginRequestPostWithFile:@"addReply" parame:dic success:^(id json) {
        LWLog(@"%@",json);
        if ([json[@"systemResultCode"] intValue] == 1 && [json[@"resultCode"] intValue] == 1) {
            LWLog(@"%@",json[@"resultDescription"]);
        }else {
            LWLog(@"%@",json[@"systemResultDescription"]);
        }
    } failure:^(NSError *error) {
        LWLog(@"%@",error);
    } withFileKey:nil];
}

#pragma mark 为文章点赞

- (void)clickPraiseWithShare {
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    dic[@"userId"] = self.user.userId;
    dic[@"parentId"] = @1;
    dic[@"content"] = @"啊啊啊啊啊啊啊";
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

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex== 0) {
        
    }else if(buttonIndex == 1){
        
#warning 回复评论
        [self addCommentWithInformation];
        
    }else if(buttonIndex == 2){
#warning 对评论进行回复
        [self addReplyWithComment];
    }else{
        
    }
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
            }
            if(i==1){
                label.text=@"  东东回复小丽 :但是减肥各地舒服";
            }
            label.backgroundColor=[UIColor clearColor];
            label.font=[UIFont systemFontOfSize:FONT_SIZE(26)];
            label.textColor=COLOR_TEXT_DATE;
            [cell.viewBase addSubview:label];
        }
    }
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    
    
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
    
    UIActionSheet *sheet  = [[UIActionSheet alloc]initWithTitle:nil delegate: self  cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"复制",@"回复",@"举报", nil];
    [sheet showInView:self.view];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return SCREEN_HEIGHT/1150*190;
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
