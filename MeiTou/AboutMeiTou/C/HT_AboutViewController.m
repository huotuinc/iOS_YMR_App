//
//  HT_AboutViewController.m
//  MeiTou
//
//  Created by che on 15/12/11.
//  Copyright © 2015年 车. All rights reserved.
//

#import "HT_AboutViewController.h"
#import "HT_About_CompanyViewController.h"

#import "HT_AboutTableViewCell.h"


static NSString *cellAbout=@"cellAbout";
@interface HT_AboutViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation HT_AboutViewController{
    UITableView *_tableView;
    NSMutableArray *_imageArray;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden=NO;
    self.navigationController.navigationBar.translucent=YES;
    [_tableView registerNib:[UINib nibWithNibName:@"HT_AboutTableViewCell" bundle:nil]forCellReuseIdentifier:cellAbout];
    [self createBarButtonItem];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _imageArray=[NSMutableArray arrayWithArray:@[@"meitou_center_company",@"meitou_center_president",@"meitou_center_college",@"meitou_center_knowledge"]];
    [self createTableView];
}
-(void)createBarButtonItem{
    UIButton *buttonL=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 18, 18)];
    [buttonL setBackgroundImage:[UIImage imageNamed:@"common_title_top_back"] forState:UIControlStateNormal];
    [buttonL addTarget:self action:@selector(clickLightButton) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *bbiL=[[UIBarButtonItem alloc]initWithCustomView:buttonL];
    self.navigationItem.leftBarButtonItem=bbiL;
    
    UIButton *buttonR=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 18, 18)];
    [buttonR setBackgroundImage:[UIImage imageNamed:@"cosmetology_main_menu_bottom_search"] forState:UIControlStateNormal];
    [buttonR addTarget:self action:@selector(clickRightButton) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *bbiR=[[UIBarButtonItem alloc]initWithCustomView:buttonR];
    self.navigationItem.rightBarButtonItem=bbiR;
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
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WITH , SCREEN_HEIGHT) style:UITableViewStylePlain];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    _tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableView];
    
}
#pragma mark UITableViewDelegate
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    HT_AboutTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellAbout forIndexPath:indexPath];
    cell.imageVMain.image=[UIImage imageNamed:_imageArray[indexPath.row]];
    return cell;
    
    
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_imageArray count];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return (NSInteger)_tableView.frame.size.height/[_imageArray count];
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row==0) {
        HT_About_CompanyViewController *company=[[HT_About_CompanyViewController alloc]init];
        [self.navigationController pushViewController:company animated:YES];
    }
    if (indexPath.row==1) {
        NSLog(@"点击了第2个");
    }
    if (indexPath.row==2) {
        NSLog(@"点击了第3个");
    }
    if (indexPath.row==3) {
        NSLog(@"点击了第4个");
    }
    
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
