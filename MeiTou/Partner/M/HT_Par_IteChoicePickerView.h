//
//  AddressChoicePickerView.h
//  Wujiang
//
//  Created by zhengzeqin on 15/5/27.
//  Copyright (c) 2015年 com.injoinow. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HT_Par_IteChociePickerNModel.h"
@class HT_Par_IteChoicePickerView;
typedef void (^AddressChoicePickerViewBlock)(HT_Par_IteChoicePickerView *view,UIButton *btn,HT_Par_IteChociePickerNModel *locate);
@interface HT_Par_IteChoicePickerView : UIView

@property (copy, nonatomic)AddressChoicePickerViewBlock block;

- (void)show;
@end
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com