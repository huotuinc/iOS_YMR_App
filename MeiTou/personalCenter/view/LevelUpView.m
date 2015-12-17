//
//  LevelUpView.m
//  test
//
//  Created by 刘琛 on 15/12/11.
//  Copyright © 2015年 刘琛. All rights reserved.
//

#import "LevelUpView.h"

@implementation LevelUpView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
        
        UIView *backView= [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
        backView.backgroundColor = [UIColor colorWithWhite:0.000 alpha:0.800];
        backView.userInteractionEnabled = YES;
        [self addSubview:backView];
        
        UITapGestureRecognizer *cancel = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(cancelClick)];
        [backView addGestureRecognizer:cancel];
        
        UIView *showView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 240, 323)];
        showView.center = self.center;
        [self addSubview:showView];
        
        UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 240, 323)];
        image.image = [UIImage imageNamed:@"bnm"];
        [showView addSubview:image];
        
        
        UITapGestureRecognizer *up = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(goUpClick)];
        UIView *button = [[UIView alloc] initWithFrame:CGRectMake(0, 323 - 56, 240, 56)];
        button.userInteractionEnabled = YES;
        [showView addSubview:button];
        [button addGestureRecognizer:up];
        
        self.layer.cornerRadius = 5;
        
    }
    return self;
}

- (void)cancelClick {
    
    self.hidden = YES;
    
    if ([self.delegate respondsToSelector:@selector(CancelSelect)]) {
        [self.delegate CancelSelect];
    }
    
}

- (void)goUpClick {
    
    self.hidden = YES;
    
    if ([self.delegate respondsToSelector:@selector(GoUpSelect)]) {
        [self.delegate GoUpSelect];
    }
}

@end
