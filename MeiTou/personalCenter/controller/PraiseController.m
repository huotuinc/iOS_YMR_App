//
//  PraiseController.m
//  MeiTou
//
//  Created by 刘琛 on 15/12/8.
//  Copyright © 2015年 车. All rights reserved.
//

#import "PraiseController.h"
#import "PraiseCell.h"

@interface PraiseController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation PraiseController

static NSString *praiseIdentify = @"praiseIdentify";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"PraiseCell" bundle:nil] forCellReuseIdentifier:praiseIdentify];
    
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

@end
