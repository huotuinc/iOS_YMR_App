//
//  HT_Infor_ShareViewController.m
//  MeiTou
//
//  Created by che on 15/12/10.
//  Copyright © 2015年 车. All rights reserved.
//

#import "HT_Infor_ShareViewController.h"

#import "HT_Infor_ShareCView.h"

@interface HT_Infor_ShareViewController ()<UINavigationControllerDelegate,UIImagePickerControllerDelegate,UIActionSheetDelegate>

@property (nonatomic, strong) NSString *showHeadUrl;

@property (nonatomic, strong) NSString *returnHeadUrl;

@end

@implementation HT_Infor_ShareViewController{
    HT_Infor_ShareCView *_mainView;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden=NO;
    self.navigationController.navigationBar.translucent=NO;
    self.view.backgroundColor=[UIColor whiteColor];
    [self createBarButtonItem];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createMainView];
    
    self.showHeadUrl = [NSString string];
    self.returnHeadUrl = [NSString string];
    
}
-(void)createBarButtonItem{
    UIButton *buttonL=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WITH/640*110 , 30)];
    [buttonL setBackgroundColor:COLOR_NAVBAR_A];
    [buttonL setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
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
    _mainView.frame=CGRectMake(0, 0, SCREEN_WITH, SCREEN_HEIGHT-64);
    [_mainView.buttonAdd addTarget:self action:@selector(addImageClick) forControlEvents:UIControlEventTouchUpInside];
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
                
#pragma mark -增加网络加载图片
                
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


- (void)addShareinfoMation {
    
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    dic[@"title"] = @"12312312";
    dic[@"content"] = @"hello world！";
    dic[@"imgUrl"] = self.returnHeadUrl;
    dic[@"userId"] = @5678;
#warning 用户id修改
    
    [UserLoginTool  loginRequestPostWithFile:@"addShare" parame:dic success:^(id json) {
        LWLog(@"%@",json);
        if ([json[@"systemResultCode"] intValue] ==1&&[json[@"resultCode"] intValue] == 1) {
            LWLog(@"%@",json[@"resultDescription"]);
            
#pragma mark 操作成功提示
            [self.navigationController popViewControllerAnimated:YES];
            
        }else {
            LWLog(@"%@",json[@"resultDescription"]);
        }
    } failure:^(NSError *error) {
        LWLog(@"%@",error );
    } withFileKey:nil];
    
    
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
