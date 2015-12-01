
//
//  RFViewController.m
//  RFCircleCollectionView
//
//  Created by Arvin on 15/11/25.
//  Copyright © 2015年 mobi.refine. All rights reserved.
//

#import "HT_HomePageViewController.h"
#import "HT_HomePage_LeftViewController.h"
#import "HT_HomePageCollectionViewCell.h"
#import "HT_PartnerViewController.h"
#import "HT_InformationViewController.h"
#import "HT_AboutMeiTouViewController.h"
#import "HT_HomePage_PersonViewTableViewController.h"
#import "UIViewController+MMDrawerController.h"
#import "MMDrawerBarButtonItem.h"//第三方封装的头文件



#import "HT_HomePageLayout.h"

static NSString *RFIdentifier = @"RFIdentifier";

@interface HT_HomePageViewController () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *myCollectionView;

/**返回按钮*/
@property (nonatomic,strong) UIButton * leftOption;


@end

@implementation HT_HomePageViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden=NO;
    self.navigationController.navigationBar.translucent=NO;
    
    
    
    
    }

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.leftOption];

    
    
    [self.myCollectionView registerNib:[UINib nibWithNibName:@"HT_HomePageCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:RFIdentifier];
    self.myCollectionView.collectionViewLayout = [[HT_HomePageLayout alloc] init];
    self.myCollectionView.backgroundColor = [UIColor clearColor];
    self.myCollectionView.showsHorizontalScrollIndicator = NO;

    
}


- (UIButton *)leftOption{
    
    if (_leftOption == nil) {
        _leftOption = [[UIButton alloc] init];
        _leftOption.frame = CGRectMake(0, 0, 25, 25);
        _leftOption.backgroundColor=[UIColor redColor];
        [_leftOption addTarget:self action:@selector(GoToLeft) forControlEvents:UIControlEventTouchUpInside];
        [_leftOption setBackgroundImage:[UIImage imageNamed:@"HT_HomePage_LeftViewController"] forState:UIControlStateNormal];
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:_leftOption];
    }
    return _leftOption;
}
/**
 *  去左侧
 */
- (void)GoToLeft{
    
    [self.mm_drawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:^(BOOL finished) {
        
    }];
}
#pragma mark UITableViewDelegate

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 3;
}

- (UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    HT_HomePageCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:RFIdentifier forIndexPath:indexPath];
    return cell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"点击了第%ld个图",indexPath.row);
    if (indexPath.row==0) {
        HT_PartnerViewController *partner=[[HT_PartnerViewController alloc]init];
        [self.navigationController pushViewController:partner animated:YES];
    }
    if (indexPath.row==1) {
        HT_InformationViewController *information=[[HT_InformationViewController alloc]init];
        [self.navigationController pushViewController:information animated:YES];
    }
    if (indexPath.row==2) {

        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        HT_HomePage_PersonViewTableViewController * home = [storyboard instantiateViewControllerWithIdentifier:@"HT_HomePage_PersonViewTableViewController"];
        [self.navigationController pushViewController:home animated:YES];
    }
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
