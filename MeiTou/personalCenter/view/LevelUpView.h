//
//  LevelUpView.h
//  test
//
//  Created by 刘琛 on 15/12/11.
//  Copyright © 2015年 刘琛. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LevelUpViewDelegate <NSObject>

@optional

- (void)CancelSelect;

- (void)GoUpSelect;

@end

@interface LevelUpView : UIView

@property (nonatomic ,weak) id <LevelUpViewDelegate> delegate;


@end
