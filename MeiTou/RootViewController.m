//
//  RootViewController.m
//  MeiTou
//
//  Created by che on 15/11/27.
//  Copyright © 2015年 车. All rights reserved.
//

#import "RootViewController.h"
#import "MMExampleDrawerVisualStateManager.h"

#import "HT_HomePageViewController.h"
#import "HT_HomePage_LeftViewController.h"
#import "HT_LeftViewController.h"

#import "UIViewController+MMDrawerController.h"//第三方封装的头文件
#import "MMDrawerBarButtonItem.h"//第三方封装的头文件
#import "HT_HomePage_LeftViewController.h"//左视图头文件

@interface RootViewController ()


@end

@implementation RootViewController
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];

}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    [self leftOption];
    
    //设置左侧视图控制器
    HT_HomePage_LeftViewController * left = [[HT_HomePage_LeftViewController alloc] init];
    self.leftDrawerViewController = left;
//    HT_LeftViewController * left = [[HT_LeftViewController alloc] init];
//    self.leftDrawerViewController = left;
    
    
    //设置中间视图控制器
    HT_HomePageViewController *home=[[HT_HomePageViewController alloc]init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:home];
    self.centerViewController = nav;
    
    //设置右侧视图控制器
    self.rightDrawerViewController = nil;
    
    //设置测拉宽度
    self.maximumLeftDrawerWidth = SCREEN_WITH * SplitScreenRate;
    //    self.maximumRightDrawerWidth = 0;
    
    //设置手势范围
//    [self setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeAll];
    [self setCloseDrawerGestureModeMask:MMCloseDrawerGestureModeAll];
    
    // 6.设置动画切换
    // 01.配置动画
    [self setDrawerVisualStateBlock:^(MMDrawerController *drawerController, MMDrawerSide drawerSide, CGFloat percentVisible) {
        MMDrawerControllerDrawerVisualStateBlock block = [[MMExampleDrawerVisualStateManager sharedManager] drawerVisualStateBlockForDrawerSide:drawerSide];
        if (block != nil) {
            block(drawerController,drawerSide,percentVisible);
        }
        
    }];
    
    [self setShowsShadow:NO];
    [MMExampleDrawerVisualStateManager sharedManager].leftDrawerAnimationType = MMDrawerAnimationTypeParallax;
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
