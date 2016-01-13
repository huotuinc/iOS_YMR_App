//
//  HT_Infor_ShareViewController.m
//  MeiTou
//
//  Created by che on 15/12/10.
//  Copyright © 2015年 车. All rights reserved.
//

#import "HT_Infor_ShareViewController.h"
#import "UserInfo.h"
#import "HT_Infor_ShareCView.h"
#import "ImageHandleView.h"
@interface HT_Infor_ShareViewController ()<UINavigationControllerDelegate,UIImagePickerControllerDelegate,UIActionSheetDelegate,UITextFieldDelegate,UITextViewDelegate>

@property (nonatomic, strong) NSString *showHeadUrl;

@property (nonatomic, strong) NSString *returnHeadUrl;

@property (nonatomic, strong) UserInfo *user;

@property (nonatomic, strong) ImageHandleView *temView;
@end

@implementation HT_Infor_ShareViewController{
    HT_Infor_ShareCView *_mainView;
    
    CGFloat _height;
    CGFloat _time;
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden=NO;
    self.navigationController.navigationBar.translucent=NO;
    self.view.backgroundColor=COLOR_BACK_MAIN;
    [self createBarButtonItem];
    
    NSString * path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *fileName = [path stringByAppendingPathComponent:WeiXinUserInfo];
    self.user = [NSKeyedUnarchiver unarchiveObjectWithFile:fileName];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(KeyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(KeyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createNavgationBarTitle];
    [self createMainView];
//    self.temView=[[ImageHandleView alloc]initWithFrame:self.view.frame image:[UIImage imageNamed:@"aboutMT1"] isCircle:YES];
//    [self.view addSubview:_temView];
    
    self.showHeadUrl = [NSString string];
    self.returnHeadUrl = [NSString string];
    
    
    
}
-(void)createNavgationBarTitle{
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 44)];
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.font = [UIFont boldSystemFontOfSize:FONT_SIZE(32)];
    titleLabel.textColor = [UIColor blackColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.text = @"我要分享";
    self.navigationItem.titleView = titleLabel;
}
-(void)createBarButtonItem{
    UIButton *buttonL=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WITH/640*110 , 30)];
    [buttonL setBackgroundColor:[UIColor clearColor]];
    [buttonL setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
     [buttonL setTitle:@"取消" forState:UIControlStateNormal];
    [buttonL addTarget:self action:@selector(clickLightButton) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *bbiL=[[UIBarButtonItem alloc]initWithCustomView:buttonL];
    self.navigationItem.leftBarButtonItem=bbiL;
//    
    UIButton *buttonR=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WITH/640*110 , 30)];
    [buttonR setBackgroundColor:COLOR_BUTTON_RED];
    [buttonR setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];

    [buttonR setTitle:@"发表" forState:UIControlStateNormal];
    [buttonR addTarget:self action:@selector(clickRightButton) forControlEvents:UIControlEventTouchUpInside];
    buttonR.layer.cornerRadius=3;
    buttonR.layer.masksToBounds=YES;
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
    [self addShareinfoMation];
}

-(void)createMainView{
    
    NSArray *nib=[[NSBundle mainBundle]loadNibNamed:@"HT_Infor_ShareCView" owner:nil options:nil];
    _mainView=[nib firstObject];
    _mainView.frame=CGRectMake(0, 0, SCREEN_WITH, SCREEN_HEIGHT/1150*800);
    [_mainView.buttonAdd addTarget:self action:@selector(addImageClick) forControlEvents:UIControlEventTouchUpInside];
//    _mainView.textFTitle.delegate=self;
//    _mainView.textV.delegate=self;
    
    
    [self.view addSubview:_mainView];
    
}

- (void)addImageClick {
    
    UIActionSheet * aa = [[UIActionSheet alloc] initWithTitle:@"选择图片来源" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"相册",@"相机", nil];
    [aa showInView:self.view];
    
}


#pragma 拍照
/**
 *  拍照
 *
 *  @param picker
 *  @param info
 */
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    
    NSString *mediaType = [info objectForKey:UIImagePickerControllerMediaType];
    
    UIImage *photoImage = nil;
    if ([mediaType isEqualToString:(NSString *)kUTTypeImage]){
        // 判断，图片是否允许修改
        if ([picker allowsEditing]){
            //获取用户编辑之后的图像
            photoImage = [info objectForKey:UIImagePickerControllerEditedImage];
        } else {
            // 照片的元数据参数
            photoImage = [info objectForKey:UIImagePickerControllerOriginalImage];
        }
    }
//    self.iconView.image = photoImage;
    NSData *data = nil;
    if (UIImagePNGRepresentation(photoImage) == nil) {
        
        data = UIImageJPEGRepresentation(photoImage, 1);
        
    } else {
        
        data = UIImagePNGRepresentation(photoImage);
    }
    
    NSString * imagefile = [data base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    [picker dismissViewControllerAnimated:YES completion:^{
        NSMutableDictionary * params = [NSMutableDictionary dictionary];

        params[@"profileData"] = imagefile;
        
        [UserLoginTool loginRequestPostWithFile:@"uploadShareImg" parame:params success:^(id json) {

            if ([json[@"systemResultCode"] intValue] ==1&&[json[@"resultCode"] intValue] == 1) {
                
                self.showHeadUrl = json[@"resultData"][@"data"];
                self.returnHeadUrl = json[@"resultData"][@"relativeUrl"];
                
#warning -增加网络加载图片
                
            }else {
                
            }
            
        } failure:^(NSError *error) {


        } withFileKey:@"profileData"];
        
    }];
    
}
/**
 *  取消拍照
 *
 *  @param picker
 */
-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    
    [picker dismissViewControllerAnimated:YES completion:nil];
}

/**
 *    相机掉出
 *
 *  @param actionSheet <#actionSheet description#>
 *  @param buttonIndex <#buttonIndex description#>
 */
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 0) {
        UIImagePickerController * pc = [[UIImagePickerController alloc] init];
        pc.sourceType=UIImagePickerControllerSourceTypePhotoLibrary;
        pc.delegate = self;
        pc.allowsEditing = YES;
       
        [self presentViewController:pc animated:YES completion:nil];
        
    }else if(buttonIndex == 1) {
        
        UIImagePickerController * pc = [[UIImagePickerController alloc] init];
        pc.allowsEditing = YES;
        pc.sourceType=UIImagePickerControllerSourceTypeCamera;
        pc.delegate = self;
        [self presentViewController:pc animated:YES completion:nil];
    }
}


/**
 *  发布分享内容
 */
- (void)addShareinfoMation {
    
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    dic[@"title"] = @"12312312";
    dic[@"content"] = @"hello world！";
    dic[@"imgUrl"] = self.returnHeadUrl;
    dic[@"userId"] = self.user.userId;
//#warning 用户id修改
    
    [UserLoginTool  loginRequestPostWithFile:@"addShare" parame:dic success:^(id json) {
        LWLog(@"%@",json);
        if ([json[@"systemResultCode"] intValue] ==1&&[json[@"resultCode"] intValue] == 1) {
            LWLog(@"%@",json[@"resultDescription"]);
            
#warning 操作成功提示
            [self.navigationController popViewControllerAnimated:YES];
            
        }else {
            LWLog(@"%@",json[@"resultDescription"]);
        }
    } failure:^(NSError *error) {
        LWLog(@"%@",error );
    } withFileKey:nil];
    
    
}
-(void)KeyboardWillShow:(NSNotification *)sender
{
    CGRect rect  = [[sender.userInfo objectForKey:UIKeyboardFrameEndUserInfoKey]CGRectValue];
    CGFloat height =  rect.size.height;
    NSLog(@"height--------%f",height);
    //    UIKeyboardAnimationDurationUserInfoKey 获取键盘升起动画时间
    [UIView beginAnimations:nil context:nil];
    //    [[sender.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey]doubleValue] 获取动画时间;
    [UIView setAnimationDuration:[[sender.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey]doubleValue]
     ];
//    self.view.transform = CGAffineTransformMakeTranslation(0, -height);
    [UIView commitAnimations];//开始执行动画
    //    UITextField *textField  = (id)[self.view viewWithTag:TextTag];
    //    textField.frame = CGRectMake(10, screenH-45-rect.size.height, screenW-20, 45);
}
-(void)KeyboardWillHide:(NSNotification *)sender
{
    CGRect rect  = [[sender.userInfo objectForKey:UIKeyboardFrameEndUserInfoKey]CGRectValue];
    CGFloat height =  rect.size.height;
    NSLog(@"height--------%f",height);
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:[[sender.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey]doubleValue]];
    self.view.transform = CGAffineTransformIdentity; //重置状态
    [UIView commitAnimations];
    //    UITextField *textField  = (id)[self.view viewWithTag:TextTag];
    //    textField.frame = CGRectMake(10, screenH-45, screenW-20, 45);
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
//    [_mainView.textFTitle resignFirstResponder];
//    [_mainView.textV resignFirstResponder];
    UITextField *text  = [_mainView viewWithTag:200];
    [text resignFirstResponder];
    
    
    
}
-(void)logoClick{
    UIImagePickerController *imageP=[[UIImagePickerController alloc]init];
    imageP.sourceType=UIImagePickerControllerSourceTypePhotoLibrary;
    imageP.allowsEditing=YES;
    imageP.delegate=self;
    [self presentViewController:imageP animated:YES completion:nil];
}
//-(void)textFieldDidEndEditing:(UITextField *)textField{
//    [textField resignFirstResponder];
//}

///**
// *  键盘监听
// *
// *  @param sender <#sender description#>
// */
//-(void)KeyboardWillShow:(NSNotification *)sender
//{
//    CGRect rect  = [[sender.userInfo objectForKey:UIKeyboardFrameEndUserInfoKey]CGRectValue];
//    CGFloat height =  rect.size.height;
//    _height=height;
//    [UIView beginAnimations:nil context:nil];
//    _time= [[sender.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey]doubleValue]; //获取动画时间;
//    [UIView setAnimationDuration:[[sender.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey]doubleValue]
//     ];
//    [UIView commitAnimations];//开始执行动画
//}
//
//-(void)KeyboardWillHide:(NSNotification *)sender
//{
//    [UIView beginAnimations:nil context:nil];
//    [UIView setAnimationDuration:[[sender.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey]doubleValue]];
//    [UIView commitAnimations];
//    
//}
//-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
//{
//    [_mainView.textFTitle resignFirstResponder];
//    [_mainView.textV resignFirstResponder];
//}
//-(void)textViewDidBeginEditing:(UITextView *)textView{
//    [UIView animateWithDuration:_time animations:^{
//        [_mainView.textV becomeFirstResponder];
////        _replyView.frame=CGRectMake(0, SCREEN_HEIGHT-_height-50-64, SCREEN_WITH, 50);
////        _bottomView.hidden=YES;
////        [_tableView setContentOffset:CGPointMake(0, _allCellHeight-_height-50) animated:YES];
//    }];
//
//
//}
//-(void)textFieldDidBeginEditing:(UITextField *)textField{
////    [UIView animateWithDuration:_time animations:^{
////        [_mainView.textFTitle becomeFirstResponder];
////
////    }];
//
//
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
