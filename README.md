# OKNetWorkHttpDemo v1.0
简单，没有黑魔法！更方便自定义！

简单调用
    
    [[OKNetWorkHttpAPIManager sharedInstance]requestHomeListWithParams:nil Success:^(id responseObject) {
       
    } failure:^(NSError *error) {
        
    }];
    
监测有没有网络

    [[OKNetWorkHttpMonitorNetWork sharedInstance]monitorNetWork:^(BOOL responseObject) {
        
        if (responseObject) {
            NSLog(@"有网");
        }else{
            NSLog(@"没网");
        }
    }];
配置是否支持HTTPS ,管理测试环境和线上环境基类URL，版本号，是否开启日志 ，   
  OKNetWorkConfigure.h
    
管理业务相关API接口  
    OKNetWorkHttpAPIManager.m
    
      #pragma mark - 首页展示接口 V1.0
     -(void)requestHomeListWithParams:(NSDictionary *)params Success:(SuccessResponseObject)success      failure:(ErrorResponseObject)failure{

      NSString *url = @"/article/cate/123.json?appid=AGcCMAhmB2YBOQ%3D%3D&appType=iPhone&token=6eadc9f537435da3c453f028ada5d54a&version=2.3.1&page=1";
    
      [OKNetWorkHttpRequest postDataWithParameters:params interfaceUrlString:url success:^(id responseObject) {
         success(responseObject);
     } failure:^(NSError *error) {
         failure(error);
       }];
    
}

OKNetWorkHttp2.0

https://github.com/lengqingfeng/OKNetWorkHttp2.0
