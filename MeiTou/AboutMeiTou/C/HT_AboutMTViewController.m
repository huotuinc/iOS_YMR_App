
//
//  RFViewController.m
//  RFCircleCollectionView
//
//  Created by Arvin on 15/11/25.
//  Copyright © 2015年 mobi.refine. All rights reserved.
//

#import "HT_AboutMTViewController.h"
#import "HT_AboutMTCView.h"
#import "HT_AboutMTLayout.h"

static NSString *RFIdentifier = @"RFIdentifier";

@interface HT_AboutMTViewController () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *myCollectionView;
//@property (strong,nonatomic) UIPageControl *pageCtrl;





@end

@implementation HT_AboutMTViewController{
    NSMutableArray *_imageArray;
    UIView *_backView; //提示框父视图
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden=NO;
    self.navigationController.navigationBar.translucent=NO;
    [self changeNavigationBarLineHidden:NO];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor=[UIColor whiteColor];
    _imageArray=[NSMutableArray arrayWithArray:@[@"aboutMT1",@"aboutMT2",@"aboutMT3"]];

    [self.myCollectionView registerNib:[UINib nibWithNibName:@"HT_HomePageCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:RFIdentifier];
    [self createCollectionView];
    [self createBarButtonItem];
    [self createNavgationBarTitle];
   


    
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
    titleLabel.text = @"关于美投";
    self.navigationItem.titleView = titleLabel;
}
-(void)createBarButtonItem{
    UIButton *buttonL=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 18, 18)];
    [buttonL setBackgroundImage:[UIImage imageNamed:@"common_title_top_back"] forState:UIControlStateNormal];
    [buttonL addTarget:self action:@selector(clickLightButton) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *bbiL=[[UIBarButtonItem alloc]initWithCustomView:buttonL];
    self.navigationItem.leftBarButtonItem=bbiL;
    

}
-(void)clickLightButton{
    [self.navigationController popViewControllerAnimated:YES];

}

-(void)createCollectionView{
    _myCollectionView.collectionViewLayout = [[HT_AboutMTLayout alloc] init];
    _myCollectionView.backgroundColor = [UIColor clearColor];
    _myCollectionView.showsHorizontalScrollIndicator = NO;
//    [_myCollectionView setBackgroundColor:[UIColor redColor]];
//    _myCollectionView.backgroundColor = [UIColor colorWithPatternImage: [UIImage imageNamed:@"meitou_center_knowledge"] ];
    

}




#pragma mark UITableViewDelegate

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [_imageArray count];
}

- (UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    HT_AboutMTCView *cell = [collectionView dequeueReusableCellWithReuseIdentifier:RFIdentifier forIndexPath:indexPath];
    cell.imageVCover.image=[UIImage imageNamed:[NSString stringWithFormat:@"%@",_imageArray[indexPath.row]]];
    return cell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row==0) {
//        HT_PartnerViewController *partner=[[HT_PartnerViewController alloc]init];
//        [self.navigationController pushViewController:partner animated:YES];
    }
    if (indexPath.row==1) {
//        HT_InformationViewController *information=[[HT_InformationViewController alloc]init];
//        [self.navigationController pushViewController:information animated:YES];
    }
    if (indexPath.row==2) {
//        HT_AboutViewController *about=[[HT_AboutViewController alloc]init];
//        [self.navigationController pushViewController:about animated:YES];
    }
    
}

-(void)collectionView:(UICollectionView *)collectionView didEndDisplayingSupplementaryView:(UICollectionReusableView *)view forElementOfKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)indexPath{
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
