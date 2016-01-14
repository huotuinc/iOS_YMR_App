//
//  HT_HomePage_PersonViewTableViewController.m
//  MeiTou
//
//  Created by che on 15/12/1.
//  Copyright © 2015年 车. All rights reserved.
//

#import "HT_HomePage_PersonViewTableViewController.h"
#import "UIViewController+MMDrawerController.h"
#import "HT_HomePage_PointsViewController.h"
#import "HT_HomePageViewController.h"
#import "HT_HomePage_PhoneViewController.h"
#import "HT_HomePage_TopUpViewController.h"
#import "UserInfo.h"
#import "MMDrawerBarButtonItem.h"
@interface HT_HomePage_PersonViewTableViewController ()
@property (strong, nonatomic) NSArray *tasks;
@property (nonatomic, strong) UserInfo *user;

@end

@implementation HT_HomePage_PersonViewTableViewController


-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden=NO;
    self.navigationController.navigationBar.translucent=NO;
    [self changeNavigationBarLineHidden:NO];
    [self createBarButtonItem];
    
    NSString * path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *fileName = [path stringByAppendingPathComponent:WeiXinUserInfo];
    self.user = [NSKeyedUnarchiver unarchiveObjectWithFile:fileName];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    MMDrawerBarButtonItem * leftDrawerButton = [[MMDrawerBarButtonItem alloc] initWithTarget:self action:@selector(leftDrawerButtonPress:)];
    [self.navigationItem setLeftBarButtonItem:leftDrawerButton animated:YES];
    self.navigationController.navigationBar.translucent=NO;
    NSString * path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *fileName = [path stringByAppendingPathComponent:WeiXinUserInfo];
    self.user = [NSKeyedUnarchiver unarchiveObjectWithFile:fileName];
    
    [self setLabelTextAlignment];
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
    titleLabel.font = [UIFont boldSystemFontOfSize:FONT_SIZE(36)];
    titleLabel.textColor = [UIColor blackColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.text = @"个人中心";
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

-(void)leftDrawerButtonPress:(id)sender {
    HT_HomePageViewController *homePage = [[HT_HomePageViewController alloc] init];
    UINavigationController *centerNav = [[UINavigationController alloc] initWithRootViewController:homePage];
    [self.mm_drawerController setCenterViewController:centerNav withCloseAnimation:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setLabelTextAlignment{
    _labelRealName.textAlignment=NSTextAlignmentRight;
    _labelSex.textAlignment=NSTextAlignmentRight;
    _labelTel.textAlignment=NSTextAlignmentRight;
    _labelScore.textAlignment=NSTextAlignmentRight;
    
    
    
    /**
     *  假数据
     */
    _labelName.text=self.user.name;
    _labelScore.text=[NSString stringWithFormat:@"%@",self.user.score];
    _labelRealName.text=self.user.userName;
    if ([self.user.sex isEqualToNumber:[NSNumber numberWithInteger:1]] ) {
        _labelSex.text=@"未知";
    }else if ([self.user.sex isEqualToNumber:[NSNumber numberWithInteger:2]]){
        _labelSex.text=@"女";
    }else if ([self.user.sex isEqualToNumber:[NSNumber numberWithInteger:3]]){
        _labelSex.text=@"男";
    }
    if ([self.user.isBindMobile isEqualToString:@"0"]) {
        _labelTel.text=@"未绑定手机";
    }else{
        _labelTel.text=self.user.mobile;
    }
//    _labelLocation.text=self.user.name;
    [_ImageVHead sd_setImageWithURL:[NSURL URLWithString:self.user.headimgurl]];
    if ([self.user.userLevel.value isEqualToNumber:[NSNumber numberWithInteger:0]]) {
        _imageVLevel.image=[UIImage imageNamed:@"SlidingMenu_content_LV1"];
    }else if( [self.user.userLevel.value isEqualToNumber:[NSNumber numberWithInteger:1]]){
        _imageVLevel.image=[UIImage imageNamed:@"SlidingMenu_content_LV2"];
    }else if( [self.user.userLevel.value isEqualToNumber:[NSNumber numberWithInteger:2]]){
        _imageVLevel.image=[UIImage imageNamed:@"SlidingMenu_content_LV3"];
    }
    _ImageVHead.layer.cornerRadius=_ImageVHead.frame.size.width/2;
    
    /**
     *  设置label样式
     */
   
    [self changeLabel:_labelName AndFont:26 AndColor:COLOR_TEXT_TITILE];
    [self changeLabel:_labelA AndFont:28 AndColor:COLOR_TEXT_TITILE];
    [self changeLabel:_labelB AndFont:28 AndColor:COLOR_TEXT_TITILE];
    [self changeLabel:_labelC AndFont:28 AndColor:COLOR_TEXT_TITILE];
    [self changeLabel:_labelD AndFont:28 AndColor:COLOR_TEXT_TITILE];
    [self changeLabel:_labelE AndFont:28 AndColor:COLOR_TEXT_TITILE];
    [self changeLabel:_labelF AndFont:28 AndColor:COLOR_TEXT_TITILE];
    [self changeLabel:_labelG AndFont:28 AndColor:COLOR_TEXT_TITILE];
    [self changeLabel:_labelH AndFont:28 AndColor:COLOR_TEXT_TITILE];
    [self changeLabel:_labelI AndFont:28 AndColor:COLOR_TEXT_TITILE];
    [self changeLabel:_labelJ AndFont:28 AndColor:COLOR_TEXT_TITILE];
    [self changeLabel:_labelK AndFont:28 AndColor:COLOR_TEXT_TITILE];
    [self changeLabel:_labelL AndFont:28 AndColor:COLOR_TEXT_TITILE];
    [self changeLabel:_labelTel AndFont:28 AndColor:COLOR_TEXT_TITILE];
    [self changeLabel:_labelSex AndFont:28 AndColor:COLOR_TEXT_TITILE];
    [self changeLabel:_labelScore AndFont:28 AndColor:COLOR_TEXT_TITILE];
    [self changeLabel:_labelTel AndFont:28 AndColor:COLOR_TEXT_TITILE];
    [self changeLabel:_labelRealName AndFont:28 AndColor:COLOR_TEXT_TITILE];

    

}

#pragma mark 网络请求

- (void)changeUserProfile{
    
    NSMutableDictionary * dict = [NSMutableDictionary dictionary];
//    profileType - 上传类型：0：图片，1：昵称，2：姓名，3：性别，4：联系电话(绑定手机)，5：定位
    dict[@"profileType"] = @1;
    dict[@"profileData"] = @"luohaibo";
    dict[@"userId"] = self.user.userId;
    
    [UserLoginTool loginRequestGet:@"updateUserProfile" parame:dict success:^(NSDictionary* json) {//
        LWLog(@"init----%@",json);
        
        //        NSArray * users = [UserModel objectArrayWithKeyValuesArray:json[@"Userlist"]];
        
        
    } failure:^(NSError *error) {//
        LWLog(@"%@",error);
    }];
    
}



/**
 *  设置label的字体大小和颜色
 *
 *  @param label 更改的label
 *  @param font  整形(相对效果图的像素大小)
 *  @param color 颜色
 */
-(void)changeLabel:(UILabel *) label AndFont:(NSInteger) font AndColor:(UIColor *) color{
    label.font=[UIFont systemFontOfSize:FONT_SIZE(font)];
    label.textColor=color;
}
#pragma mark - Table view data source
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==1) {
        if (indexPath.row==0) {
            HT_HomePage_PointsViewController *point=[[HT_HomePage_PointsViewController alloc]init];
            [self.navigationController pushViewController:point animated:YES];
                    }
    }
    if(indexPath.section==1){
        if (indexPath.row==1) {
            HT_HomePage_TopUpViewController *point=[[HT_HomePage_TopUpViewController alloc]init];
            [self.navigationController pushViewController:point animated:YES];

        }
    }
    if (indexPath.section == 2) {
        if (indexPath.row == 0) {
            [self changeUserProfile];
        }
    }
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 12.50;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 1.00;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *view=[[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WITH, 5)];
    return view;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *view=[[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WITH, 1)];
    return view;
}
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
//    return 0;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
//    return 0;
//}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
