//
//  NetAccess.m
//  o2oserviceMV
//
//  Created by 李晓勇 on 15/7/7.
//  Copyright (c) 2015年 李工. All rights reserved.
//

#import "NetAccess.h"
#import "Reachability.h"
@implementation NetAccess
static NetAccess *_sharedNetAccess;
+ (NetAccess *)sharedNetAccess
{
    if(!_sharedNetAccess)
    {
        _sharedNetAccess = [[NetAccess alloc] init];
    }
    return _sharedNetAccess;
}
- (BOOL)haveNet
{
    if(![[Reachability reachabilityForInternetConnection] isReachableViaWWAN] &&
       ![[Reachability reachabilityForInternetConnection] isReachableViaWiFi])
    {
        return NO;
    }
    else
        return YES;
}
@end

