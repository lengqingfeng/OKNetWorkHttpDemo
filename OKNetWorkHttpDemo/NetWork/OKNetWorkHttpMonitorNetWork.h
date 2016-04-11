//
//  OKNetWorkHttpMonitorNetWork.h
//  OKNetWorkHttpDemo
//
//  Created by lengshengren on 16/4/10.
//  Copyright © 2016年 Lengshengren. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OKNetWorkHttpMonitorNetWork : NSObject
+ (instancetype)sharedInstance;
//监测是否有网络
- (void)monitorNetWork:(void (^)(BOOL responseObject))success;
//监测是否是Wifi
- (void)monitorNetWorkType:(void (^)(NSInteger  responseObject))networkType;
@end
