//
//  ViewController.m
//  NSUserDefaults
//
//  Created by sw on 2019/6/18.
//  Copyright © 2019 WS. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults registerDefaults:@{@"cityId": @(0)}];
    id cityId = [defaults objectForKey:@"cityId"];
    NSLog(@"cityId: %@", cityId);
    UILabel *lbl = [UILabel new];
    lbl.frame= CGRectMake(100, 50, 100, 20);
    lbl.text = [NSString stringWithFormat:@"cityId: %@", cityId];
    lbl.textColor = [UIColor redColor];
    [self.view addSubview:lbl];
    
    NSProcessInfo *info = [NSProcessInfo processInfo];
    NSLog(@"%@",info.globallyUniqueString);  // 获取唯一的标示符，每次调用都会不一样，可以用作一些临时缓存文件的名字
    NSLog(@"%f",info.systemUptime);  // 上次设备重启到现在的秒数
    NSLog(@"%@",info.environment); // 获取运行该进程的系统的环境变量 NSLog(@"%@",info.arguments); // 获取运行该进程的参数
//    NSLog(@"%@",info.hostName); // 获取主机名称
//    NSLog(@"%@",info.processName); // 获取该进程的进程名
//    NSLog(@"%d",info.processIdentifier); // 获取该程序的进程标示符
//    NSLog(@"%@",info.operatingSystemVersionString); // 系统版本（可用[UIDevice currentDevice].systemVersion代替）
//    NSLog(@"%lu",info.processorCount); // 获取当前项目进程数量
//    NSLog(@"%lu",info.activeProcessorCount); // 获取当前项目活跃进程数量
//    NSLog(@"%llu",info.physicalMemory); // 设备的CPU物理内存（单位：byte）
//    - (void)disableSuddenTermination // 禁止应用突然被干掉（仅限MAC OS）
//    - (void)enableSuddenTermination // 允许应用突然被干掉（仅限MAC OS）
//    - (void)disableAutomaticTermination:(NSString *)reason // 禁止应用突然被干掉的理由（仅限MAC OS）
//    - (void)enableAutomaticTermination:(NSString *)reason // 允许应用突然被干掉的理由（仅限MAC OS）
//    NSLog(@"%d",info.automaticTerminationSupportEnabled); // 是否支持自动终止（仅限MAC OS）
}


@end
