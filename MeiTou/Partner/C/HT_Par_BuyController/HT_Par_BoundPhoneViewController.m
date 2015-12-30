//
//  MainViewController.m
//  qwer
//
//  Created by che on 15/12/3.
//  Copyright © 2015年 车. All rights reserved.
//

#import "HT_Par_BoundPhoneViewController.h"
#import "HT_Par_ChangePhoneViewController.h"

#import "HT_HomePage_BoundPhoneCView.h"



@interface HT_Par_BoundPhoneViewController ()

@end

@implementation HT_Par_BoundPhoneViewController{
    HT_HomePage_BoundPhoneCView *_mainView;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden=NO;
    self.navigationController.navigationBar.translucent=NO;
    [self changeNavigationBarLineHidden:NO];
    [self createBarButtonItem];
    [self createNavgationBarTitle];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createMainView];
}
/**
 *  隐藏导航栏下面那条线
 *
 *  @param hidden <#hidden description#>
 */
- (void)changeNavigationBarLineHidden:(BOOL)hidden {
    if ([self.navigationController.navigationBar respondsToSelector:@selector(setBackgroundImage:forBarMetrics:)]) {
        NSArray *list = self.navigationController.navigationBar.subviews;
        for (id obj in list) {
            if ([obj isKindOfClass:[UIImageView class]]) {
                UIImageView *imageView = (UIImageView *)obj;
                NSArray *list2 = imageView.subviews;
                for (id obj2 in list2) {
                    if ([obj2 isKindOfClass:[UIImageView class]]) {
                        UIImageView *imageView2 = (UIImageView *)obj2;
                        imageView2.hidden = hidden;
                    }
                }
            }
        }
    }
}

-(void)createNavgationBarTitle{
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 44)];
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.font = [UIFont boldSystemFontOfSize:FONT_SIZE(32)];
    titleLabel.textColor = [UIColor blackColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.text = @"绑定手机";
    self.navigationItem.titleView = titleLabel;
}

-(void)createBarButtonItem{
    UIButton *buttonL=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 18, 18)];
    [buttonL setBackgroundImage:[UIImage imageNamed:@"common_title_top_back"] forState:UIControlStateNormal];
    [buttonL addTarget:self action:@selector(clickLightButton) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *bbiL=[[UIBarButtonItem alloc]initWithCustomView:buttonL];
    self.navigationItem.leftBarButtonItem=bbiL;
    

}
/**
 *
 */
-(void)clickLightButton{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)createMainView{
    
        NSArray *nib=[[NSBundle mainBundle]loadNibNamed:@"HT_HomePage_BoundPhoneCView" owner:nil options:nil];
        _mainView=[nib firstObject];
    [_mainView.buttonBound addTarget:self action:@selector(goToNextView) forControlEvents:UIControlEventTouchUpInside];
        _mainView.frame=CGRectMake(0, 0, SCREEN_WITH, SCREEN_HEIGHT);
        [self.view addSubview:_mainView];

    
    
    
}
-(void)goToNextView{
    HT_Par_ChangePhoneViewController *change=[[HT_Par_ChangePhoneViewController alloc]init];
    [self.navigationController pushViewController:change animated:YES];

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
