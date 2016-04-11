//
//  OKNetWorkHttpRequest.h
//  OKNetWorkHttpDemo
//
//  Created by lengshengren on 16/4/10.
//  Copyright © 2016年 Lengshengren. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OKNetWorkHttpRequest : NSObject

+ (void)postDataWithParameters:(NSDictionary *)parameters interfaceUrlString:(NSString *)interfaceUrlString success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;

+ (void)getDataWithParameters:(NSDictionary *)parameters interfaceUrlString:(NSString *)interfaceUrlString success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;

+ (void)patchDataWithParameters:(NSDictionary *)parameters interfaceUrlString:(NSString *)interfaceUrlString success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;

+ (void)deleteDataWithParameters:(NSDictionary *)parameters interfaceUrlString:(NSString *)interfaceUrlString success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure ;

+ (void)postDataUploadWithParameters:(NSDictionary *)parameters interfaceUrlString:(NSString *)interfaceUrlString fileName:(NSString *)fileName fileType:(NSString *)fileTye imageData:(NSData *)imagedata success:(void (^)(id responseObject))success failure:(void (^)())failure;

+ (void)downFileWithInterfaceUrlString:(NSString *)interfaceUrlString success:(void (^)(id responseObject))success failure:(void (^)())failure;
@end
