//
//  HT_Infor_SearchViewController.m
//  MeiTou
//
//  Created by che on 15/12/23.
//  Copyright © 2015年 车. All rights reserved.
//

#import "HT_Infor_SearchViewController.h"
#import "InformationModel.h"

@interface HT_Infor_SearchViewController ()<UISearchBarDelegate>

@property (nonatomic, strong) NSString *searchKey;

@property (nonatomic, strong) NSMutableArray *shareList;

@end

@implementation HT_Infor_SearchViewController{
    UISearchBar * _search;
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden=YES;
    self.navigationController.navigationBar.translucent = NO;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor whiteColor];
    [self createSearchBar];
    self.shareList = [NSMutableArray array];
}

/**
 *  下拉刷新
 */
- (void)getNewShareList {
    
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    dic[@"lastId"] = @0;
    dic[@"key"] = self.searchKey;
    
    
    [UserLoginTool loginRequestGet:@"searchShareList" parame:dic success:^(id json) {
        
        LWLog(@"%@",json);
        
        if ([json[@"systemResultCode"] intValue] == 1 && [json[@"resultCode"] intValue] == 1) {
            
            NSArray *temp = [InformationModel objectArrayWithKeyValuesArray:json[@"resultData"][@"list"]];
            
            [self.shareList removeAllObjects];
            
            [self.shareList addObjectsFromArray:temp];
            
//            [_tableView reloadData];
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
    dic[@"key"] = self.searchKey;
    InformationModel *info = [self.shareList lastObject];
    dic[@"lastId"] = info.pid;
    
    
    [UserLoginTool loginRequestGet:@"searchShareList" parame:dic success:^(id json) {
        
        NSLog(@"%@",json);
        
        if ([json[@"systemResultCode"] intValue] == 1 && [json[@"resultCode"] intValue] == 1) {
            
            NSArray *temp = [InformationModel objectArrayWithKeyValuesArray:json[@"resultData"][@"list"]];
            
            [self.shareList addObjectsFromArray:temp];
            
//            [_tableView reloadData];
        }
        
    } failure:^(NSError *error) {
        NSLog(@"%@",error);
    }];
    
}



-(void)createSearchBar{
    _search = [[UISearchBar alloc]initWithFrame:CGRectMake(0, 20, SCREEN_WITH , SCREEN_HEIGHT/1100*70)];
    _search.placeholder=@"搜索";
    _search.delegate=self;
    _search.showsCancelButton=YES;
    [_search setImage:[UIImage imageNamed:@"common_title_top_search"] forSearchBarIcon:UISearchBarIconSearch state:UIControlStateNormal];
    
    _search.barTintColor = [UIColor whiteColor];
    for (UIView* subview in [[_search.subviews lastObject] subviews]) {
        
        if ([subview isKindOfClass:[UITextField class]]) {
            UITextField *textField = (UITextField*)subview;
            [textField setBackgroundColor:COLOR_BACK_MAIN];      //修改输入框的颜色
        }
    }
    
    
    for(UIView *view in  [[[_search subviews] objectAtIndex:0] subviews]) {
        if([view isKindOfClass:[NSClassFromString(@"UINavigationButton") class]]) {
            UIButton * cancel =(UIButton *)view;
            [cancel setTitle:@"取消" forState:UIControlStateNormal];
            [cancel setTitleColor:COLOR_BACK_MAIN forState:UIControlStateNormal];
            cancel.titleLabel.font=[UIFont systemFontOfSize:FONT_SIZE(26)];
            [cancel setTitleColor:COLOR_TEXT_TITILE forState:UIControlStateNormal];
            [cancel addTarget:self action:@selector(clickCancelButton) forControlEvents:UIControlEventTouchUpInside];
        }
    }
    
    [_search becomeFirstResponder];
    [self.view addSubview:_search];
}
-(void)clickLightButton{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)clickCancelButton{
    [self.navigationController popViewControllerAnimated:YES];
    
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
