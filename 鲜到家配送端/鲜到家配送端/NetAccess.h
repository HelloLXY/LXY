//
//  NetAccess.h
//  o2oserviceMV
//
//  Created by 李晓勇 on 15/7/7.
//  Copyright (c) 2015年 李工. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetAccess : NSObject
+ (NetAccess *)sharedNetAccess;
// 判断网络是否可用
- (BOOL)haveNet;
@end
