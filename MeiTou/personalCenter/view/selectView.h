//
//  selectView.h
//  MeiTou
//
//  Created by 刘琛 on 15/12/10.
//  Copyright © 2015年 车. All rights reserved.
//
//  0 评论
//  1 赞
//  2 @我的


#import <UIKit/UIKit.h>



@protocol SelectViewDelegate <NSObject>

@optional

-(void)selectClick:(NSInteger) tag;


@end


@interface selectView : UIView

@property (nonatomic, weak) id<SelectViewDelegate> delegate;

- (instancetype)initWithFrame:(CGRect)frame AndSelectTag:(NSInteger) tag;

@end
