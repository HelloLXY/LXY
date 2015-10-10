//
//  LogInViewController.m
//  o2oserviceMV
//
//  Created by 李晓勇 on 15/7/10.
//  Copyright (c) 2015年 李工. All rights reserved.
//

#import "LogInViewController.h"
#import "RegisterViewController.h"


@interface LogInViewController ()<UITextFieldDelegate,UIAlertViewDelegate>
{
    UIView       *_rootView;
    UIImageView  *_navImageView;
    UITextField  *_phoneField;
    UITextField  *_passwordField;
    
    
}
@end

@implementation LogInViewController
-(void)setNavGationBar
{
    self.navigationController.navigationBar.hidden=YES;
    UIImageView*imgV=[[UIImageView alloc]init];
    imgV.frame=CGRectMake(0, 0, DeviceWidth, 20);
    imgV.image=[UIImage imageNamed:@"zhuangtailan.png"];
    imgV.userInteractionEnabled=YES;
    [self.view addSubview:imgV];
    
    _navImageView=[[UIImageView alloc]init];
    _navImageView.frame=CGRectMake(0, 20, DeviceWidth, 44);
    _navImageView.image=[UIImage imageNamed:@"navgationbar.png"];
    _navImageView.userInteractionEnabled=YES;
    [self.view addSubview:_navImageView];
    
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(20, 10, 28, 28);
    UILabel *titleLab=[[UILabel alloc]init];
    titleLab.frame=CGRectMake(0, 0, DeviceWidth, 44);
    titleLab.font=[UIFont systemFontOfSize:20];
    titleLab.backgroundColor=[UIColor clearColor];
    titleLab.textColor= [UIColor whiteColor];
    titleLab.text=@"登录";
    titleLab.textAlignment=1;
    [_navImageView addSubview:titleLab];
    

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
    _rootView=[[UIView alloc]init];
    _rootView.frame=CGRectMake(0, 64, DeviceWidth, DeviceHeight-64);
    [self.view addSubview:_rootView];
    
    
    UIImageView*cellImgV=[[UIImageView alloc]init];
    cellImgV.frame=CGRectMake(10, 40, DeviceWidth-20, 45);
    cellImgV.userInteractionEnabled=YES;
    cellImgV.image=[UIImage imageNamed:@"surukuang.png"];
    [_rootView addSubview:cellImgV];
    
    UIImageView*userImgV=[[UIImageView alloc]init];
    userImgV.frame=CGRectMake(0, 0, cellImgV.frame.size.width/7, cellImgV.frame.size.height);
    
    userImgV.image=[UIImage imageNamed:@"yonghuming.png"];
    [cellImgV addSubview:userImgV];
    
    _phoneField =[[UITextField alloc]init ];
    _phoneField.frame=CGRectMake(cellImgV.frame.size.width/7, 0, cellImgV.frame.size.width*6/7, cellImgV.frame.size.height);
    _phoneField.delegate=self;
    _phoneField.backgroundColor =[UIColor clearColor];
    
    _phoneField.keyboardType=UIKeyboardTypeNumberPad;
    _phoneField.clearButtonMode=UITextFieldViewModeAlways;
    _phoneField.placeholder = @"手机号";
    [cellImgV addSubview:_phoneField];
    
    
    
    
    
    
    
    UIImageView*passWordImgV=[[UIImageView alloc]init];
    passWordImgV.frame=CGRectMake(cellImgV.frame.origin.x, cellImgV.frame.size.height+cellImgV.frame.origin.y+20, cellImgV.frame.size.width, cellImgV.frame.size.height);
    passWordImgV.userInteractionEnabled=YES;
    passWordImgV.image=[UIImage imageNamed:@"surukuang.png"];
    [_rootView addSubview:passWordImgV];
    
    UIImageView*wordImgV=[[UIImageView alloc]init];
    wordImgV.frame=CGRectMake(0, 0, passWordImgV.frame.size.width/7, passWordImgV.frame.size.height);
    wordImgV.image=[UIImage imageNamed:@"mima.png"];
    [passWordImgV addSubview:wordImgV];
    _passwordField =[[UITextField alloc]init ];
    _passwordField.frame=CGRectMake(passWordImgV.frame.size.width/7, 0, passWordImgV.frame.size.width*6/7, passWordImgV.frame.size.height);
    _passwordField.backgroundColor =[UIColor clearColor];
    
    _passwordField.clearButtonMode=UITextFieldViewModeAlways;
    _passwordField.placeholder = @"密码:";
    _passwordField.secureTextEntry=YES;
    _passwordField.keyboardType=UIKeyboardTypeASCIICapable;
    _passwordField.delegate=self;
    [passWordImgV addSubview:_passwordField];
    
    UIButton *btn =[UIButton buttonWithType:UIButtonTypeCustom];
    // btn .frame =CGRectMake(20, _field1.frame.size.height+240, 280, 40);
    btn.frame =CGRectMake(passWordImgV.frame.origin.x, passWordImgV.frame.size.height+passWordImgV.frame.origin.y+30, passWordImgV.frame.size.width, 40);
    
    
    [btn setBackgroundImage:[UIImage imageNamed:@"logoin.png"] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btn.layer.cornerRadius =10;
    btn.tag=91;
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [_rootView addSubview:btn];
    
    
    UIButton *btn1 =[UIButton buttonWithType:UIButtonTypeCustom];
    btn1.frame =CGRectMake(btn.frame.origin.x, btn.frame.origin.y+btn.frame.size.height+10, DeviceWidth/3, 60);
    
    
    [btn1 setTitle:@"忘记密码?" forState:UIControlStateNormal];
    [btn1 setTitleColor:[UIColor colorWithRed:0.000f green:0.639f blue:1.000f alpha:1.00f] forState:UIControlStateNormal];
    btn1.titleLabel.textAlignment=0;
    // btn1.layer.cornerRadius =10;
    [btn1 addTarget:self action:@selector(btnClick1) forControlEvents:UIControlEventTouchUpInside];
    [_rootView addSubview:btn1];
    
    
    UIButton *btn2 =[UIButton buttonWithType:UIButtonTypeCustom];
    btn2.frame =CGRectMake(DeviceWidth- btn.frame.origin.x-DeviceWidth/3, btn.frame.origin.y+btn.frame.size.height+10, DeviceWidth/3, 60);
    
    
    [btn2 setTitle:@"立即注册" forState:UIControlStateNormal];
    [btn2 setTitleColor:[UIColor colorWithRed:0.000f green:0.639f blue:1.000f alpha:1.00f] forState:UIControlStateNormal];
    btn2.titleLabel.textAlignment=2;
    // btn1.layer.cornerRadius =10;
    [btn2 addTarget:self action:@selector(btnClick2) forControlEvents:UIControlEventTouchUpInside];
    [_rootView addSubview:btn2];

    
}
-(void)loginAction:(UIButton*)sender
{
    
    NSString*errorString;
    if (!_phoneField.text.length) {
        errorString=@"请输入您的帐号";
        UIAlertView*alert=[[UIAlertView alloc]initWithTitle:@"提醒" message:errorString delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alert show];
    }
    else if (!_passwordField.text.length)
    {
        errorString=@"请输入密码";
        UIAlertView*alert=[[UIAlertView alloc]initWithTitle:@"提醒" message:errorString delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alert show];
    }
    else
    {
        sender.enabled=NO;
        NSString *url=[NSString stringWithFormat:@"http://o2oapi.thebluewisdom.com/business/login?loginname=%@&loginpwd=%@",_phoneField.text,_passwordField.text];
        NSLog(@"..%@",url);
        [GCHttp GET:url parameters:nil success:^(id responseObject)
         {
             sender.enabled=YES;
             NSLog(@"%@",responseObject);
             if ([[responseObject allKeys] containsObject:@"retCode"]&& (![[[responseObject objectForKey:@"retCode"]stringValue]isEqualToString:@"0"]))
             {
                 NSString* retString=[responseObject objectForKey:@"exception"];
                 UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:retString delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
                 alertView.tag=50;
                 [alertView show];
                 
             }
             else
             {
                 NSUserDefaults *users=[NSUserDefaults standardUserDefaults];
                 NSDictionary*dic=@{@"userName":_phoneField.text,@"userPassword":_passwordField.text};
                 [users setObject:dic forKey:@"users"];
                 [[NSNotificationCenter defaultCenter]postNotificationName:@"getAlias" object:dic];
                 [users synchronize];
//                 MainViewController*main=[[MainViewController alloc]init];
//                 [self.navigationController pushViewController:main animated:NO];
             }
             

         
         }
            failure:^(NSError *error)
         {
             
             sender.enabled=YES;
         }];

    }
    
}
-(void)registerAction:(UIButton*)sender
{
    RegisterViewController*regi=[[RegisterViewController alloc]init];
    [self.navigationController pushViewController:regi animated:YES];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [_passwordField resignFirstResponder];
    [_phoneField resignFirstResponder];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (alertView.tag==50) {
        if (buttonIndex==0) {
            _passwordField.text=@"";
        }
    }
}
//键盘上下移动
-(void)textFieldDidBeginEditing:(UITextField *)textField{   //开始编辑时，整体上移
    if (DeviceHeight==480) {
        [self moveView1:-100];
    }
    else
    {
    _navImageView.hidden=YES;
    [self moveView:-44];
    }
    
}
-(void)textFieldDidEndEditing:(UITextField *)textField{     //结束编辑时，整体下移
    if (DeviceHeight==480) {
        [self moveView1:100];
    }
    else
    {
    _navImageView.hidden=NO;
    [self moveView:44];
    }
}
-(void)moveView:(float)move{
    NSTimeInterval animationDuration = 0.30f;
    CGRect frame = _rootView.frame;
    frame.origin.y+=move;//view的X轴上移
    _rootView.frame = frame;
    [UIView beginAnimations:@"ResizeView" context:nil];
    [UIView setAnimationDuration:animationDuration];
    _rootView.frame = frame;
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
