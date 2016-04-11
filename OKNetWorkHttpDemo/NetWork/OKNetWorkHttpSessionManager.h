//
//  OKNetWorkHttpSessionManager.h
//  OKNetWorkHttpDemo
//
//  Created by lengshengren on 16/4/10.
//  Copyright © 2016年 Lengshengren. All rights reserved.
//

#import <AFNetworking/AFHTTPSessionManager.h>
@interface OKNetWorkHttpSessionManager : AFHTTPSessionManager
+ (instancetype)sharedInstance;
@end
