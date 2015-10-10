//
//  GCHttp.m
//  LINKO
//
//  Created by 李晓勇 on 15/4/8.
//  Copyright (c) 2015年 LINKO. All rights reserved.
//http://www.blogjava.net/qileilove/archive/2014/12/11/421323.html

#import "GCHttp.h"
#import "AFNetworking.h"

#import "NetAccess.h"

@implementation GCHttp
+ (void)GET:(NSString *)URLString
 parameters:(id)parameters
    success:(void (^)(id responseObject))success
    failure:(void (^)(NSError *error))failure
{
 
    NetAccess*_net=[NetAccess sharedNetAccess];
    if (![_net haveNet]) {
        UIAlertView*alerw=[[UIAlertView alloc]initWithTitle:@"提醒" message:@"请检查网络" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:@"取消", nil];
        [alerw show];
    }
    else
    {
    
//        [self initSSl];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
       
    
        // //返回JSon格式判断
        manager.responseSerializer = [[AFJSONResponseSerializer alloc] init];
 /*       //返回plist格式判断
        manager.responseSerializer = [[AFPropertyListResponseSerializer alloc] init];
        //返回XML格式判断
        manager.responseSerializer = [[AFXMLParserResponseSerializer alloc] init];
        //返回图片判断
        manager.responseSerializer = [[AFImageResponseSerializer alloc] init];
        //返回二进制判断
        manager.responseSerializer = [[AFHTTPResponseSerializer alloc] init];
        
   */
    manager.requestSerializer.timeoutInterval = 60;
   
    [manager GET:URLString parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
    
    }}

+ (void)POST:(NSString *)URLString
  parameters:(id)parameters
     success:(void (^)(id responseObject))success
     failure:(void (^)(NSError *error))failure
{
    NetAccess *_net=[NetAccess sharedNetAccess];
    
    if (![_net haveNet]) {
        
//        [MBProgressHUD showError:@"请连接网络"];
        
    }else{

//        [self initSSl];
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
         manager.responseSerializer = [[AFJSONResponseSerializer alloc] init];
//        manager.requestSerializer = [AFHTTPRequestSerializer serializer];
     //   manager.responseSerializer = [AFHTTPResponseSerializer serializer];
       // [manager.operationQueue cancelAllOperations];//取消队列操作
        manager.requestSerializer.timeoutInterval = 60;
        [manager POST:URLString parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
            if (success) {
                success(responseObject);
            }
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            if (failure) {
                NSLog(@"Error: %@", error);
                NSLog ( @"operation: %@" , operation. responseString );
                NSString *html = operation.responseString;
                NSData* data=[html dataUsingEncoding:NSUTF8StringEncoding];
               
                id dict=[NSJSONSerialization  JSONObjectWithData:data options:0 error:nil];
                NSLog(@"%@",dict);
                failure(error);
            }
        }];

    }
}


+ (void)POST1:(NSString *)URLString
  parameters:(id)parameters
     success:(void (^)(id responseObject))success
     failure:(void (^)(NSError *error))failure
{
    NetAccess *_net=[NetAccess sharedNetAccess];
    
    if (![_net haveNet]) {
        
        //        [MBProgressHUD showError:@"请连接网络"];
        
    }else{
        
        //        [self initSSl];
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        manager.securityPolicy=[AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
        manager.requestSerializer=[AFJSONRequestSerializer serializer];
        manager.responseSerializer=[AFJSONResponseSerializer serializer];
        [manager.requestSerializer setValue:@"application/json"forHTTPHeaderField:@"Accept"];
        [manager.requestSerializer setValue:@"application/json;charset=utf-8"forHTTPHeaderField:@"Content-Type"];
        // [manager.operationQueue cancelAllOperations];//取消队列操作
        manager.requestSerializer.timeoutInterval = 60;
        [manager POST:URLString parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
            if (success) {
                success(responseObject);
            }
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            if (failure) {
                NSLog(@"Error: %@", error);
                NSLog ( @"operation: %@" , operation. responseString );
                NSString *html = operation.responseString;
                NSData* data=[html dataUsingEncoding:NSUTF8StringEncoding];
                
                id dict=[NSJSONSerialization  JSONObjectWithData:data options:0 error:nil];
                NSLog(@"%@",dict);
                failure(error);
            }
        }];
        
    }
}


+(void)initSSl
{
    AFSecurityPolicy *securityPolicy = [AFSecurityPolicy defaultPolicy];
    securityPolicy.allowInvalidCertificates = YES;
    [AFHTTPRequestOperationManager manager].securityPolicy = securityPolicy;
}

@end
