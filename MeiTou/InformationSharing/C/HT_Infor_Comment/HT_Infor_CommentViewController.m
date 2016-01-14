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
#import "HT_Infor_CommentHeaderTableViewCell.h"
#import "HT_Infor_CommentFooterTableViewCell.h"
#import "HT_Infor_CommentTextCView.h"
#import "HT_Infor_CommentReplyCView.h"
#import "HT_Infor_ShareThirdCView.h"

#import "CommentModel.h"
#import "ShareInfoModel.h"
#import "UserInfo.h"


static NSString *cellIComment=@"cellIComment";
static NSString *cellStatus=@"cellStatus";
static NSString *cellFoot=@"cellFoot";
static NSString *cellHead=@"cellHead";




@interface HT_Infor_CommentViewController ()<UITableViewDelegate,UITableViewDataSource,UIActionSheetDelegate>


@property (nonatomic, strong) NSMutableArray *commentList;
@property (nonatomic, strong) NSMutableArray *shareInfo;

@property (nonatomic, strong) UserInfo *user;

@end

@implementation HT_Infor_CommentViewController{
    UITableView *_tableView;
    HT_Infor_CommentHeadCView *_headView;
    HT_Infor_BottomCView *_bottomView;
    
    HT_Infor_CommentReplyCView *_comReplyView;//评论框
    HT_Infor_CommentCellHeaderView *_headerView;
    HT_Infor_ShareThirdCView *_shareThirdView;
    UIView *_footerView;
    HT_Infor_CommentTextCView * _replyView;//回复框
    UIView *_viewBack;
    UIView *_viewBackCom;
    UIView *_viewBackShare;


    
    CGFloat _time;//键盘弹起耗时
    CGFloat _height;//键盘弹起高度

    CGFloat _allCellHeight;//点击cell距离上面的height
    NSNumber *_replyId;//回复id
    NSIndexPath *_cellIndex;
    
    


}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden=NO;
    self.navigationController.navigationBar.translucent=NO;
    //    self.navigationController.navigationBar.barTintColor = [];
    
    NSString * path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *fileName = [path stringByAppendingPathComponent:WeiXinUserInfo];
    self.user = [NSKeyedUnarchiver unarchiveObjectWithFile:fileName];
    
    [self createBarButtonItem];
    [self getHeadData];
    [self getNewShareList];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor cyanColor];
    _commentList=[NSMutableArray array];
    _shareInfo=[NSMutableArray array];

//    [self createHeadView];
//    [self createBottomView];

//    [self createFooterView];
//    [self crateTableView];
    
    
    NSString * path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *fileName = [path stringByAppendingPathComponent:WeiXinUserInfo];
    self.user = [NSKeyedUnarchiver unarchiveObjectWithFile:fileName];
}
-(void)getHeadData{
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[@"shareId"]=self.shareId;
    
    [UserLoginTool loginRequestGet:@"getShareInfo" parame:dict success:^(id json) {
        LWLog(@"%@",json);
        if ([json[@"systemResultCode"] intValue] == 1 && [json[@"resultCode"] intValue] == 1) {
            [self.shareInfo removeAllObjects];
            
            ShareInfoModel *infoModel = [ShareInfoModel objectWithKeyValues:json[@"resultData"][@"data"]];
            
            
            
            [self.shareInfo addObject:infoModel];
            NSLog(@"%@",_shareInfo);
            
                [self createHeadView];
                [self createBottomView];

            [_tableView reloadData];
        }
        [_tableView.mj_header endRefreshing];
        
    } failure:^(NSError *error) {
        LWLog(@"%@",error);
    }];
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
#pragma mark 网络请求列表数据
/**
 *  下拉刷新
 */
- (void)getNewShareList {
    
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    dic[@"lastId"] = @0;
    dic[@"shareId"] = self.shareId;
    dic[@"userId"] = self.user.userId;

    [UserLoginTool loginRequestGet:@"searchShareCommentList" parame:dic success:^(id json) {
        
        LWLog(@"%@",json);
        
        if ([json[@"systemResultCode"] intValue] == 1 && [json[@"resultCode"] intValue] == 1) {
            [self.commentList removeAllObjects];
             
            NSArray *temp = [CommentModel objectArrayWithKeyValuesArray:json[@"resultData"][@"list"]];
            
            
            [self.commentList addObjectsFromArray:temp];
            
            NSLog(@"%@",_commentList);
            
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
    
    CommentModel *model = [self.commentList lastObject];
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    dic[@"lastId"] = model.pid;
    dic[@"shareId"] = self.shareId;
    dic[@"userId"] = self.user.userId;
    [UserLoginTool loginRequestGet:@"searchShareCommentList" parame:dic success:^(id json) {
        
        LWLog(@"%@",json);
        
        if ([json[@"systemResultCode"] intValue] == 1 && [json[@"resultCode"] intValue] == 1) {
            
            NSArray *temp = [CommentModel objectArrayWithKeyValuesArray:json[@"resultData"][@"list"]];
            
            
            [self.commentList addObjectsFromArray:temp];
            
            [_tableView reloadData];
        }
        [_tableView.mj_footer endRefreshing];

        
    } failure:^(NSError *error) {
        NSLog(@"%@",error);
    }];
    
}

#pragma mark  网络请求回复

-(void)addCommentWithInformation {
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    dic[@"userId"] = self.user.userId;
    dic[@"parentId"] = _ridComment;
    dic[@"content"] = _replyView.viewText.text;
    dic[@"commentId"] = _commentId;
    [UserLoginTool loginRequestPostWithFile:@"addReply" parame:dic success:^(id json) {
        LWLog(@"%@",json);
        if ([json[@"systemResultCode"] intValue] == 1 && [json[@"resultCode"] intValue] == 1) {
            LWLog(@"%@",json[@"resultDescription"]);
        }else {
            LWLog(@"%@",json[@"resultDescription"]);
        }
        
    } failure:^(NSError *error) {
        LWLog(@"%@",error);

        
    } withFileKey:nil];
    
    
}

#pragma mark 网络请求评论

- (void)addReplyWithComment {
    NSLog(@"%@",_comReplyView.viewText.text);
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    dic[@"userId"] = self.user.userId;
    dic[@"shareId"] = self.shareId;
    dic[@"content"] = _comReplyView.viewText.text;
    
    [UserLoginTool loginRequestPostWithFile:@"addComment" parame:dic success:^(id json) {
        LWLog(@"%@",json);
        if ([json[@"systemResultCode"] intValue] == 1 && [json[@"resultCode"] intValue] == 1) {
            LWLog(@"%@",json[@"resultDescription"]);
        }else {
            LWLog(@"%@",json[@"resultDescription"]);
        }
    } failure:^(NSError *error) {
        LWLog(@"%@",error);
    } withFileKey:nil];
}

#pragma mark 为文章点赞

- (void)clickPraiseWithNews {
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    dic[@"userId"] = self.user.userId;
    dic[@"shareId"] = self.shareId;
    dic[@"data"] = self.praiseQuantityNews;
    
    [UserLoginTool loginRequestPostWithFile:@"clickPraise" parame:dic success:^(id json) {
        LWLog(@"%@",json);
        if ([json[@"systemResultCode"] intValue] == 1 && [json[@"resultCode"] intValue] == 1) {
            LWLog(@"%@",json[@"resultDescription"]);
        }else {
            LWLog(@"%@",json[@"resultDescription"]);
        }
    } failure:^(NSError *error) {
        LWLog(@"%@",error);
    } withFileKey:nil];
}

#pragma mark 为评论点赞

- (void)clickPraiseWithReply {
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    dic[@"userId"] = self.user.userId;
    dic[@"shareId"] = self.shareId;
    dic[@"data"] = self.praiseQuantityReply;
    
    [UserLoginTool loginRequestPostWithFile:@"clickPraise" parame:dic success:^(id json) {
        LWLog(@"%@",json);
        if ([json[@"systemResultCode"] intValue] == 1 && [json[@"resultCode"] intValue] == 1) {
            LWLog(@"%@",json[@"resultDescription"]);
        }else {
            LWLog(@"%@",json[@"resultDescription"]);
        }
    } failure:^(NSError *error) {
        LWLog(@"%@",error);
    } withFileKey:nil];
}
#pragma mark 删除评论

- (void)deleteCommentWithReply {
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    dic[@"userId"] = self.user.userId;
    dic[@"commentId"] = self.ridComment;
    
    [UserLoginTool loginRequestPostWithFile:@"deleteComment" parame:dic success:^(id json) {
        LWLog(@"%@",json);
        if ([json[@"systemResultCode"] intValue] == 1 && [json[@"resultCode"] intValue] == 1) {
            LWLog(@"%@",json[@"resultDescription"]);
        }else {
            LWLog(@"%@",json[@"resultDescription"]);
        }
    } failure:^(NSError *error) {
        LWLog(@"%@",error);
    } withFileKey:nil];
}
#pragma mark  文章分享

-(void)addShareWithInformation {
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    dic[@"userId"] = self.user.userId;
    dic[@"title"] = self.title;
    dic[@"content"] =self.content;
    dic[@"imgUrl"] = self.imgUrl;

    [UserLoginTool loginRequestPostWithFile:@"addShare" parame:dic success:^(id json) {
        LWLog(@"%@",json);
        if ([json[@"systemResultCode"] intValue] == 1 && [json[@"resultCode"] intValue] == 1) {
            LWLog(@"%@",json[@"resultDescription"]);
        }else {
            LWLog(@"%@",json[@"resultDescription"]);
        }
        
    } failure:^(NSError *error) {
        LWLog(@"%@",error);
        
        
    } withFileKey:nil];
    
    
}
-(void)createShareView{
    _viewBackShare=[[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WITH, SCREEN_HEIGHT)];
    _viewBackShare.backgroundColor=[UIColor grayColor];
    _viewBackShare.alpha=0.5;
    [_viewBackShare bk_whenTapped:^{
        NSLog(@"点击了");
        _viewBackShare.hidden=YES;
        _shareThirdView.hidden=YES;
    }];
    
    NSArray *nib=[[NSBundle mainBundle]loadNibNamed:@"HT_Infor_ShareThirdCView" owner:nil options:nil];
    _shareThirdView=[nib firstObject];
    _shareThirdView.frame=CGRectMake(0, SCREEN_HEIGHT-SCREEN_HEIGHT/1150*300-64, SCREEN_WITH, SCREEN_HEIGHT/1150*300);
    _shareThirdView.imageVQQ.userInteractionEnabled=YES;
    [_shareThirdView.imageVQQ bk_whenTapped:^{
        
    }];
    
    _shareThirdView.imageVWei.userInteractionEnabled=YES;
    [_shareThirdView.imageVWei bk_whenTapped:^{
        
    }];
    
    _shareThirdView.imageVTwitter.userInteractionEnabled=YES;
    [_shareThirdView.imageVTwitter bk_whenTapped:^{
        
    }];
    [self.view addSubview:_viewBackShare];
    [self.view addSubview:_shareThirdView];


}

-(void)createTextView{
    _viewBack=[[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WITH, SCREEN_HEIGHT)];
    _viewBack.backgroundColor=[UIColor clearColor];
    [_viewBack bk_whenTapped:^{
        [_replyView.viewText resignFirstResponder];
        _replyView.hidden=YES;
        _viewBack.hidden=YES;
    }];
    NSArray *nib=[[NSBundle mainBundle]loadNibNamed:@"HT_Infor_CommentTextCView" owner:nil options:nil];
    _replyView=[nib firstObject];
    _replyView.frame=CGRectMake(0, SCREEN_HEIGHT-50-64, SCREEN_WITH, 50);
    
    [_replyView.buttonSend bk_whenTapped:^{
        [self addCommentWithInformation];
        [_replyView.viewText resignFirstResponder];
        _replyView.hidden=YES;
        _viewBack.hidden=YES;
    }];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(KeyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(KeyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    
    [self.view addSubview:_viewBack];
    [self.view addSubview:_replyView];

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
    _headView.frame=CGRectMake(0, 0, SCREEN_WITH, SCREEN_HEIGHT/1150*500+10);
    ShareInfoModel *model=_shareInfo[0];
//    NSLog(@"%@",[_shareInfo[0] title]);
    
    _headView.labelTitle.text=model.title;
    _headView.labelDate.text=[self changeTheTimeStamps:(NSNumber *)model.time];
    _headView.labelScore.text=[NSString stringWithFormat:@"%@/%@分",model.useIntegral,model.totalIntegral];
    _headView.labelContent.text=model.content;
    [_headView.imageVMain sd_setImageWithURL:[NSURL URLWithString:model.img]];
    
    self.title=model.title;
    self.content=model.content;
    self.imgUrl=model.img;
        [self crateTableView];

}
/**
 *  评论框
 */
-(void)createComReplyView{
    _viewBackCom=[[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WITH, SCREEN_HEIGHT)];
    _viewBackCom.backgroundColor=[UIColor clearColor];
   
    
    NSArray *nib=[[NSBundle mainBundle]loadNibNamed:@"HT_Infor_CommentReplyCView" owner:nil options:nil];
    _comReplyView=[nib firstObject];
    _comReplyView.frame=CGRectMake(0 , 20 , SCREEN_WITH, SCREEN_HEIGHT/1150*450);
    [_comReplyView.viewText becomeFirstResponder];
    [_comReplyView.buttonCancel bk_whenTapped:^{
        _comReplyView.hidden=YES;
        _viewBackCom.hidden=YES;
        [_comReplyView.viewText resignFirstResponder];
    }];
    [_comReplyView.buttonSend bk_whenTapped:^{
        [self addReplyWithComment];
        _comReplyView.hidden=YES;
        _viewBackCom.hidden=YES;
        [_comReplyView.viewText resignFirstResponder];
    }];
    [self.view addSubview:_viewBackCom];
    [self.view addSubview:_comReplyView];
}

-(void)crateTableView{
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0,SCREEN_WITH,SCREEN_HEIGHT-64-_bottomView.frame.size.height) style:UITableViewStylePlain];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    _tableView.tableHeaderView=_headView;
    _tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    //    _tableView.backgroundColor=[UIColor redColor];
    [self.view addSubview:_tableView];
    [self setupRefresh];

}

-(void)createBottomView{
    NSArray *nib=[[NSBundle mainBundle]loadNibNamed:@"HT_Infor_BottomCView" owner:nil options:nil];
    _bottomView=[nib firstObject];
    _bottomView.frame=CGRectMake(0,SCREEN_HEIGHT-(SCREEN_HEIGHT/1100*90)-64, SCREEN_WITH, SCREEN_HEIGHT/1100*90);
    [_bottomView.buttonGo setTitle:@"说点什么" forState:UIControlStateNormal];
    ShareInfoModel *model=_shareInfo[0];
    _praiseQuantityNews=model.praiseQuantity;
    [_bottomView.buttonScore setTitle:[NSString stringWithFormat:@"转发奖励%@积分",model.relayReward] forState:UIControlStateNormal];
    if (self.NICE == YES) {
        _bottomView.imageVNice.image=[UIImage imageNamed:@"common_zanred_b"];
    }else{
        _bottomView.imageVNice.image=[UIImage imageNamed:@"common_zanred_a"];
    }
/*为文章点赞*/
    _bottomView.imageVNice.userInteractionEnabled=YES;
    [_bottomView.imageVNice bk_whenTapped:^{
        _bottomView.imageVNice.image=[UIImage imageNamed:@"common_zanred_b"];
        [self clickPraiseWithNews];
    }];
/*为文章分享*/
    _bottomView.imageVShare.userInteractionEnabled=YES;
    [_bottomView.imageVShare bk_whenTapped:^{
//        [self addShareWithInformation];
        [self createShareView];
    }];
    
    [_bottomView.buttonGo bk_whenTapped:^{
        [self createComReplyView];
    }];
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
    UITableView *_cell;
    CommentModel *model=_commentList[indexPath.section];
    if ([model.replyModels count]==0 || indexPath.row==0) {
        HT_Infor_CommentCellHeaderView * cell = [tableView dequeueReusableCellWithIdentifier:cellStatus];
        if (!cell) {
            cell = [[[NSBundle mainBundle]loadNibNamed:@"HT_Infor_CommentCellHeaderView" owner:nil options:nil] lastObject];
            cell.labelContent.text=model.content;
            cell.labelDate.text=[self changeTheTimeStamps:model.time];
            cell.labelName.text=model.name;
            cell.labelNice.text=[NSString stringWithFormat:@"%@",model.praiseQuantity];
            cell.labelComment.text=[NSString stringWithFormat:@"%@",model.commentQuantity];
            [cell.imageVHead sd_setImageWithURL:[NSURL URLWithString:model.userHeadUrl]];
            cell.imageVComment.userInteractionEnabled=YES;
            [cell.imageVComment bk_whenTapped:^{
                _replyId=model.pid;
                _ridComment=model.pid;
                _commentId=model.pid;

                [self changeTableViewWithIndexPath:indexPath];
            }];
            cell.imageVNice.userInteractionEnabled=YES;
            [cell.imageVNice bk_whenTapped:^{
                cell.imageVNice.image=[UIImage imageNamed:@"common_zan_b"];
                _praiseQuantityReply=model.commentQuantity;
                [self clickPraiseWithReply];
            }];
            cell.selectionStyle=UITableViewCellSelectionStyleNone;
            _cell=cell;
        }
        return _cell;
    }else if (indexPath.row==1){
            HT_Infor_CommentHeaderTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellHead];
            if (!cell) {
                cell = [[[NSBundle mainBundle]loadNibNamed:@"HT_Infor_CommentHeaderTableViewCell" owner:nil options:nil] lastObject];
                 cell.selectionStyle=UITableViewCellSelectionStyleNone;
                _cell=cell;
            }
            
        }else if (([model.replyModels count] + 2) == indexPath.row){
            HT_Infor_CommentTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIComment];
            if (!cell) {
                cell = [[[NSBundle mainBundle]loadNibNamed:@"HT_Infor_CommentFooterTableViewCell" owner:nil options:nil] lastObject];
//                cell.labelMain.text= @"";
                cell.selectionStyle=UITableViewCellSelectionStyleNone;
                _cell=cell;
            }
        }else {
            HT_Infor_CommentTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellFoot];
            
            if (!cell) {
                cell = [[[NSBundle mainBundle]loadNibNamed:@"HT_Infor_CommentTableViewCell" owner:nil options:nil] lastObject];
                ReplyModel *reply=model.replyModels[indexPath.row -2];
                if ([reply.toReplyId isEqualToNumber:model.commentUserId]) {
                    NSMutableAttributedString *attString = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@ : %@",reply.replyName,reply.content]];
                    [attString addAttribute:NSForegroundColorAttributeName value:COLOR_TEXT_TITILE range:NSMakeRange(0, reply.replyName.length)];
                    cell.labelMain.attributedText = attString;

                }else{
                    NSMutableAttributedString *attString = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@ 回复 %@ : %@",reply.replyName,reply.toReplyName,reply.content]];
                    [attString addAttribute:NSForegroundColorAttributeName value:COLOR_TEXT_TITILE range:NSMakeRange(0, reply.replyName.length)];
                    [attString addAttribute:NSForegroundColorAttributeName value:COLOR_TEXT_TITILE range:NSMakeRange(reply.replyName.length+4, reply.toReplyName.length)];
                    cell.labelMain.attributedText = attString;
                    
                    
                }
                
                cell.selectionStyle=UITableViewCellSelectionStyleNone;
                _cell=cell;
            }
    }
    return _cell;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    //    if ([_replyArray[section] count]==0) {
    ////        NSLog(@"#####  %ld",[_replyArray[section] count]);
    //        return 0 + 1;
    //    }else{
    //        NSLog(@"***** %ld ****",[_commentList[section][@"replyModels"] count]+2 +1);
    if ([_commentList[section] replyModels].count==0) {
        return 1;
    }else{
        //    NSLog(@"section %ld",(long)section);
        CommentModel *model=_commentList[section];
        //    NSLog(@"cpunt %ld",[model.replyModels count]);
        return [model.replyModels count]+2 +1 ;
    }
    //    }
}
//-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
////    if ([_replyArray[section] count]==0) {
//////        NSLog(@"#####  %ld",[_replyArray[section] count]);
////        return 0 + 1;
////    }else{
////        NSLog(@"***** %ld ****",[_commentList[section][@"replyModels"] count]+2 +1);
//    
//    NSLog(@"section %ld",(long)section);
//    CommentModel *model=_commentList[section];
//    NSLog(@"cpunt %ld",[model.replyModels count]);
//    return [model.replyModels count]+2 +1 ;
////    }
//}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
//    NSLog(@"section ------ %ld ----",(unsigned long)[_commentList count]);
    
    return [_commentList count]  ;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CommentModel *model=_commentList[indexPath.section];

    if ([model.replyModels count]==0) {
        NSLog(@"1--%@",model.content);
        return SCREEN_WITH/640*60 + SCREEN_WITH/640*60/5*3 + 16 +[self boundingRectWithSize:CGSizeMake(SCREEN_WITH-70, 0) font:[UIFont systemFontOfSize:17] string:model.content].height +1.0;
    }else {
        if (indexPath.row == 0) {
            NSLog(@"1---%@",model.content);
            return SCREEN_WITH/640*60 + SCREEN_WITH/640*60/5*3 + 16 + [self boundingRectWithSize:CGSizeMake(SCREEN_WITH-70, 0) font:[UIFont systemFontOfSize:17] string:model.content].height +1.0;
        }else if (indexPath.row==1){
            return 8.0f;
        }else if (([model.replyModels count] + 2) == indexPath.row){
            return 5;
        }else {
            ReplyModel *reply=model.replyModels[indexPath.row -2];
            NSLog(@"2---%@",reply.content);
            NSLog(@"model.pid---%@ reply.replyId---%@",model.pid,reply.replyId);
            if ([reply.toReplyId isEqualToNumber:model.commentUserId]) {
                return [self boundingRectWithSize:CGSizeMake(self.view.frame.size.width - 70, 0) font:[UIFont systemFontOfSize:15] string:[NSString stringWithFormat:@"%@ : %@",reply.replyName,reply.content]].height + 1.0;
            }else{
                return [self boundingRectWithSize:CGSizeMake(self.view.frame.size.width - 70, 0) font:[UIFont systemFontOfSize:15] string:[NSString stringWithFormat:@"%@ 回复 %@ : %@",reply.replyName,reply.toReplyName,reply.content]].height + 1.0;
                
            }
            
        }
    }
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIImageView *imageV=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WITH, 1)];
    imageV.image=[UIImage imageNamed:@"line1"];
    return imageV;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 1.0f;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view=[[UIView alloc]init];
    return view;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.0f;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"======");
    /**
     *  要回复的id
     */
    CommentModel *model=_commentList[indexPath.section];
    ReplyModel *reply=model.replyModels[indexPath.row -2];
    _ridComment=reply.rid;
    _commentId=model.pid;
    
    _allCellHeight =_headView.frame.size.height+10;
    if (indexPath.row==0 || indexPath.row==1 || indexPath.row == [_tableView numberOfRowsInSection:indexPath.section]-1) {
        
    }else{
        for (int i= 0 ; i<=indexPath.section; i++) {
            NSInteger rowCount=[_tableView numberOfRowsInSection:i];
            if (i<indexPath.section) {
                for (int j=0; j<=rowCount; j++) {
                    NSIndexPath *indexP = [NSIndexPath indexPathForRow:j inSection:i];
                    CGRect rect = [_tableView rectForRowAtIndexPath:indexP];
                    _allCellHeight=_allCellHeight+rect.size.height;
                }
            }else{
                for (int j=0; j<=indexPath.row; j++) {
                    NSIndexPath *indexP = [NSIndexPath indexPathForRow:j inSection:i];
                    CGRect rect = [_tableView rectForRowAtIndexPath:indexP];
                    _allCellHeight=_allCellHeight+rect.size.height;
                    if (j== rowCount-2) {
                        _allCellHeight+=5;
                    }
                }
            }
            _allCellHeight+=1;
        }
        UIActionSheet *sheet  = [[UIActionSheet alloc]initWithTitle:nil delegate: self  cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"复制",@"回复",@"删除",@"举报", nil];
        sheet.tag=1000;
        [sheet showInView:self.view];
    }
}

-(void)changeTableViewWithIndexPath :(NSIndexPath *)indexPath{
    _allCellHeight =_headView.frame.size.height+10;
    for (int i= 0 ; i<=indexPath.section; i++) {
        NSInteger rowCount=[_tableView numberOfRowsInSection:i];
        if (i<indexPath.section) {
            for (int j=0; j<=rowCount; j++) {
                NSIndexPath *indexP = [NSIndexPath indexPathForRow:j inSection:i];
                CGRect rect = [_tableView rectForRowAtIndexPath:indexP];
                _allCellHeight=_allCellHeight+rect.size.height;
            }
        }else{
            for (int j=0; j<=indexPath.row; j++) {
                NSIndexPath *indexP = [NSIndexPath indexPathForRow:j inSection:i];
                CGRect rect = [_tableView rectForRowAtIndexPath:indexP];
                //                    NSLog(@"rect.size.height  %f",rect.size.height);
                _allCellHeight=_allCellHeight+rect.size.height;
                //                    NSLog(@"j--%d rowCount---%ld",j,rowCount);
                if (j== rowCount-2) {
                    _allCellHeight+=5;
                }
            }
        }
        _allCellHeight+=1;
    }
    UIActionSheet *sheet  = [[UIActionSheet alloc]initWithTitle:nil delegate: self  cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"复制",@"评论",@"举报", nil];
    sheet.tag=1001;
    [sheet showInView:self.view];
    
}
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    /**
     *  回复-回复
     */
    if (actionSheet.tag==1000) {
        if (buttonIndex== 0) {
            //复制
            
        }else if(buttonIndex == 1){
            [self createTextView];
            //动画效果
            [UIView animateWithDuration:_time animations:^{
                [_replyView.viewText becomeFirstResponder];
                _replyView.frame=CGRectMake(0, SCREEN_HEIGHT-_height-50-64, SCREEN_WITH, 50);
                _bottomView.hidden=YES;
                [_tableView setContentOffset:CGPointMake(0, _allCellHeight-_height-50) animated:YES];
            }];
        }else if(buttonIndex == 2){
            [self deleteCommentWithReply];
            //删除
        }else if(buttonIndex == 3){
            //举报
        }
        else{
            
        }
    }
    /**
     *  回复-评论
     */
    if (actionSheet.tag==1001) {
        if (buttonIndex== 0) {
            
        }else if(buttonIndex == 1){
            [self createTextView];
            //动画效果
            [UIView animateWithDuration:_time animations:^{
                [_replyView.viewText becomeFirstResponder];
                _replyView.frame=CGRectMake(0, SCREEN_HEIGHT-_height-50-64, SCREEN_WITH, 50);
                _bottomView.hidden=YES;
                [_tableView setContentOffset:CGPointMake(0, _allCellHeight-_height-50) animated:YES];
            }];
            NSLog(@"评论");
        }else if(buttonIndex == 2){
            NSLog(@"回复");
        }else{
            
        }
    }
    
    
}

-(void)KeyboardWillShow:(NSNotification *)sender
{
    CGRect rect  = [[sender.userInfo objectForKey:UIKeyboardFrameEndUserInfoKey]CGRectValue];
    CGFloat height =  rect.size.height;
    _height=height;
    [UIView beginAnimations:nil context:nil];
    _time= [[sender.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey]doubleValue]; //获取动画时间;
    [UIView setAnimationDuration:[[sender.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey]doubleValue]
     ];
    [UIView commitAnimations];//开始执行动画
}

-(void)KeyboardWillHide:(NSNotification *)sender
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:[[sender.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey]doubleValue]];
    _viewBack.hidden=YES;
    _bottomView.hidden=NO;
    
    [UIView commitAnimations];
    
}

/**
 *  计算label高度
 *
 *  @param size <#size description#>
 *  @param font <#font description#>
 *  @param str  <#str description#>
 *
 *  @return <#return value description#>
 */
- (CGSize)boundingRectWithSize:(CGSize)size font:(UIFont *)font string:(NSString *)str
{
    NSDictionary *attribute = @{NSFontAttributeName : font};
    CGSize retSize = [str boundingRectWithSize:size
                                       options:
                      NSStringDrawingUsesLineFragmentOrigin |
                      NSStringDrawingUsesFontLeading
                                    attributes:attribute
                                       context:nil].size;
    
    return retSize;
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
