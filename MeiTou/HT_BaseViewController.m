//
//  HT_BaseViewController.m
//  MeiTou
//
//  Created by che on 15/12/1.
//  Copyright © 2015年 车. All rights reserved.
//

#import "HT_BaseViewController.h"
#import "UIViewController+MMDrawerController.h"
#import "MMDrawerBarButtonItem.h"
#import "HT_HomePageViewController.h"
@interface HT_BaseViewController ()

@end

@implementation HT_BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    MMDrawerBarButtonItem * leftDrawerButton = [[MMDrawerBarButtonItem alloc] initWithTarget:self action:@selector(leftDrawerButtonPress:)];
//    [leftDrawerButton setImage:[UIImage imageNamed:@"1"]];
    
    [self.navigationItem setLeftBarButtonItem:leftDrawerButton animated:YES];
    
    // Do any additional setup after loading the view.
}

-(void)leftDrawerButtonPress:(id)sender {
    HT_HomePageViewController *homePage = [[HT_HomePageViewController alloc] init];
    UINavigationController *centerNav = [[UINavigationController alloc] initWithRootViewController:homePage];
    [self.mm_drawerController setCenterViewController:centerNav withCloseAnimation:YES completion:nil];
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
