//
//  OKNetWorkHttpMonitorNetWork.m
//  OKNetWorkHttpDemo
//
//  Created by lengshengren on 16/4/10.
//  Copyright © 2016年 Lengshengren. All rights reserved.
//

#import "OKNetWorkHttpMonitorNetWork.h"
#import "AFNetworkReachabilityManager.h"
@implementation OKNetWorkHttpMonitorNetWork
+ (instancetype)sharedInstance {
    static OKNetWorkHttpMonitorNetWork *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[OKNetWorkHttpMonitorNetWork alloc]init];
    });
    
    return manager;
}
- (void)monitorNetWork:(void (^)(BOOL responseObject))success{
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        if (status == AFNetworkReachabilityStatusNotReachable ) {
            if (success) {
                success(NO);
            }
        }else{
            if (success) {
                success(YES);
            }
        }
   
        NSLog(@"Reachability: %@", AFStringFromNetworkReachabilityStatus(status));
    }];
    
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    
}

- (void)monitorNetWorkType:(void (^)(NSInteger  responseObject))networkType{
    // status = 1 时 是2g 3g 4g =2 是wift
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        if (networkType) {
            networkType(status);
        }
        
    }];
    
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
}
@end
