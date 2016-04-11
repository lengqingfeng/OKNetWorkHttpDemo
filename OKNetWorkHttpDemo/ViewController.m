//
//  ViewController.m
//  OKNetWorkHttpDemo
//
//  Created by lengshengren on 16/4/11.
//  Copyright © 2016年 Lengshengren. All rights reserved.
//

#import "ViewController.h"
#import "OKNetWorkHttpAPIManager.h"
#import "OKNetWorkHttpMonitorNetWork.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[OKNetWorkHttpAPIManager sharedInstance]requestHomeListWithParams:nil Success:^(id responseObject) {
        // NSLog(@"data ===== %@",responseObject);
    } failure:^(NSError *error) {
        
    }];
    
    [[OKNetWorkHttpMonitorNetWork sharedInstance]monitorNetWork:^(BOOL responseObject) {
        
        if (responseObject) {
            NSLog(@"有网");
        }else{
            NSLog(@"没网");
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
