//
//  CallMeController.m
//  MeiTou
//
//  Created by 刘琛 on 15/12/8.
//  Copyright © 2015年 车. All rights reserved.
//

#import "CallMeController.h"
#import "CallMeCell.h"

@interface CallMeController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation CallMeController

static NSString *callMeIdentify = @"callMeIdentify";


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"CallMeCell" bundle:nil] forCellReuseIdentifier:callMeIdentify];
    
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


@end
