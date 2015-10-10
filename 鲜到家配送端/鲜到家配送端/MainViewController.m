//
//  ViewController.m
//  鲜到家配送端
//
//  Created by 李晓勇 on 15/7/30.
//  Copyright (c) 2015年 李工. All rights reserved.
//

#import "MainViewController.h"
#import "CustomView.h"
#import "MJRefresh.h"
#import "Header.h"
#import "LogInViewController.h"
@interface MainViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSString       * _name;
    NSString       * _word;
    CGRect         rect;
    NSArray        * _leftViewArry;
    UIView         * _backView;
    UIView         * _contentView;
    
    UIScrollView   * _mainScrollView;
    UIView         * _firstView;
    UITableView    * _firstTabV;
    NSUInteger     _firstPageNumber;
    bool           _firstBool;
    NSString       * _firstStateString;
    NSMutableArray * _orderImagesArry;
    NSMutableArray * _orderImagesArry1;
    NSMutableArray * _firstTitlesArry;
}
@end

@implementation MainViewController
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        _leftViewArry=@[@"我的会员",@"我的广告",@"我的推送",@"设置",@"注销",@"退出"];
    _orderImagesArry=[@[@"allorder.png",@"neworder.png",@"ordered.png"]mutableCopy];
    _orderImagesArry1=[@[@"allorder1.png",@"neworder1.png",@"ordered1.png"]mutableCopy];
        _firstTitlesArry=[@[@"标题",@"订单金额",@"联系人",@"电话",@"地址",@"状态"]mutableCopy];
    }
    return self;
}
-(void)addBack
{
    self.navigationController.navigationBar.hidden=YES;
    UIImageView*imgV=[[UIImageView alloc]init];
    imgV.frame=CGRectMake(0, 0, DeviceWidth, 20);
    imgV.image=[UIImage imageNamed:@"zhuangtailan.png"];
    imgV.userInteractionEnabled=YES;
    [_contentView addSubview:imgV];
    
    UIImageView*imgV1=[[UIImageView alloc]init];
    imgV1.frame=CGRectMake(0, 20, DeviceWidth, 44);
    imgV1.image=[UIImage imageNamed:@"navgationbar.png"];
    imgV1.userInteractionEnabled=YES;
    [_contentView addSubview:imgV1];
    
  
    UILabel *titleLab=[[UILabel alloc]init];
    titleLab.frame=CGRectMake(0, 0, DeviceWidth, 44);
    titleLab.font=[UIFont systemFontOfSize:20];
    titleLab.backgroundColor=[UIColor clearColor];
    titleLab.textColor= [UIColor whiteColor];
    titleLab.text=@"购物车";
    titleLab.textAlignment=1;
//    [imgV1 addSubview:titleLab];
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(20, 10, 28, 28);
    [backBtn setImage:[UIImage imageNamed:@"back.png"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(doBack:) forControlEvents:UIControlEventTouchUpInside];
       
}
-(void)doBack:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (void)viewDidLoad {
    self.view.backgroundColor=[UIColor whiteColor];
    [super viewDidLoad];
 
    //增加底层图层
    [self addLeftView];
    //增加表层图层
    [self addContentView];
    [self addBack];
   
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)addLeftView
{
   _backView=[[UIView alloc]init];
    _backView.frame=[[UIScreen mainScreen]bounds];
    _backView.backgroundColor=[UIColor redColor];
    [self.view addSubview:_backView];
    for (int i=0; i<_leftViewArry.count; i++)
    {
        UIButton*button=[UIButton buttonWithType:UIButtonTypeSystem];
        button.tag=20+i;
        [button setTitle:_leftViewArry[i] forState:UIControlStateNormal];
        button.frame=CGRectMake(50, 120+i*40, 100, 40);
        button.backgroundColor=[UIColor clearColor];
        [button addTarget:self action:@selector(leftAction:) forControlEvents:UIControlEventTouchUpInside];
        [_backView addSubview:button];
    }
    
}
-(void)leftAction:(UIButton*)sender
{
    switch (sender.tag-20) {
        case 0:
        {
            
        }
            break;
        case 1:
        {
            
        }
            break;
        case 2:
        {
            
        }
            break;
        case 3:
        {
            
        }
            break;
        case 4:
        {
            LogInViewController*logIn=[[LogInViewController alloc]init];
            [self.navigationController pushViewController:logIn animated:YES];
        }
            break;
            
        default:
            break;
    }
}
-(void)addContentView
{
    _contentView = [[UIView alloc] initWithFrame:[[UIScreen mainScreen]bounds]];
    _contentView.backgroundColor=[UIColor whiteColor];

    CustomView *customView = [[CustomView alloc] initWithView:_contentView parentView:self.view];
    [[customView layer] setShadowOffset:CGSizeMake(10, 10)];
    [[customView layer] setShadowRadius:20];
    [[customView layer] setShadowOpacity:1];
    [[customView layer] setShadowColor:[UIColor blackColor].CGColor];
    
    [self.view addSubview:customView];
    [self setFirstView];
}

-(void)setFirstView

{
    _firstView=[[UIView alloc]initWithFrame:CGRectMake(0, 64, DeviceWidth, 50+20)];
    _firstView.backgroundColor=[UIColor colorWithWhite:0.95 alpha:1.0];
    
    [_contentView addSubview:_firstView];
    for (int i=0; i<_orderImagesArry1.count; i++) {
        UIButton *headBtn1=[UIButton buttonWithType:UIButtonTypeCustom];
        headBtn1.tag=50+i;
        [headBtn1 setBackgroundImage:[UIImage imageNamed:_orderImagesArry1[i]] forState:UIControlStateNormal];
        headBtn1.frame=CGRectMake((DeviceWidth-100*_orderImagesArry1.count)/6+(100+(DeviceWidth-100*_orderImagesArry1.count)/6*2)*i,(50-35)/2, 100, 35);
        [headBtn1 addTarget:self action:@selector(tapAction1:) forControlEvents:UIControlEventTouchUpInside];
        [_firstView addSubview:headBtn1];
    }
       for (int i=0; i<_firstTitlesArry.count; i++) {
        UILabel*titleLab=[[UILabel alloc]init];
        titleLab.frame=CGRectMake(((DeviceWidth-5)/_firstTitlesArry.count+1)*i,50, (DeviceWidth-5)/_firstTitlesArry.count, 19);
        titleLab.textAlignment=1;
        titleLab.backgroundColor=[UIColor whiteColor];
        titleLab.font=[UIFont systemFontOfSize:15];
        titleLab.text=_firstTitlesArry[i];
        [_firstView addSubview:titleLab];
    }
//    [self tapAction1:(UIButton*)[self.view viewWithTag:50]];
    
    
}
-(void)addFirstTabView
{
    if(_firstTabV.subviews.count)
    {
        [_firstTabV removeFromSuperview];
    }
    _firstTabV=[[UITableView alloc]initWithFrame:CGRectMake(0,_firstView.frame.size.height+_firstView.frame.origin.y, DeviceWidth, DeviceHeight-_firstView.frame.size.height-_firstView.frame.origin.y) ];
    _firstTabV.backgroundColor=[UIColor colorWithWhite:0.9 alpha:1.0];
    _firstTabV.header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(firstHeaderRereshing)];
    _firstTabV.footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(firstFooterRereshing)];
    
    [_mainScrollView addSubview:_firstTabV];
    _firstTabV.delegate=self;
    _firstTabV.dataSource=self;
}


-(void)firstHeaderRereshing
{
    
    _firstPageNumber=1;
    
//    [self first_GetOrder];
}
-(void)firstFooterRereshing
{
    _firstPageNumber+=1;
    
    
//    [self first_GetOrder];
}
-(void)tapAction1:(UIButton*)sender
{
    _firstBool=NO;
    _firstPageNumber=1;
//    [_firstordersArry removeAllObjects];
    for (int i=0; i<_orderImagesArry1.count; i++) {
        if (sender.tag==50+i) {
            [sender setBackgroundImage:[UIImage imageNamed:_orderImagesArry[i]] forState:UIControlStateNormal];
        }
        else
        {
            [(UIButton*)[self.view viewWithTag:50+i] setBackgroundImage:[UIImage imageNamed:_orderImagesArry1[i]] forState:UIControlStateNormal];
        }
    }
    switch (sender.tag-50) {
        case 0:
            _firstStateString=@"";
            break;
        case 1:
            _firstStateString=@"false";
            break;
        case 2:
            _firstStateString=@"true";
            break;
            
            
            
            
        default:
            break;
    }
//    [self first_GetOrder];
}

//-(void)first_GetOrder
//{
//    MBProgressHUD*pro;
//    if ( !_firstBool) {
//        pro =[MBProgressHUD showHUDAddedTo:_mainScrollView animated:YES];
//        
//    }
//    
//    NSString *url=[NSString stringWithFormat:@"http://o2oapi.thebluewisdom.com/trade/list?loginName=%@&loginPwd=%@&status=%@&pageNum=%d&rows=10",_name,_word,_firstStateString, _firstPageNumber];
//    NSLog(@"..%@",url);
//    [GCHttp GET:url parameters:nil success:^(id responseObject)
//     {
//         [pro removeFromSuperview];
//         NSLog(@"%@",responseObject);
//         if ([[responseObject allKeys] containsObject:@"retCode"]&& (![[[responseObject objectForKey:@"retCode"]stringValue]isEqualToString:@"0"]))
//         {
//             NSString* retString=[responseObject objectForKey:@"exception"];
//             UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:retString delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
//             
//             [alertView show];
//             
//         }
//         else
//         {
//             
//             NSArray*arry=[responseObject objectForKey:@"list"];
//             if (_firstPageNumber==1) {
//                 [_firstordersArry removeAllObjects];
//             }
//             for (id object in arry) {
//                 FirstMode*firstMode=[[FirstMode alloc]initWithDictionary:object];
//                 [_firstordersArry addObject:firstMode];
//                 
//                 
//             }
//             
//             if (!_firstBool) {
//                 _firstBool=YES;
//                 [self addFirstTabView];
//             }
//             else
//             {
//                 if (_firstPageNumber==1) {
//                     [_firstTabV.header endRefreshing];
//                     _firstTabV.footer.state= MJRefreshStateIdle;
//                 }
//                 else
//                 {
//                     [_firstTabV.footer endRefreshing];
//                     if (_firstordersArry.count%10) {
//                         _firstTabV.footer.state=MJRefreshStateNoMoreData;
//                     }
//                 }
//                 [_firstTabV reloadData];
//             }
//             
//         }}
//        failure:^(NSError *error)
//     {
//         [pro removeFromSuperview];
//     }];
//    
//    
//    
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
