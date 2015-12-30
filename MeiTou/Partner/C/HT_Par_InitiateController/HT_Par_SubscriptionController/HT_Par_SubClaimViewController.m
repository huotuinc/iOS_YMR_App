//
//  HT_Par_SubClaimViewController.m
//  MeiTou
//
//  Created by che on 15/12/7.
//  Copyright © 2015年 车. All rights reserved.
//

#import "HT_Par_SubClaimViewController.h"
#import "HT_Par_IteChoicePickerView.h"

#import "HT_Par_SubClaimCView.h"

@interface HT_Par_SubClaimViewController ()

@end

@implementation HT_Par_SubClaimViewController{
//    UIView *_mainView;
    HT_Par_SubClaimCView *mainView;
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden=NO;
    self.navigationController.navigationBar.translucent=NO;
    [self changeNavigationBarLineHidden:NO];
    [self createBarButtonItem];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createNavgationBarTitle];
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
    titleLabel.text = @"我要认购";
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
    NSArray *nib=[[NSBundle mainBundle]loadNibNamed:@"HT_Par_SubClaimCView" owner:nil options:nil];
    mainView=[nib firstObject];
    mainView.frame=CGRectMake(0, 0, SCREEN_WITH, SCREEN_HEIGHT);
    mainView.viewSelect.userInteractionEnabled=YES;
    UITapGestureRecognizer * tapMoney = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapTheLabelSelect)];
    [mainView.viewSelect addGestureRecognizer:tapMoney];
    [self.view addSubview:mainView];
   
}
/**
 *  tap事件
 */
-(void)tapTheLabelSelect{
    HT_Par_IteChoicePickerView *picker = [[HT_Par_IteChoicePickerView alloc]init];
    picker.block = ^(HT_Par_IteChoicePickerView *view,UIButton *btn,HT_Par_IteChociePickerNModel *locate){
        mainView.labelSelect.text = [NSString stringWithFormat:@"%@",locate];
    };
    [picker show];

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
