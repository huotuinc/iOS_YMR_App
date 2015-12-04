//
//  HT_HomePage_PhoneViewController.m
//  MeiTou
//
//  Created by che on 15/12/1.
//  Copyright © 2015年 车. All rights reserved.
//

#import "HT_HomePage_PhoneViewController.h"
#import "HT_HomePage_PhoneCView.h"


@interface HT_HomePage_PhoneViewController ()

@end

@implementation HT_HomePage_PhoneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor whiteColor];
    [self createMainView];
}
-(void)createMainView{
    
    NSArray  *nib= [[NSBundle mainBundle]loadNibNamed:@"HT_HomePage_PhoneCView" owner:nil options:nil];
    UIView *mainView=[nib firstObject];
    mainView.frame=CGRectMake(0, 0, SCREEN_WITH , SCREEN_HEIGHT);

    [self.view addSubview:mainView];


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
