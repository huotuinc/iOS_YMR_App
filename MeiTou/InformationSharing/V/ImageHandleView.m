//
//  ImageHandleView.m
//  伯乐课堂
//
//  Created by 酌晨茗 on 15/12/4.
//  Copyright © 2015年 boleketang. All rights reserved.
//

#import "ImageHandleView.h"

#define SW [UIScreen mainScreen].bounds.size.width

#define SH [UIScreen mainScreen].bounds.size.height

#define ImageWidth 150

#define Top (SH - ImageWidth) / 2.0

@interface ImageHandleView ()

@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation ImageHandleView

- (instancetype)initWithFrame:(CGRect)frame
                        image:(UIImage *)image
                     isCircle:(BOOL)circle {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.userInteractionEnabled = YES;
        
        self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SW, SH)];
        self.imageView.contentMode = UIViewContentModeScaleAspectFit;
        self.imageView.userInteractionEnabled = YES;
        [self addGestureForImageView];
        self.imageView.image = image;
        [self addSubview:self.imageView];
        
        //绘制UI
        CGFloat left = (SW - ImageWidth) / 2.0;
        CGRect rect = CGRectMake(left, Top, ImageWidth, ImageWidth);

        UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, SW, SH) cornerRadius:0];
        
        UIBezierPath *isCirclePath;
        if (circle) {
            CGFloat radius = rect.size.width / 2.0;
            isCirclePath = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:radius];
        } else {
            isCirclePath = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:0];
        }
        [path appendPath:isCirclePath];
        [path setUsesEvenOddFillRule:YES];
        
        CAShapeLayer *fillLayer = [CAShapeLayer layer];
        fillLayer.path = path.CGPath;
        fillLayer.fillRule = kCAFillRuleEvenOdd;
        fillLayer.fillColor = [UIColor grayColor].CGColor;
        fillLayer.opacity = 0.9;
        [self.layer addSublayer:fillLayer];
    }
    return self;
}

- (UIImage *)getHandledImage {
    CGRect rect = CGRectMake((SW - ImageWidth) / 2.0, Top, ImageWidth, ImageWidth);
    UIGraphicsBeginImageContext(self.frame.size);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *screenImage= UIGraphicsGetImageFromCurrentImageContext();
    
    CGImageRef imageRef = CGImageCreateWithImageInRect([screenImage CGImage], rect);
    
    UIImage *headerImage = [UIImage imageWithCGImage:imageRef];
    CGImageRelease(imageRef);
    
    UIGraphicsEndImageContext();
    
    self.imageView.frame = self.frame;
    return headerImage;
}

#pragma mark - 添加手势
- (void)addGestureForImageView {
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [self.imageView addGestureRecognizer:pan];
    
    UIPinchGestureRecognizer *pinch = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinch:)];
    [self.imageView addGestureRecognizer:pinch];
}

#pragma mark - 手势响应事件
- (void)pan:(UIPanGestureRecognizer *)gesture {
    CGPoint translation = [gesture translationInView:self];
    gesture.view.center = CGPointMake(gesture.view.center.x + translation.x, gesture.view.center.y +translation.y);
    [gesture setTranslation:CGPointZero inView:self];
}

- (void)pinch:(UIPinchGestureRecognizer *)gesture {
    CGFloat viewScale = gesture.scale;
    gesture.view.transform = CGAffineTransformScale(gesture.view.transform, viewScale, viewScale);
    gesture.scale = 1;
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end
