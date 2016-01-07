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

#import "CommentModel.h"
#import "UserInfo.h"


static NSString *cellIComment=@"cellIComment";
static NSString *cellStatus=@"cellStatus";
static NSString *cellFoot=@"cellFoot";
static NSString *cellHead=@"cellHead";




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
    UIView * _replyView;
    UITextView *_textView;
    UIView *_viewBack;

    NSMutableArray *_replyArray;//回复数组
    NSMutableArray *_statusArray;//说说数组
    
    CGFloat _time;//键盘弹起耗时
    CGFloat _height;//键盘弹起高度
    CGFloat _celly;//点击cell的y
    CGFloat _cellHeight;//点击cell的height
    
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
    [self getNewShareList];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor cyanColor];
    [self createDataArray];
    [self createHeadArray];
    [self createHeadView];
    [self createBottomView];

//    [self createFooterView];
    [self crateTableView];
    
    
    NSString * path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *fileName = [path stringByAppendingPathComponent:WeiXinUserInfo];
    self.user = [NSKeyedUnarchiver unarchiveObjectWithFile:fileName];
}

-(void)createDataArray{
    _replyArray=[NSMutableArray array];
    //    NSArray *arrA=@[@"小车 : 生来彷徨"];
    NSArray *arrA=[[NSArray alloc]init];
    NSArray *arrB=@[@"小车 : 生来彷徨",
                    @"小明 回复 小车 : 雨后有车驶来,驶过暮色苍白,旧铁皮往南开,恋人已不在"];
    NSArray *arrC=@[@"小车 : 生来彷徨",
                    @"小明 回复 小车 : 雨后有车驶来,驶过暮色苍白,旧铁皮往南开,恋人已不在",
                    @"小明 回复 小车 : 一一一",
                    @"小明 回复 小车 : 正正正正正正正正正正正正正正正正正正正正正正正正正正正正正正正正正正正正正正正正正正正正正正正正正正正正正正正正正正正正正正正正正正正正正正正正正正正正正正正正正正正正正正正正正正正"];
    NSArray *arrD=@[@"小车 : 我化尘埃飞扬,追寻赤裸飞翔",
                    @"小明 回复 小车 : 我欲乘风破浪,踏遍黄沙海洋,与其误会一场,也要不负勇往",
                    @"小明 回复 小车 : 我欲乘风破浪,踏遍黄沙海洋,与其误会一场,也要不负勇往我欲乘风破浪,踏遍黄沙海洋,与其误会一场,也要不负勇往",
                    @"小明 回复 小车 : 一"];
    
    [_replyArray addObject:arrA];
    [_replyArray addObject:arrB];
    [_replyArray addObject:arrC];
    [_replyArray addObject:arrD];
    [_replyArray addObject:arrA];
    [_replyArray addObject:arrB];
    [_replyArray addObject:arrC];
    [_replyArray addObject:arrD];
    
}

-(void)createHeadArray{
    _statusArray=[NSMutableArray arrayWithArray:@[@"我化尘埃飞扬,追寻赤裸飞翔",
                                                  @"我欲乘风破浪,踏遍黄沙海洋,与其误会一场,也要不负勇往",
                                                  @"我欲乘风破浪,踏遍黄沙海洋,与其误会一场,也要不负勇往我欲乘风破浪,踏遍黄沙海洋,与其误会一场,也要不负勇往",
                                                  @"一",
                                                  @"我化尘埃飞扬,追寻赤裸飞翔",
                                                  @"我欲乘风破浪,踏遍黄沙海洋,与其误会一场,也要不负勇往",
                                                  @"我欲乘风破浪,踏遍黄沙海洋,与其误会一场,也要不负勇往我欲乘风破浪,踏遍黄沙海洋,与其误会一场,也要不负勇往",
                                                  @"一"]];
}


#pragma mark 网络请求列表数据
/**
 *  下拉刷新
 */
- (void)getNewShareList {
    
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    dic[@"lastId"] = @0;
    dic[@"shareId"] = @4;
    dic[@"userId"] = self.user.userId;
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
    dic[@"shareId"] = @4;
    dic[@"userId"] = self.user.userId;
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

-(void)createTextView{
    
    _viewBack=[[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WITH, SCREEN_HEIGHT)];
    _viewBack.backgroundColor=[UIColor clearColor];
    [_viewBack bk_whenTapped:^{
        [_textView resignFirstResponder];
    }];
    
    _replyView=[[UIView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT, SCREEN_WITH, 50)];
    _replyView.backgroundColor=[UIColor greenColor];
    _textView.textAlignment = NSTextAlignmentLeft;
    _textView=[[UITextView alloc]initWithFrame:CGRectMake(10, 10, SCREEN_WITH-20, 30)];
    _textView.backgroundColor=[UIColor grayColor];
    //    _textView.borderStyle = UITextBorderStyleRoundedRect;
    _textView.font = [UIFont systemFontOfSize:20];
    
    
    [_replyView addSubview:_textView];
    
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(KeyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(KeyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    
    [_viewBack addSubview:_replyView];
    [self.view addSubview:_viewBack];
    
    
    
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
    _footerView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WITH, _bottomView.frame.size.height+20)];
}

-(void)crateTableView{
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0,SCREEN_WITH,SCREEN_HEIGHT-64-_bottomView.frame.size.height) style:UITableViewStyleGrouped];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    _tableView.tableHeaderView=_headView;
    _tableView.tableFooterView=_footerView;
    _tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    _tableView.backgroundColor=[UIColor redColor];
    [self.view addSubview:_tableView];
    
}

-(void)createBottomView{
    NSArray *nib=[[NSBundle mainBundle]loadNibNamed:@"HT_Infor_BottomCView" owner:nil options:nil];
    _bottomView=[nib firstObject];
    _bottomView.frame=CGRectMake(0,SCREEN_HEIGHT-(SCREEN_HEIGHT/1100*90)-64, SCREEN_WITH, SCREEN_HEIGHT/1100*90);
    [_bottomView.buttonGo setTitle:@"说点什么" forState:UIControlStateNormal];

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
    
    if ([_replyArray[indexPath.section] count]==0) {
        HT_Infor_CommentCellHeaderView * cell = [tableView dequeueReusableCellWithIdentifier:cellStatus];
        if (!cell) {
            cell = [[[NSBundle mainBundle]loadNibNamed:@"HT_Infor_CommentCellHeaderView" owner:nil options:nil] lastObject];
            cell.labelContent.text=_statusArray[indexPath.section];
            cell.selectionStyle=UITableViewCellSelectionStyleNone;
            _cell=cell;
        }
        return _cell;
    }else {
        if (indexPath.row == 0) {
            HT_Infor_CommentCellHeaderView * cell = [tableView dequeueReusableCellWithIdentifier:cellStatus];
            if (!cell) {
                cell = [[[NSBundle mainBundle]loadNibNamed:@"HT_Infor_CommentCellHeaderView" owner:nil options:nil] lastObject];
                cell.labelContent.text=_statusArray[indexPath.section];
                cell.selectionStyle=UITableViewCellSelectionStyleNone;
                _cell=cell;
            }
        }else if (indexPath.row==1){
            HT_Infor_CommentHeaderTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellHead];
            if (!cell) {
                cell = [[[NSBundle mainBundle]loadNibNamed:@"HT_Infor_CommentHeaderTableViewCell" owner:nil options:nil] lastObject];
                 cell.selectionStyle=UITableViewCellSelectionStyleNone;
                _cell=cell;
            }
            
        }else if (([_replyArray[indexPath.section] count] + 2   ) == indexPath.row){
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
                cell.labelMain.text=_replyArray[indexPath.section][indexPath.row -2 ];
                cell.selectionStyle=UITableViewCellSelectionStyleNone;
                _cell=cell;
            }
            
        }
    }
    
    return _cell;
    
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if ([_replyArray[section] count]==0) {
//        NSLog(@"#####  %ld",[_replyArray[section] count]);
        return 0 + 1;
    }else{
//        NSLog(@"***** %lu ****",[_replyArray[section] count]+2 +1);
        return [_replyArray[section] count]+2 +1 ;
    }
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
//    NSLog(@"***** %ld ----",[_statusArray count]);
    return [_statusArray count]  ;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([_replyArray[indexPath.section] count]==0) {
        return SCREEN_WITH/640*60 + SCREEN_WITH/640*60/5*3 + 16 +[self boundingRectWithSize:CGSizeMake(SCREEN_WITH-70, 0) font:[UIFont systemFontOfSize:17] string:_statusArray[indexPath.section]].height +1.0;
    }else {
        if (indexPath.row == 0) {
            return SCREEN_WITH/640*60 + SCREEN_WITH/640*60/5*3 + 16 + [self boundingRectWithSize:CGSizeMake(SCREEN_WITH-70, 0) font:[UIFont systemFontOfSize:17] string:_statusArray[indexPath.section]].height +1.0;
        }else if (indexPath.row==1){
            return 8.0f;
        }else if (([_replyArray[indexPath.section] count] + 2) == indexPath.row){
            return 5;
        }else {
            return [self boundingRectWithSize:CGSizeMake(self.view.frame.size.width - 70, 0) font:[UIFont systemFontOfSize:17] string:_replyArray[indexPath.section][indexPath.row - 2]].height + 1.0;
        }
    }
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIImageView *imageV=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WITH, 1)];
    imageV.image=[UIImage imageNamed:@"line1"];
    return imageV;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 1.00;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view=[[UIView alloc]init];
    return view;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 1.0f;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UIActionSheet *sheet  = [[UIActionSheet alloc]initWithTitle:nil delegate: self  cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"复制",@"回复",@"举报", nil];
    sheet.tag=1000;
    [sheet showInView:self.view];
    
    CGRect  popoverRect = [tableView convertRect:[tableView rectForRowAtIndexPath:indexPath] toView:[tableView superview]];
    
    //    NSLog(@"%f **** %f **** %f ***** %f",popoverRect.origin.x,popoverRect.origin.y,popoverRect.size.width,popoverRect.size.height);
    _celly=popoverRect.origin.y;
    _cellHeight=popoverRect.size.height;
    NSLog(@"_celly --- %f   -cellH ---- %f",_celly,_cellHeight);
    //        if (indexPath.row > 0 ) {
    NSLog(@"%ld",indexPath.row);
    
    
    _cellIndex =indexPath;
    
    
    UITableViewCell *cell=(UITableViewCell *) [_tableView cellForRowAtIndexPath:indexPath];
    
    

    
}


-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (actionSheet.tag==1000) {
        if (buttonIndex== 0) {
            
        }else if(buttonIndex == 1){
            [self createTextView];
            //动画效果
            [UIView animateWithDuration:_time animations:^{
                [_textView becomeFirstResponder];
                _bottomView.hidden=YES;
                NSLog(@"%f *** %f ---- %f",_celly,_cellHeight,_celly+_cellHeight);
                NSLog(@"%f ==== %f",_height,SCREEN_HEIGHT-_height-50);
                if (_celly+_cellHeight < SCREEN_HEIGHT-_height-64) {
//                    _replyView.frame      = CGRectMake(0, SCREEN_HEIGHT-50-64, SCREEN_WITH, 50);
                    _replyView.frame=CGRectMake(0, SCREEN_HEIGHT-_height-64-50, SCREEN_WITH, 50);

                }else{
//                    _tableView.transform = CGAffineTransformMakeTranslation(0,_replyView.frame.origin.y-(_celly+_cellHeight)-50-64);
                    _tableView.contentOffset=CGPointMake(0, _celly+_cellHeight-_height);
                    // 设置view弹出来的位置
                    _replyView.frame      = CGRectMake(0, SCREEN_HEIGHT-50-64, SCREEN_WITH, 50);
                
                }
                
                
                //            [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(viewShow) userInfo:nil repeats:NO];
            }];
#warning 回复评论
            NSLog(@"评论");
        }else if(buttonIndex == 2){
#warning 对评论进行回复
            NSLog(@"回复");
        }else{
            
        }
    }else if (actionSheet.tag==1001) {
        if (buttonIndex== 0) {
            
        }else if(buttonIndex == 1){
            [self createTextView];
            //动画效果
            [UIView animateWithDuration:_time animations:^{
                [_textView becomeFirstResponder];
#warning
                NSLog(@"%f *** %f",_celly,_cellHeight);
//                _tableView.transform = CGAffineTransformMakeTranslation(0,_replyView.frame.origin.y-(_celly+_cellHeight)-50);
//                _tableView.contentOffset=CGPointMake(0, _celly+_cellHeight)
                // 设置view弹出来的位置
                _replyView.frame      = CGRectMake(0, SCREEN_HEIGHT-50, SCREEN_WITH, 50);
                
                //            [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(viewShow) userInfo:nil repeats:NO];
            }];
#warning 回复评论
            NSLog(@"评论");
        }else if(buttonIndex == 2){
#warning 对评论进行回复
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
    if (_celly+_cellHeight > SCREEN_HEIGHT-_height-50) {
        self.view.transform = CGAffineTransformMakeTranslation(0, -_height);
    }
    //        _tableView.transform = CGAffineTransformMakeTranslation(0,_replyView.frame.origin.y-(_celly+_cellHeight));
    [UIView commitAnimations];//开始执行动画
}

-(void)KeyboardWillHide:(NSNotification *)sender
{
    CGRect rect  = [[sender.userInfo objectForKey:UIKeyboardFrameEndUserInfoKey]CGRectValue];
    CGFloat height =  rect.size.height;
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:[[sender.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey]doubleValue]];
    
    UITableViewCell *cell=(UITableViewCell *) [_tableView cellForRowAtIndexPath:_cellIndex];
    //    cell.transform = CGAffineTransformIdentity; //重置状态
    //    _tableView.contentOffset = CGPointZero;
    _tableView.transform = CGAffineTransformIdentity; //重置状态
    //    _tableView.contentOffset = CGPointZero

    self.view.transform = CGAffineTransformIdentity; //重置状态
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
