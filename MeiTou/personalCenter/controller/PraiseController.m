//
//  PraiseController.m
//  MeiTou
//
//  Created by 刘琛 on 15/12/8.
//  Copyright © 2015年 车. All rights reserved.
//

#import "CallMeController.h"
#import "CommentsController.h"
#import "PraiseController.h"
#import "PraiseCell.h"
#import "selectView.h"

@interface PraiseController ()<UITableViewDelegate,UITableViewDataSource,SelectViewDelegate>

@property (nonatomic, strong) selectView *selectV;

@property (nonatomic, strong) UIButton *titleButton;

@end

@implementation PraiseController

static NSString *praiseIdentify = @"praiseIdentify";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"PraiseCell" bundle:nil] forCellReuseIdentifier:praiseIdentify];
    
    self.selectV = [[selectView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WITH, 111) AndSelectTag:1];
    self.selectV.delegate = self;
    self.selectV.hidden = YES;
    self.tableView.backgroundColor = COLOR_BACK_MAIN;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.selectV];
    
    
    _titleButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _titleButton.frame = CGRectMake(0, 0, 100, 30);
    [_titleButton setImage:[UIImage imageNamed:@"heda"] forState:UIControlStateNormal];
    [_titleButton setTitle:@"我的赞" forState:UIControlStateNormal];
    [_titleButton layoutIfNeeded];
    [_titleButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
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
    
    PraiseCell *cell = [tableView dequeueReusableCellWithIdentifier:praiseIdentify forIndexPath:indexPath];
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
        
    }else if (tag == 2) {
        CallMeController *praise = [story instantiateViewControllerWithIdentifier:@"CallMeController"];
        [self.navigationController pushViewController:praise animated:YES];
    }else if (tag == 3) {
        
        
    }
}
- (void)cannelClick {
    [self.titleButton setImage:[UIImage imageNamed:@"heda"] forState:UIControlStateNormal];
}

@end
