//
//  OKNetWorkHttpRequest.m
//  OKNetWorkHttpDemo
//
//  Created by lengshengren on 16/4/10.
//  Copyright © 2016年 Lengshengren. All rights reserved.
//

#import "OKNetWorkHttpRequest.h"
#import "OKNetWorkHttpSessionManager.h"



@implementation OKNetWorkHttpRequest
#pragma mark - HttpPost
+ (void)postDataWithParameters:(NSDictionary *)parameters interfaceUrlString:(NSString *)interfaceUrlString success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure {
    OKNetWorkHttpSessionManager *manager = [OKNetWorkHttpSessionManager sharedInstance];
    if (parameters == nil || ![parameters isKindOfClass:[NSDictionary class]]) {
        parameters = [NSMutableDictionary dictionary];
    }

    [manager POST:interfaceUrlString parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        if (success) {
            success(responseObject);
        }
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        if (failure) {
            failure(error);
        }
        
    }];
    
}

#pragma mark - HttpGet

+ (void)getDataWithParameters:(NSDictionary *)parameters interfaceUrlString:(NSString *)interfaceUrlString success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure {
    OKNetWorkHttpSessionManager *manager = [OKNetWorkHttpSessionManager sharedInstance];
    if (parameters == nil || ![parameters isKindOfClass:[NSDictionary class]]) {
        parameters = [NSMutableDictionary dictionary];
    }
    
    [manager GET:interfaceUrlString parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        
        if (success) {
            success(responseObject);
        }
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
    
}

#pragma mark - HttpPatch

+ (void)patchDataWithParameters:(NSDictionary *)parameters interfaceUrlString:(NSString *)interfaceUrlString success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure {
    OKNetWorkHttpSessionManager *manager = [OKNetWorkHttpSessionManager sharedInstance];
    if (parameters == nil || ![parameters isKindOfClass:[NSDictionary class]]) {
        parameters = [NSMutableDictionary dictionary];
    }
    
    [manager PATCH:interfaceUrlString parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
    
}

#pragma mark - HttpDelete

+ (void)deleteDataWithParameters:(NSDictionary *)parameters interfaceUrlString:(NSString *)interfaceUrlString success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure {
    OKNetWorkHttpSessionManager *manager = [OKNetWorkHttpSessionManager sharedInstance];
    if (parameters == nil || ![parameters isKindOfClass:[NSDictionary class]]) {
        parameters = [NSMutableDictionary dictionary];
    }
    
    [manager DELETE:interfaceUrlString parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
       
        if (success) {
            success(responseObject);
        }
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
    
}

#pragma mark - 上传图片

+ (void)postDataUploadWithParameters:(NSDictionary *)parameters interfaceUrlString:(NSString *)interfaceUrlString fileName:(NSString *)fileName fileType:(NSString *)fileTye imageData:(NSData *)imagedata success:(void (^)(id responseObject))success failure:(void (^)())failure{
    OKNetWorkHttpSessionManager *manager = [OKNetWorkHttpSessionManager sharedInstance];
    if (parameters == nil || ![parameters isKindOfClass:[NSDictionary class]]) {
        parameters = [NSMutableDictionary dictionary];
    }
    

    [manager POST:interfaceUrlString parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
    [formData appendPartWithFileData:imagedata name:@"image_file" fileName:fileName mimeType:fileTye];
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
    
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
}

#pragma mark - 下载文件

+ (void)downFileWithInterfaceUrlString:(NSString *)interfaceUrlString success:(void (^)(id responseObject))success failure:(void (^)())failure{
    OKNetWorkHttpSessionManager *manager = [OKNetWorkHttpSessionManager sharedInstance];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:interfaceUrlString]];
    NSURLSessionDownloadTask  *downloadTast = [manager downloadTaskWithRequest:request progress:nil destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
       NSURL *downloadURL = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:nil];
        return [downloadURL URLByAppendingPathComponent:[response suggestedFilename]];
        
    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
        
        if (error) {
            if (failure) {
                failure(error);
            }
        }else{
            if (success) {
                success(filePath);
            }
        }
  
    }];
    
    [downloadTast resume];
}

@end
