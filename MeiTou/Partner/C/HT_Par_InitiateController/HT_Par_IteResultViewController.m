//
//  HT_Par_IteResultViewController.m
//  MeiTou
//
//  Created by che on 15/12/4.
//  Copyright © 2015年 车. All rights reserved.
//

#import "HT_Par_IteResultViewController.h"
#import "HT_Par_IteResultTableViewCell.h"

#import "HT_Par_IteResult_HeadView.h"
static NSString *cellIResult = @"cellIResult";

@interface HT_Par_IteResultViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation HT_Par_IteResultViewController{
    UITableView *_tableView;
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden=NO;
    self.navigationController.navigationBar.translucent=NO;
    [self changeNavigationBarLineHidden:NO];
    self.view.backgroundColor=[UIColor whiteColor];
    [_tableView registerNib:[UINib nibWithNibName:@"HT_Par_IteResultTableViewCell" bundle:nil]forCellReuseIdentifier:cellIResult];
    [self createBarButtonItem];
    
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createNavgationBarTitle];
    [self createTableView];
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
    titleLabel.text = @"本轮众筹结果";
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
-(void)clickRightButton{
    
}
-(void)createTableView{
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 5, SCREEN_WITH , SCREEN_HEIGHT-64) style:UITableViewStylePlain];
    _tableView.delegate=self;
    _tableView.dataSource=self;
_tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    [self.view addSubview:_tableView];
    
}
#pragma mark UITableViewDelegate
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *_cell;
    HT_Par_IteResultTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIResult forIndexPath:indexPath];
    if (indexPath.row==0) {
        for (int i=1; i<4; i++) {
            UIImageView *imageV=(UIImageView * )[cell viewWithTag:101+i];
            imageV.hidden=YES;
            
        }
        for (int i=1; i<4; i++) {
            UIImageView *imageV=(UIImageView * )[cell viewWithTag:111+i];
            imageV.hidden=YES;
            
        }
    }
    if (indexPath.row==1) {
        UIImageView *imageV=(UIImageView * )[cell viewWithTag:104];
        imageV.hidden=YES;
        UIImageView *imageVA=(UIImageView * )[cell viewWithTag:114];
        imageVA.hidden=YES;
        
    }
    if (indexPath.row==2) {
        for (int i=2; i<4; i++) {
            UIImageView *imageV=(UIImageView * )[cell viewWithTag:101+i];
            imageV.hidden=YES;

        }
        for (int i=2; i<4; i++) {
            UIImageView *imageV=(UIImageView * )[cell viewWithTag:111+i];
            imageV.hidden=YES;
            
        }
    }
    if (indexPath.row==3) {
        for (int i=1; i<4; i++) {
            UIImageView *imageV=(UIImageView * )[cell viewWithTag:101+i];
            imageV.hidden=YES;
            
        }
        for (int i=1; i<4; i++) {
            UIImageView *imageV=(UIImageView * )[cell viewWithTag:111+i];
            imageV.hidden=YES;
            
        }
    }
    
//    for (int i=0; i<5; i++) {
//        NSArray  *nib= [[NSBundle mainBundle]loadNibNamed:@"HT_Par_IteResult_HeadView" owner:nil options:nil];
//        HT_Par_IteResult_HeadView *headV=[nib firstObject];
//        headV.frame=CGRectMake(cell.ViewHeadGroup.frame.origin.x+cell.ViewHeadGroup.frame.size.width/5*i, 0, cell.ViewHeadGroup.frame.size.width/5, cell.ViewHeadGroup.frame.size.height);
//        //        headV.frame=CGRectMake(_ViewHeadGroup.frame.origin.x+_ViewHeadGroup.frame.size.width/5*(i%5), height*(i/5), _ViewHeadGroup.frame.size.width/5, height);
////        [cell.ViewHeadGroup layoutIfNeeded];
//        [cell.ViewHeadGroup addSubview:headV];
//    }
    
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    _cell=cell;
    return _cell;
    
    
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return SCREEN_HEIGHT/1100*187;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
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
