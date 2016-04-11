# OKNetWorkHttpDemo
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
