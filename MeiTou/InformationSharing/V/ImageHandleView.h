//
//  ImageHandleView.h
//  伯乐课堂
//
//  Created by 酌晨茗 on 15/12/4.
//  Copyright © 2015年 boleketang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageHandleView : UIView

- (instancetype)initWithFrame:(CGRect)frame
                        image:(UIImage *)image
                     isCircle:(BOOL)circle;

- (UIImage *)getHandledImage;

@end
