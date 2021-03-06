//
//  CallMeController.m
//  MeiTou
//
//  Created by 刘琛 on 15/12/8.
//  Copyright © 2015年 车. All rights reserved.
//

#import "CallMeController.h"
#import "CommentsController.h"
#import "PraiseController.h"
#import "CallMeCell.h"
#import "selectView.h"

@interface CallMeController ()<UITableViewDataSource,UITableViewDelegate,SelectViewDelegate>

@property (nonatomic, strong) selectView *selectV;

@property (nonatomic, strong) UIButton *titleButton;

@end

@implementation CallMeController

static NSString *callMeIdentify = @"callMeIdentify";


- (void)viewDidLoad {
    [super viewDidLoad];
    [self createBarButtonItem];
    [self.tableView registerNib:[UINib nibWithNibName:@"CallMeCell" bundle:nil] forCellReuseIdentifier:callMeIdentify];
    
    
    self.selectV = [[selectView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WITH, 111) AndSelectTag:2];
    self.selectV.delegate = self;
    self.selectV.hidden = YES;
    self.tableView.backgroundColor = COLOR_BACK_MAIN;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.selectV];
    
    
    _titleButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _titleButton.frame = CGRectMake(0, 0, 100, 30);
    [_titleButton setImage:[UIImage imageNamed:@"heda"] forState:UIControlStateNormal];
    [_titleButton setTitle:@"@我的" forState:UIControlStateNormal];
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

//#pragma mark  文章分享
//
//-(void)addShareWithInformation {
//    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
//    dic[@"userId"] = self.user.userId;
//    dic[@"title"] = self.title;
//    dic[@"content"] =self.content;
//    dic[@"imgUrl"] = self.imgUrl;
//    
//    [UserLoginTool loginRequestPostWithFile:@"addShare" parame:dic success:^(id json) {
//        LWLog(@"%@",json);
//        if ([json[@"systemResultCode"] intValue] == 1 && [json[@"resultCode"] intValue] == 1) {
//            LWLog(@"%@",json[@"resultDescription"]);
//        }else {
//            LWLog(@"%@",json[@"resultDescription"]);
//        }
//        
//    } failure:^(NSError *error) {
//        LWLog(@"%@",error);
//        
//        
//    } withFileKey:nil];
//    
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma mark tableView

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 159;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CallMeCell *cell = [tableView dequeueReusableCellWithIdentifier:callMeIdentify forIndexPath:indexPath];
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
    if (tag == 0) {
        CommentsController *comment = [story instantiateViewControllerWithIdentifier:@"CommentsController"];
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


@end
