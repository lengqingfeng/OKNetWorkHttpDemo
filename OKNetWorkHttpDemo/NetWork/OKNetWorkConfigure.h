//
//  OKNetWorkConfigure.h
//  OKNetWorkHttpDemo
//
//  Created by lengshengren on 16/4/10.
//  Copyright © 2016年 Lengshengren. All rights reserved.
//

#ifndef OKNetWorkConfigure_h
#define OKNetWorkConfigure_h
//证书名字
static NSString * const HttpsCertificateName = @"CertificateName";

static NSString * const kErrorResponseObjectKey = @"kErrorResponseObjectKey";

#define PROJECT_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]

// 网络类型是否是Https
BOOL isStartUsingHttps = NO;

// 是否开启日志功能
BOOL isStartUsingDebugLog = YES;

#ifdef DEBUG
static NSString * const BaseUrl = @"http://appapi.jiemian.com";//测试环境地址
#else
static NSString * const BaseUrl = @"http://appapi.jiemian.com"; //线上环境地址
#endif


#endif /* OKNetWorkConfigure_h */
