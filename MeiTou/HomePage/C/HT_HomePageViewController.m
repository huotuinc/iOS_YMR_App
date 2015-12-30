//
//  HT_HomePageViewController.m
//  MeiTou
//
//  Created by che on 15/12/29.
//  Copyright © 2015年 车. All rights reserved.
//

#import "HT_HomePageViewController.h"
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

#import "HT_HomePage_NavTitleCVIew.h"



@interface HT_HomePageViewController ()<UIScrollViewDelegate>

/**返回按钮*/
@property (nonatomic,strong) UIButton * leftOption;



@end

@implementation HT_HomePageViewController{
    UIScrollView *_scrollview;
    HT_HomePage_NavTitleCVIew *_navView;
    HT_HomePage_ChangeIDCView *_changeView;
    
    UIImageView *navBarHairlineImageView;
    
    UIView *_backView; //提示框父视图
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    
//    navBarHairlineImageView.hidden = YES;
    
//    self.navigationController.navigationBar.backIndicatorImage = [UIImage new];
    
    
//    [self navigationBarLineHidden:YES];
    
    UINavigationBar *navigationBar = self.navigationController.navigationBar;
//     white.png图片自己下载个纯白色的色块，或者自己ps做一个
    [navigationBar setBackgroundImage:[UIImage imageNamed:@"xiand"]
                       forBarPosition:UIBarPositionAny
                           barMetrics:UIBarMetricsDefault];
    [navigationBar setShadowImage:[UIImage new]];
}

- (void)navigationBarLineHidden:(BOOL)hidden {
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

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    

    self.navigationController.navigationBar.hidden=NO;
    self.navigationController.navigationBar.barTintColor=[UIColor whiteColor];
    self.navigationController.navigationBar.translucent=NO;

    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.leftOption];
    [self createNavTitleView];

    [self createScrollview];//创建 scrollview
    [self createData];
    NSLog(@"*** %f ***",self.navigationController.navigationBar.frame.size.height);


    
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
/**
 *  实现找出底部横线的函数
 *
 *  @param view <#view description#>
 *
 *  @return <#return value description#>
 */
- (UIImageView *)findHairlineImageViewUnder:(UIView *)view {
    if ([view isKindOfClass:UIImageView.class] && view.bounds.size.height <= 1.0) {
        return (UIImageView *)view;
    }
    for (UIView *subview in view.subviews) {
        UIImageView *imageView = [self findHairlineImageViewUnder:subview];
        if (imageView) {
            return imageView;
        }
    }
    return nil;
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
-(void)createData
{
    
    for (int i = 0; i < 3; i ++) {
        //在 contentsize 范围内创建2张图片
        UIImageView *_imageV  = [[UIImageView alloc]initWithFrame:CGRectMake(i*SCREEN_WITH, 0, SCREEN_WITH, SCREEN_HEIGHT/1150*1050)];
        _imageV.userInteractionEnabled=YES;
        if (i==0) {
            _imageV.image=[UIImage imageNamed:@"meitou_home_a"];
            UITapGestureRecognizer * tapImageVA = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(pushToInformation)];
            [_imageV addGestureRecognizer:tapImageVA];
        }
        if (i==1) {
            _imageV.image=[UIImage imageNamed:@"meitou_home_b"];
            UITapGestureRecognizer * tapImageVB = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(pushToPartner)];
            [_imageV addGestureRecognizer:tapImageVB];
        }
        if (i==2) {
            _imageV.image=[UIImage imageNamed:@"meitou_home_a"];

        }

        [_scrollview addSubview:_imageV];
    }
}
-(void)createNavTitleView{
    NSArray *nib=[[NSBundle mainBundle]loadNibNamed:@"HT_HomePage_NavTitleCVIew" owner:nil options:nil];
    _navView=[nib firstObject];
    _navView.labelA.text=@"美容咨询";
    _navView.labelB.text=@"财经资讯";
    _navView.imageVLineC.hidden=YES;
    _navView.imageVLineD.hidden=YES;
    UITapGestureRecognizer * tapA = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapTheProjectView)];
    [_navView.viewA addGestureRecognizer:tapA];
    UITapGestureRecognizer * tapB = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapTheNewsView)];
    [_navView.viewB addGestureRecognizer:tapB];
    _navView.frame=CGRectMake(0, 0, SCREEN_WITH/750*430, SCREEN_HEIGHT/1150*46);
    self.navigationItem.titleView=_navView;
}
-(void)createScrollview
{
    _scrollview = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WITH, SCREEN_HEIGHT)];
    _scrollview.backgroundColor=[UIColor whiteColor];
    //设置 contentsize 等于3张图片大小
    _scrollview.contentSize = CGSizeMake(3*SCREEN_WITH, SCREEN_HEIGHT);
    _scrollview.pagingEnabled = YES;//按页滚动
    _scrollview.bounces = NO;
    _scrollview.delegate = self;
    NSLog(@"-------------- %f *****************",_scrollview.contentOffset.x);
    [self.view addSubview:_scrollview];
    
}

- (UIButton *)leftOption{
    
    if (_leftOption == nil) {
        _leftOption = [[UIButton alloc] init];
        _leftOption.frame = CGRectMake(0, 0, 18, 18);
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
-(void)tapTheProjectView{
    _scrollview.contentOffset = CGPointZero;
    for (int i=0; i<2; i++) {
        UIImageView *imageV=(UIImageView *)[_navView viewWithTag:402+i];
        imageV.hidden=YES;
    }
    for (int i=0; i<2; i++) {
        UIImageView *imageV=(UIImageView *)[_navView viewWithTag:400+i];
        imageV.hidden=NO;
    }

}
-(void)tapTheNewsView{
    _scrollview.contentOffset = CGPointMake(SCREEN_WITH, 0);
    for (int i=0; i<2; i++) {
        UIImageView *imageV=(UIImageView *)[_navView viewWithTag:400+i];
        imageV.hidden=YES;
    }
    for (int i=0; i<2; i++) {
        UIImageView *imageV=(UIImageView *)[_navView viewWithTag:402+i];
        imageV.hidden=NO;
    }
}
//-(void)tapTheImageVA{
//    HT_InformationViewController *infor=[[[HT_InformationViewController alloc]init];
//    [self.navigationController pushViewController:infor animated:YES];
//}

-(void)tapTheLabeAccountA{
    _backView.hidden=YES;
}
#pragma mark  代理方法
//结束减速的时候通过ContentOffset.x改变当前页数
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    //滑动的时候改变 页数
    //通过ContentOffset.x 改变currentPage
    if (_scrollview.contentOffset.x == 2*self.view.bounds.size.width) {
        _scrollview.contentOffset = CGPointZero;
    }
    if (_scrollview.contentOffset.x == SCREEN_WITH) {
        for (int i=0; i<2; i++) {
            UIImageView *imageV=(UIImageView *)[_navView viewWithTag:400+i];
             imageV.hidden=YES;
        }
        for (int i=0; i<2; i++) {
            UIImageView *imageV=(UIImageView *)[_navView viewWithTag:402+i];
            imageV.hidden=NO;
        }
    }else{
        for (int i=0; i<2; i++) {
            UIImageView *imageV=(UIImageView *)[_navView viewWithTag:402+i];
            imageV.hidden=YES;
        }
        for (int i=0; i<2; i++) {
            UIImageView *imageV=(UIImageView *)[_navView viewWithTag:400+i];
            imageV.hidden=NO;
        }
    }
    
}
-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    //有动画效果的时候 才执行这里 无动画切换到真正的第一页
    if (_scrollview.contentOffset.x == 2 * self.view.bounds.size.width) {
        _scrollview.contentOffset = CGPointZero;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//- (void)viewWillDisappear:(BOOL)animated {
//    [super viewWillDisappear:animated];
//    navBarHairlineImageView.hidden = NO;
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
