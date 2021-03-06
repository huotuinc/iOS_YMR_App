//
//  selectView.m
//  MeiTou
//
//  Created by 刘琛 on 15/12/10.
//  Copyright © 2015年 车. All rights reserved.
//

#import "selectView.h"
@interface selectView()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSIndexPath *selectIndexPath;


@end


@implementation selectView

static NSString *selectIdentify = @"selectViewIdentify";

- (instancetype)initWithFrame:(CGRect)frame AndSelectTag:(NSInteger) tag {
    if (self = [super initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)]) {
        
        self.backgroundColor = [UIColor colorWithWhite:0.000 alpha:0.781];
        self.userInteractionEnabled = YES;
        
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, 37 * 4) style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:selectIdentify];
        [self addSubview:_tableView];
        
        _selectIndexPath = [NSIndexPath indexPathForRow:tag inSection:0];
        
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 37 * 4, frame.size.width, [UIScreen mainScreen].bounds.size.height - 37  * 4 - frame.origin.y)];
        view.userInteractionEnabled = YES;
        [self addSubview:view];
        
        UITapGestureRecognizer *ger = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(selectViewBackgroundClick)];
        
        [view addGestureRecognizer:ger];
    }
    return self;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 37;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:selectIdentify forIndexPath:indexPath];
    if (indexPath == _selectIndexPath) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    switch (indexPath.row) {
        case 0:
        {
            cell.textLabel.text = @"我的评论";
            cell.textLabel.font = [UIFont systemFontOfSize:13];
            break;
        }
        case 1:
        {
            cell.textLabel.text = @"赞";
            cell.textLabel.font = [UIFont systemFontOfSize:13];
            break;
        }
        case 2:
        {
            cell.textLabel.text = @"@我的";
            cell.textLabel.font = [UIFont systemFontOfSize:13];
            break;
        }
        case 3:
        {
            cell.textLabel.text = @"我的分享";
            cell.textLabel.font = [UIFont systemFontOfSize:13];
        }
        default:
            break;
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath != _selectIndexPath) {
        UITableViewCell *selectCell = [tableView cellForRowAtIndexPath:_selectIndexPath];
        UITableViewCell *clickCell = [tableView cellForRowAtIndexPath:indexPath];
        
        selectCell.accessoryType = UITableViewCellAccessoryNone;
        clickCell.accessoryType = UITableViewCellAccessoryCheckmark;
        
        
        if ([self.delegate respondsToSelector:@selector(selectClick:)]) {
            [self.delegate selectClick:indexPath.row];
        }
    }
    
}

- (void)selectViewBackgroundClick
{
    [UIView animateWithDuration:0.2 animations:^{
        self.hidden = YES;
    }];
    if ([self.delegate respondsToSelector:@selector(cannelClick)]) {
        [self.delegate cannelClick];
    }
}

@end
