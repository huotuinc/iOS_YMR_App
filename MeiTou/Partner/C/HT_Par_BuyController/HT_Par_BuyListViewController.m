//
//  HT_Par_BuyListViewController.m
//  MeiTou
//
//  Created by che on 15/12/2.
//  Copyright © 2015年 车. All rights reserved.
//

#import "HT_Par_BuyListViewController.h"
#import "HT_Par_BuyListTableViewCell.h"
#import "BuyModel.h"

static NSString *cellMain = @"cellMain";


@interface HT_Par_BuyListViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *buyList;

@end

@implementation HT_Par_BuyListViewController{
    UITableView *_tableView;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden=NO;
    self.navigationController.navigationBar.translucent=NO;
    [self navigationBarLineHidden:NO];
    [_tableView registerNib:[UINib nibWithNibName:@"HT_Par_BuyListTableViewCell" bundle:nil]forCellReuseIdentifier:cellMain];
    [self createNavgationBarTitle];
    [self createBarButtonItem];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createTableView];
    
    self.buyList = [NSMutableArray array];
}

/**
 *  隐藏导航栏下面那条线
 *
 *  @param hidden <#hidden description#>
 */
- (void)navigationBarLineHidden:(BOOL)hidden {
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
#pragma mark 网络请求

/**
 *  下拉刷新
 */
- (void)getNewShareList {
    
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    dic[@"lastId"] = nil;
    dic[@"crowdId"] = @1;
#warning 修改id
    
    [UserLoginTool loginRequestGet:@"getBookingList" parame:dic success:^(id json) {
        
        LWLog(@"%@",json);
        
        if ([json[@"systemResultCode"] intValue] == 1 && [json[@"resultCode"] intValue] == 1) {
            
            NSArray *temp = [BuyModel objectArrayWithKeyValuesArray:json[@"resultData"][@"list"]];
            //
            [self.buyList removeAllObjects];
            
            [self.buyList addObjectsFromArray:temp];
            
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
    
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    BuyModel *info = [self.buyList lastObject];
    dic[@"lastId"] = info.pid;
    dic[@"crowdId"] = @63;
#warning 修改id
    
    [UserLoginTool loginRequestGet:@"getBookingList" parame:dic success:^(id json) {
        
        LWLog(@"%@",json);
        
        if ([json[@"systemResultCode"] intValue] == 1 && [json[@"resultCode"] intValue] == 1) {
            
            NSArray *temp = [BuyModel objectArrayWithKeyValuesArray:json[@"resultData"][@"list"]];
            
            [self.buyList addObjectsFromArray:temp];
            
            [_tableView reloadData];
        }
        
    } failure:^(NSError *error) {
        NSLog(@"%@",error);
    }];
    
}



-(void)createNavgationBarTitle{
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 44)];
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.font = [UIFont boldSystemFontOfSize:FONT_SIZE(32)];
    titleLabel.textColor = [UIColor blackColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.text = @"预约人列表";
    self.navigationItem.titleView = titleLabel;
}
-(void)createBarButtonItem{
    UIButton *buttonL=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 18, 18)];
    [buttonL setBackgroundImage:[UIImage imageNamed:@"common_title_top_back"] forState:UIControlStateNormal];
    [buttonL addTarget:self action:@selector(clickLightButton) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *bbiL=[[UIBarButtonItem alloc]initWithCustomView:buttonL];
    self.navigationItem.leftBarButtonItem=bbiL;
    

}
/**
 *
 */
-(void)clickLightButton{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)createTableView{
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WITH , SCREEN_HEIGHT) style:UITableViewStylePlain];
    _tableView.delegate=self;
    _tableView.dataSource=self;
//    _tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableView];
    
}
#pragma mark UITableViewDelegate
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    HT_Par_BuyListTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellMain forIndexPath:indexPath];
    if (indexPath.row==1) {
        cell.buttonState.titleLabel.text=@"预约审核中";
        cell.buttonState.backgroundColor=COLOR_BUTTON_WAIT;
//    cell.labelDate.text=
//        cell.labelName.text=
//        cell.labelNumber.text=
        
    }
    if (indexPath.row==2) {
        cell.buttonState.titleLabel.text=@"预约失败";
        cell.buttonState.backgroundColor=COLOR_BUTTON_OUTDATE;
    }
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    return cell;
    
    
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return (NSInteger)SCREEN_HEIGHT/8;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

}


/**
 *  cell分割线完全填充
 */
-(void)viewDidLayoutSubviews {
    if ([_tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [_tableView setSeparatorInset:UIEdgeInsetsZero];
        
    }
    if ([_tableView respondsToSelector:@selector(setLayoutMargins:)])  {
        [_tableView setLayoutMargins:UIEdgeInsetsZero];
    }
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPat{
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]){
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }  
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
