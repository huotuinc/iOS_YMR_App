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

#import "MMDrawerBarButtonItem.h"
@interface HT_HomePage_PersonViewTableViewController ()

@end

@implementation HT_HomePage_PersonViewTableViewController


-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden=NO;
    self.navigationController.navigationBar.translucent=NO;
    self.navigationController.navigationBar.barTintColor = NAVBARCOLOR1;
    [self createBarButtonItem];
    
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    MMDrawerBarButtonItem * leftDrawerButton = [[MMDrawerBarButtonItem alloc] initWithTarget:self action:@selector(leftDrawerButtonPress:)];
    [self.navigationItem setLeftBarButtonItem:leftDrawerButton animated:YES];
    self.navigationController.navigationBar.translucent=NO;
    [self setLabelTextAlignment];
}

-(void)createBarButtonItem{
    UIButton *buttonL=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 18, 18)];
    [buttonL setBackgroundImage:[UIImage imageNamed:@"common_title_top_back"] forState:UIControlStateNormal];
    [buttonL addTarget:self action:@selector(clickLightButton) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *bbiL=[[UIBarButtonItem alloc]initWithCustomView:buttonL];
    self.navigationItem.leftBarButtonItem=bbiL;
    
    UIButton *buttonR=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 18, 18)];
    [buttonR setBackgroundImage:[UIImage imageNamed:@"common_title_top_more"]forState:UIControlStateNormal];
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
    _labelScore.text=@"188";
    _labelRealName.text=@"发生";
    _labelSex.text=@"nan";
    _labelTel.text=@"1999999999";
    [_ImageVHead setImage:[UIImage imageNamed:@"1"]];
    [_imageVLevel setImage:[UIImage imageNamed:@"3"]];
    

}
#pragma mark - Table view data source
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==1) {
        if (indexPath.row==0) {
            HT_HomePage_PointsViewController *point=[[HT_HomePage_PointsViewController alloc]init];
            [self.navigationController pushViewController:point animated:YES];
        }
    }
    if(indexPath.section==2){
        if (indexPath.row==2) {
            HT_HomePage_PhoneViewController *phone=[[HT_HomePage_PhoneViewController alloc]init];
            [self.navigationController pushViewController:phone animated:YES];
        }
    }
    
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
