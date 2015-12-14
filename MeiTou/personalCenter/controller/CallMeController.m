//
//  CallMeController.m
//  MeiTou
//
//  Created by 刘琛 on 15/12/8.
//  Copyright © 2015年 车. All rights reserved.
//

#import "CallMeController.h"
#import "CallMeCell.h"
#import "selectView.h"

@interface CallMeController ()<UITableViewDataSource,UITableViewDelegate,SelectViewDelegate>

@property (nonatomic, strong) selectView *selectV;

@end

@implementation CallMeController

static NSString *callMeIdentify = @"callMeIdentify";


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"CallMeCell" bundle:nil] forCellReuseIdentifier:callMeIdentify];
    
    
    self.selectV = [[selectView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WITH, 111) AndSelectTag:2];
    self.selectV.delegate = self;
    self.selectV.hidden = YES;
    [self.view addSubview:self.selectV];
    
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

#pragma mark selectView

- (void)selectClick:(NSInteger)tag {
    
    if (tag == 1) {
        self.selectV.hidden = YES;
    }else if (tag == 2) {
        self.selectV.hidden = YES;
    }else if (tag == 3) {
        self.selectV.hidden = YES;
    }
}


@end
