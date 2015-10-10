//
//  GCHttp.h
//  LINKO
//
//  Created by 李晓勇 on 15/4/8.
//  Copyright (c) 2015年 LINKO. All rights reserved.
//

#import <Foundation/Foundation.h>
//允许访问https
#import <SystemConfiguration/SystemConfiguration.h>
#import <MobileCoreServices/MobileCoreServices.h>
#define AFNETWORKING_ALLOW_INVALID_SSL_CERTIFICATES
#import "MBProgressHUD.h"
#import "header.h"
@interface GCHttp : NSObject
/**
 *  GET请求
 *
 *  @param URLString  URL
 *  @param parameters 参数：字典！！
 *  @param success
 *  @param failure
 */

/**要传什么就把什么作为参数*/
+ (void)GET:(NSString *)URLString
 parameters:(id)parameters
    success:(void (^)(id responseObject))success
    failure:(void (^)(NSError *error))failure;

/**
 *  POST
 *
 *  @param URLString  URL
 *  @param parameters 参数：字典！！
 *  @param success
 *  @param failure
 */
+ (void)POST:(NSString *)URLString
  parameters:(id)parameters
     success:(void (^)(id responseObject))success
     failure:(void (^)(NSError *error))failure;

/**
 *  POST  请求头
 *
 *  @param URLString  URL
 *  @param parameters 参数：字典！！
 *  @param success
 *  @param failure
 */
+ (void)POST1:(NSString *)URLString
  parameters:(id)parameters
     success:(void (^)(id responseObject))success
     failure:(void (^)(NSError *error))failure;
/**
 *访问https请求
 */
+(void)initSSl;
@end
