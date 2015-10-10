//
//  RegisterViewController.m
//  o2oserviceMV
//
//  Created by 李晓勇 on 15/7/10.
//  Copyright (c) 2015年 李工. All rights reserved.
//

#import "RegisterViewController.h"


#define Height (DeviceHeight==480?0:30)
#define Height1 (DeviceHeight==480?35:40)
@interface RegisterViewController ()<UITextFieldDelegate>

{
    UIView      *_rootView;
    UIImageView *_stateImgV;
    UIImageView *_navImageView;
    UITextField *_titleField;
    UITextField *_adressField;
    UITextField *_nameField;
    UITextField *_phoneField;
    UITextField *_MObilePoneField;
    UITextField *_passwordField;
    UITextField *_VerificationField;
    
    int         _type;//获取验证码的方式
    int         intTime;//等待时间
    NSTimer     *_timer;
    
}
@end

@implementation RegisterViewController
-(void)setNavGationBar
{
    
    _stateImgV=[[UIImageView alloc]init];
    _stateImgV.frame=CGRectMake(0, 0, DeviceWidth, 20);
    _stateImgV.image=[UIImage imageNamed:@"zhuangtailan.png"];
    _stateImgV.userInteractionEnabled=YES;
    [self.view addSubview:_stateImgV];
    
    _navImageView=[[UIImageView alloc]init];
    _navImageView.frame=CGRectMake(0, 20, DeviceWidth, 44);
    _navImageView.image=[UIImage imageNamed:@"navgationbar.png"];
    _navImageView.userInteractionEnabled=YES;
    [self.view addSubview:_navImageView];
    UILabel *titleLab=[[UILabel alloc]init];
    titleLab.frame=CGRectMake(0, 0, DeviceWidth, 44);
    titleLab.font=[UIFont systemFontOfSize:20];
    titleLab.backgroundColor=[UIColor clearColor];
    titleLab.textColor= [UIColor whiteColor];
    titleLab.text=@"注册";
    titleLab.textAlignment=1;
    [_navImageView addSubview:titleLab];
    
    
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(20, 10, 28, 28);
    [backBtn setImage:[UIImage imageNamed:@"back.png"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(doBack:) forControlEvents:UIControlEventTouchUpInside];
    [_navImageView addSubview:backBtn];
}
-(void)doBack:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    [self setNavGationBar];
    [self setUI];
    // Do any additional setup after loading the view.
}
-(void)setUI
{
    _rootView=[[UIView alloc]initWithFrame:CGRectMake(0, 64, DeviceWidth, DeviceHeight-64)];
    _rootView.backgroundColor=[UIColor colorWithWhite:0.9 alpha:1.0];
    [self.view addSubview:_rootView];
    
    _titleField=[[UITextField alloc]initWithFrame:CGRectMake(15, Height, DeviceWidth-30, Height1)];
    _titleField.backgroundColor=[UIColor whiteColor];
    _titleField.layer.cornerRadius=5;
    _titleField.delegate=self;
    _titleField.placeholder=@"店铺名称";
    [_rootView addSubview:_titleField];
    
    UIView*addressView=[[UIView alloc]initWithFrame:CGRectMake(_titleField.frame.origin.x, _titleField.frame.size.height+_titleField.frame.origin.y+10, _titleField.frame.size.width, _titleField.frame.size.height)];
    addressView.backgroundColor=[UIColor whiteColor];
    addressView.layer.cornerRadius=5;
    [_rootView addSubview:addressView];
    _adressField=[[UITextField alloc]initWithFrame:CGRectMake(0, 0, addressView.frame.size.width-60, addressView.frame.size.height)];
    _adressField.backgroundColor=[UIColor whiteColor];
    _adressField.layer.cornerRadius=5;
    _adressField.delegate=self;
    _adressField.placeholder=@"店铺地址";
    [addressView addSubview:_adressField];
    
    UIButton*locationBtn =[UIButton buttonWithType:UIButtonTypeCustom];
    locationBtn.frame =CGRectMake(_adressField.frame.size.width+_adressField.frame.origin.x,0,60,addressView.frame.size.height);
    locationBtn.backgroundColor=[UIColor colorWithRed:0.114f green:0.647f blue:0.988f alpha:1.00f];
    [locationBtn setTitle:@"地图定位" forState:UIControlStateNormal];
    locationBtn.titleLabel.font=[UIFont systemFontOfSize:14];
    [locationBtn addTarget:self action:@selector(locationAction:) forControlEvents:UIControlEventTouchUpInside];
    locationBtn.tag=305;
    [addressView addSubview:locationBtn];
    
    _nameField=[[UITextField alloc]initWithFrame:CGRectMake(_titleField.frame.origin.x, addressView.frame.size.height+addressView.frame.origin.y+10, _titleField.frame.size.width, _titleField.frame.size.height)];
    _nameField.backgroundColor=[UIColor whiteColor];
    _nameField.layer.cornerRadius=5;
    _nameField.delegate=self;
    _nameField.placeholder=@"店铺负责人";
    [_rootView addSubview:_nameField];
    
    _phoneField=[[UITextField alloc]initWithFrame:CGRectMake(_nameField.frame.origin.x, _nameField.frame.size.height+_nameField.frame.origin.y+10, _nameField.frame.size.width, _nameField.frame.size.height)];
    _phoneField.backgroundColor=[UIColor whiteColor];
    _phoneField.layer.cornerRadius=5;
    _phoneField.keyboardType=UIKeyboardTypeNumberPad;
    _phoneField.delegate=self;
    _phoneField.placeholder=@"店铺联系电话";
    [_rootView addSubview:_phoneField];
    
    _MObilePoneField=[[UITextField alloc]initWithFrame:CGRectMake(_phoneField.frame.origin.x, _phoneField.frame.size.height+_phoneField.frame.origin.y+10, _phoneField.frame.size.width, _phoneField.frame.size.height)];
    _MObilePoneField.backgroundColor=[UIColor whiteColor];
    _MObilePoneField.layer.cornerRadius=5;
    _MObilePoneField.keyboardType=UIKeyboardTypeNumberPad;
    _MObilePoneField.delegate=self;
    _MObilePoneField.placeholder=@"手机号";
    [_rootView addSubview:_MObilePoneField];
    
    _passwordField=[[UITextField alloc]initWithFrame:CGRectMake(_MObilePoneField.frame.origin.x, _MObilePoneField.frame.size.height+_MObilePoneField.frame.origin.y+10, _MObilePoneField.frame.size.width, _MObilePoneField.frame.size.height)];
    _passwordField.backgroundColor=[UIColor whiteColor];
    _passwordField.layer.cornerRadius=5;
    _passwordField.delegate=self;
    _passwordField.placeholder=@"密码";
    [_rootView addSubview:_passwordField];
    
    
    _VerificationField =[[UITextField alloc]init ];
    _VerificationField.frame=CGRectMake( _passwordField.frame.origin.x, _passwordField.frame.size.height+_passwordField.frame.origin.y+10, _passwordField.frame.size.width*5/8, _passwordField.frame.size.height);
    _VerificationField.layer.cornerRadius=5;
    _VerificationField.clearButtonMode=UITextFieldViewModeAlways;
    _VerificationField.placeholder = @"请输入验证码";
    _VerificationField.backgroundColor=[UIColor whiteColor];
    _VerificationField.keyboardType=UIKeyboardTypeNumberPad;
    _VerificationField.delegate=self;
    [_rootView addSubview:_VerificationField];
    
    UIButton* verificationBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    verificationBtn.tag=300;
    verificationBtn.frame=CGRectMake(_VerificationField.frame.origin.x+_VerificationField.frame.size.width-1, _VerificationField.frame.origin.y, _passwordField.frame.size.width*3/8, _VerificationField.frame.size.height) ;
    [verificationBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
    [verificationBtn setContentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter];
    verificationBtn.titleLabel.font=[UIFont systemFontOfSize:14];
    verificationBtn.backgroundColor=[UIColor colorWithRed:0.000f green:0.639f blue:1.000f alpha:1.00f];
    [_rootView addSubview:verificationBtn];
    [verificationBtn addTarget:self action:@selector(getMessageClick:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton*registerBtn =[UIButton buttonWithType:UIButtonTypeCustom];
    if (DeviceHeight==480) {
        registerBtn.frame =CGRectMake(_VerificationField.frame.origin.x, _VerificationField.frame.origin.y+_VerificationField.frame.size.height+10, DeviceWidth-30, 55);
    }
    else
    {
    registerBtn.frame =CGRectMake(_VerificationField.frame.origin.x, _VerificationField.frame.origin.y+_VerificationField.frame.size.height+40, DeviceWidth-30, 55);
    }
    [registerBtn setBackgroundImage:[UIImage imageNamed:@"lijizhuce.png"] forState:UIControlStateNormal];
    
    [registerBtn addTarget:self action:@selector(resigerAction:) forControlEvents:UIControlEventTouchUpInside];
    registerBtn.tag=301;
    [_rootView addSubview:registerBtn];
    
    
    
    UILabel*messageLab=[[UILabel alloc]init];
    messageLab.frame=CGRectMake(0, registerBtn.frame.origin.y+registerBtn.frame.size.height+15, DeviceWidth/2+15, 20);
    messageLab.textAlignment=2;
    messageLab.backgroundColor=[UIColor clearColor];
    messageLab.text=@"收不到短信？使用";
    [_rootView addSubview:messageLab];
    
//    UILabel*messageLab1=[self labelForSize:@"语音验证"];
//    messageLab1.frame=CGRectMake(messageLab.frame.size.width, messageLab.frame.origin.y, messageLab1.frame.size.width, messageLab.frame.size.height);
//    [_rootView addSubview:messageLab1];
//    messageLab1.tag=20;
//    messageLab1.userInteractionEnabled=YES;
//    UITapGestureRecognizer*tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(getVoiceClick:)];
//    [messageLab1 addGestureRecognizer:tap];
    
    
}
////反向遍吗
//- (BMKGeoCodeSearch *)geoCode
//{
//    if (!_geocode) {
//        _geocode = [[BMKGeoCodeSearch alloc] init];
//        _geocode.delegate = self;
//    }
//    return _geocode;
//}
////正向编码
////地理编码
//-(void)getputAdd
//{
//    _geocode= [self geoCode];
//    BMKGeoCodeSearchOption*option=[[BMKGeoCodeSearchOption alloc ]init];
//    option.city=@"北京市";
//    option.address=_adressField.text;
//    [_geocode geoCode:option];
//}
//- (void)onGetGeoCodeResult:(BMKGeoCodeSearch *)searcher result:(BMKGeoCodeResult *)result errorCode:(BMKSearchErrorCode)error
//{
//    if (result) {
//        [self.view viewWithTag:305].userInteractionEnabled=YES;
//        NSLog(@"%f 5%f",result.location.latitude,result.location.longitude);
//        self.myLatitude=result.location.latitude;
//        self.myLongitude=result.location.longitude;
//        [self switchMap];
//        
//    }
//    else
//    {
//        [self.view viewWithTag:305].userInteractionEnabled=YES;
//        NSLog(@"%u",error);
//        NSString *errorString;
//        switch (error) {
//            case 9:
//                errorString=@"网络连接超时";
//                break;
//            case 8:
//                errorString=@"网络连接错误";
//                break;
//                
//            default:
//                errorString=@"没有找到检索结果，请重新输入位置信息";
//                break;
//        }
//        UIAlertView*alert=[[UIAlertView alloc]initWithTitle:@"提醒" message:errorString delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
//        
//        [alert show];
//    }
//    
//}
//-(void)switchMap
//{
//    ChrooAdressViewController*chro=[[ChrooAdressViewController alloc]init];
//    chro.addressString=_adressField.text;
//    chro.myLatitude=self.myLatitude;
//    chro.myLongitude=self.myLongitude;
//    chro.block1=^(NSDictionary*dic)
//    {
//        self.myLatitude=[dic[@"myLatitude"] doubleValue];
//        self.myLongitude=[dic[@"myLongitude"] doubleValue];
//    };
//    [self.navigationController pushViewController:chro animated:YES];
//    
//    
//    
//}

//键盘上下移动
-(void)textFieldDidBeginEditing:(UITextField *)textField{   //开始编辑时，整体上移
    if (DeviceHeight==480) {
        if (textField==_phoneField||textField==_passwordField||textField==_MObilePoneField||textField==_VerificationField) {
            [self moveView1:-100];
            if (textField==_VerificationField) {
                 [self moveView1:-110];
            }
            
        }
        
    }
    else
    {
        
        if (textField==_phoneField||textField==_passwordField||textField==_VerificationField||textField==_MObilePoneField) {
            _navImageView.hidden=YES;
            [self moveView:-44];
            if(textField==_passwordField)
            {
                [self moveView:-80];
            }
            if (textField==_VerificationField) {
                [self moveView:-120];
            }
            
        }
        
    }
    
}
-(void)textFieldDidEndEditing:(UITextField *)textField{     //结束编辑时，整体下移
    if (DeviceHeight==480) {
        if (textField==_phoneField||textField==_passwordField||textField==_VerificationField||textField==_MObilePoneField) {
            [self moveView1:100];
            if (textField==_VerificationField) {
                [self moveView1:110];
            }
        }

    }
    else
    {
        if (textField==_phoneField||textField==_passwordField||textField==_VerificationField||textField==_MObilePoneField) {
            _navImageView.hidden=NO;
            [self moveView:44];
            if(textField==_passwordField)
            {
                [self moveView:80];
            }
            if (textField==_VerificationField) {
                [self moveView:120];
            }
            
        }
        
        
    }
}
-(void)moveView:(float)move{
    NSTimeInterval animationDuration = 0.30f;
    CGRect frame = _rootView.frame;
    frame.origin.y+=move;//view的X轴上移
    _rootView.frame = frame;
    
    [self.view bringSubviewToFront:_stateImgV];
    [UIView beginAnimations:@"ResizeView" context:nil];
    [UIView setAnimationDuration:animationDuration];
    
    [UIView commitAnimations];//设置调整界面的动画效果
    
    
}
-(void)moveView1:(float)move{
    NSTimeInterval animationDuration = 0.30f;
    CGRect frame = self.view.frame;
    frame.origin.y+=move;//view的X轴上移
    self.view.frame = frame;
    [UIView beginAnimations:@"ResizeView" context:nil];
    [UIView setAnimationDuration:animationDuration];
    self.view.frame = frame;
    [UIView commitAnimations];//设置调整界面的动画效果
    
    
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
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
