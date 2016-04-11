//
//  OKNetWorkHttpSessionManager.m
//  OKNetWorkHttpDemo
//
//  Created by lengshengren on 16/4/10.
//  Copyright © 2016年 Lengshengren. All rights reserved.
//

#import "OKNetWorkHttpSessionManager.h"
#import "OKNetWorkConfigure.h"

@interface OKNetWorkHttpSessionManager()
@end
@implementation OKNetWorkHttpSessionManager

+ (instancetype)sharedInstance {
    static OKNetWorkHttpSessionManager *manager = nil;
    static dispatch_once_t onceToken;

    dispatch_once(&onceToken, ^{

       manager = [OKNetWorkHttpSessionManager manager];
        // 设置反序列化的数据格式
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", @"text/plain", nil];
        
        // 设置请求Content-Type格式
        manager.requestSerializer=[AFJSONRequestSerializer serializer];
        if (isStartUsingHttps) {
            AFSecurityPolicy *securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModePublicKey];
            securityPolicy.allowInvalidCertificates = YES;
            NSString *cerPath = [[NSBundle mainBundle] pathForResource:HttpsCertificateName ofType:@"der"];
            NSData *certData = [NSData dataWithContentsOfFile:cerPath];
            [securityPolicy setPinnedCertificates:@[certData]];
            manager.securityPolicy = securityPolicy;
            
        }else{
            manager.securityPolicy.allowInvalidCertificates = YES;
            manager.securityPolicy.validatesDomainName = NO;
        }
    });
    
    return manager;
}


//重写父类方法
/// This wraps the completion handler with a shim that injects the responseObject into the error.
- (NSURLSessionDataTask *)dataTaskWithRequest:(NSURLRequest *)request
                            completionHandler:(void (^)(NSURLResponse *, id, NSError *))originalCompletionHandler {
    
    NSString *requestUrlString = [BaseUrl stringByAppendingString:[NSString stringWithFormat:@"%@",request.URL]];
    NSURLRequest *requestUrl = [NSURLRequest requestWithURL:[NSURL URLWithString:requestUrlString]];

    return [super dataTaskWithRequest:requestUrl
                    completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
                        
                        // If there's an error, store the response in it if we've got one.
                        if (error && responseObject) {
                            if (error.userInfo) { // Already has a dictionary, so we need to add to it.
                                NSMutableDictionary *userInfo = [error.userInfo mutableCopy];
                                userInfo[kErrorResponseObjectKey] = responseObject;
                                error = [NSError errorWithDomain:error.domain
                                                            code:error.code
                                                        userInfo:[userInfo copy]];
                                
                                if (isStartUsingDebugLog) {
                                    NSLog(@"ComeInterfaceUrl==%@,ErrorMessage==%@",requestUrl.URL,error);
                                }
                            } else { // No dictionary, make a new one.
                                error = [NSError errorWithDomain:error.domain
                                                            code:error.code
                                                        userInfo:@{kErrorResponseObjectKey: responseObject}];
                            }
                        }
                        
                        // Call the original handler.
                        if (originalCompletionHandler) {
                            if (isStartUsingDebugLog) {
                                NSLog(@"ComeInterfaceUrl==%@,SuccessMessage====%@",requestUrl.URL,responseObject);
                            }
                           
                            originalCompletionHandler(response, responseObject, error);
                        }
                    }];
}
@end
