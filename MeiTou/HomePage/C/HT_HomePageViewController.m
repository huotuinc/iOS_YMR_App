
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
#import "HT_AboutViewController.h"
#import "HT_HomePage_ChangeViewController.h"
#import "HT_HomePage_PersonViewTableViewController.h"
#import "UIViewController+MMDrawerController.h"
#import "MMDrawerBarButtonItem.h"//第三方封装的头文件

#import "HT_HomePage_ChangeIDCView.h"



#import "HT_HomePageLayout.h"

static NSString *RFIdentifier = @"RFIdentifier";

@interface HT_HomePageViewController () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *myCollectionView;
//@property (strong,nonatomic) UIPageControl *pageCtrl;


/**返回按钮*/
@property (nonatomic,strong) UIButton * leftOption;


@end

@implementation HT_HomePageViewController{
    NSMutableArray *_imageArray;
    HT_HomePage_ChangeIDCView *_changeView;
    UIView *_backView; //提示框父视图
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden=NO;
    self.navigationController.navigationBar.translucent=NO;
    self.navigationController.navigationBar.backgroundColor=COLOR_NAVBAR_A;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _imageArray=[NSMutableArray arrayWithArray:@[@"home_center_imge_1",@"home_center_imge_2",@"home_center_imge_3"]];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.leftOption];
    [self.myCollectionView registerNib:[UINib nibWithNibName:@"HT_HomePageCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:RFIdentifier];
    [self createCollectionView];
//    [self createPageControl];
    
   
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(pushToPartner) name:@"partner" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(pushToInformation) name:@"information" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(pushToAbout) name:@"about" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(pushToPerson) name:@"person" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(pushToChange) name:@"change" object:nil];

    
}
-(void)pushToPerson{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    HT_HomePage_PersonViewTableViewController * person = [storyboard instantiateViewControllerWithIdentifier:@"HT_HomePage_PersonViewTableViewController"];
    [self.navigationController pushViewController:person animated:YES];
}
-(void)pushToAbout{
    HT_AboutViewController *about = [[HT_AboutViewController alloc] init];
    [self.navigationController pushViewController:about animated:YES];
}
- (void)pushToPartner {
    HT_PartnerViewController *partner = [[HT_PartnerViewController alloc] init];
    [self.navigationController pushViewController:partner animated:YES];
}
-(void)pushToInformation{
    HT_InformationViewController *information = [[HT_InformationViewController alloc] init];
    [self.navigationController pushViewController:information animated:YES];
}
-(void)pushToChange{
    [self createChangeView];
}

-(void)createChangeView{
    
    NSArray *nib=[[NSBundle mainBundle]loadNibNamed:@"HT_HomePage_ChangeIDCView" owner:nil options:nil];
    _changeView=[nib firstObject];
    
    _backView= [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    _backView.backgroundColor = [UIColor colorWithWhite:0.000 alpha:0.800];
    _backView.userInteractionEnabled = YES;
    _changeView.frame = CGRectMake(_backView.frame.size.width/640*(640/2-455/2), _backView.frame.size.height/1330*(1330/2-550/2), _backView.frame.size.width/640*455, _backView.frame.size.height/1330*550);
    _changeView.labelAccountA.userInteractionEnabled=YES;
    UITapGestureRecognizer *tapA=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapTheLabeAccountA)];
    [_changeView.labelAccountA addGestureRecognizer:tapA];
    
    [[UIApplication sharedApplication].keyWindow addSubview:_backView];
    [_backView addSubview:_changeView];
    
    
}

/**
 *  Description
 */
//-(void)createPageControl
//{
//    self.myCollectionView.delegate = self;
//    //uiview的子类
//    _pageCtrl = [[UIPageControl alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT-100, SCREEN_WITH, 10)];
//    _pageCtrl.backgroundColor = [UIColor blackColor];
//    _pageCtrl.numberOfPages = 3;//设置页数
//    _pageCtrl.alpha = 0.5;
//    _pageCtrl.currentPage = 0;//设置默认页数
//    _pageCtrl.backgroundColor=[UIColor redColor];
//    [self.view addSubview:_pageCtrl];
//    //UIControlEventValueChanged 点击方法
//    [_pageCtrl addTarget:self action:@selector(pagechanged:) forControlEvents:UIControlEventTouchUpInside];
//    
//}

-(void)createCollectionView{
    _myCollectionView.collectionViewLayout = [[HT_HomePageLayout alloc] init];
    _myCollectionView.backgroundColor = [UIColor clearColor];
    _myCollectionView.showsHorizontalScrollIndicator = NO;
//    [_myCollectionView setBackgroundColor:[UIColor redColor]];
//    _myCollectionView.backgroundColor = [UIColor colorWithPatternImage: [UIImage imageNamed:@"meitou_center_knowledge"] ];
    

}
/**
 *  Description
 *
 *  @param page <#page description#>
 */
//-(void)pagechanged:(UIPageControl *)page
//{
//    if(_myCollectionView.contentOffset.x == 2 * SCREEN_WITH)
//    {
//        [_myCollectionView setContentOffset:CGPointMake(3 *SCREEN_WITH, 0) animated:YES];
//        _pageCtrl.currentPage = 0;
//        return;
//    }
//    //需要获取改变后的ContentOffset.x 通过currentPage
//    [_myCollectionView setContentOffset:CGPointMake(_pageCtrl.currentPage *SCREEN_WITH, 0) animated:YES];
//}

- (UIButton *)leftOption{
    
    if (_leftOption == nil) {
        _leftOption = [[UIButton alloc] init];
        _leftOption.frame = CGRectMake(0, 0, 25, 25);
//        _leftOption.backgroundColor=[UIColor redColor];
        [_leftOption setBackgroundImage:[UIImage imageNamed:@"common_icon_catalog"] forState:UIControlStateNormal];        [_leftOption addTarget:self action:@selector(GoToLeft) forControlEvents:UIControlEventTouchUpInside];
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

-(void)tapTheLabeAccountA{
    _backView.hidden=YES;
}
#pragma mark UITableViewDelegate

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [_imageArray count];
}

- (UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    HT_HomePageCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:RFIdentifier forIndexPath:indexPath];
    cell.imageVCover.image=[UIImage imageNamed:[NSString stringWithFormat:@"%@",_imageArray[indexPath.row]]];
    return cell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row==0) {
        HT_PartnerViewController *partner=[[HT_PartnerViewController alloc]init];
        [self.navigationController pushViewController:partner animated:YES];
    }
    if (indexPath.row==1) {
        HT_InformationViewController *information=[[HT_InformationViewController alloc]init];
        [self.navigationController pushViewController:information animated:YES];
    }
    if (indexPath.row==2) {
        HT_AboutViewController *about=[[HT_AboutViewController alloc]init];
        [self.navigationController pushViewController:about animated:YES];
    }
    
}
/**
 *  /
 *
 *  @param collectionView <#collectionView description#>
 *  @param cell           <#cell description#>
 *  @param indexPath      <#indexPath description#>
 */
//-(void)collectionView:(UICollectionView *)collectionView didEndDisplayingCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath{
//    //滑动的时候改变 页数
//    //通过ContentOffset.x 改变currentPage
//    if (_myCollectionView.contentOffset.x == 3*SCREEN_WITH) {
//        _myCollectionView.contentOffset = CGPointZero;
//    }
//    _pageCtrl.currentPage = _myCollectionView.contentOffset.x/SCREEN_WITH;
//
//    
//
//}
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
