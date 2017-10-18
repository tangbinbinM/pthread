//
//  ViewController.m
//  iOS线程pthread简单使用
//
//  Created by YiGuo on 2017/10/18.
//  Copyright © 2017年 tbb. All rights reserved.
//

#import "ViewController.h"
//引入系统库
#import <pthread.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

void * run(void *param){
    NSLog(@"param:%@",param);
    for (NSInteger i =0 ;i<10000 ;i++) {
        NSLog(@"----butpThread---%zd--%@",i,[NSThread currentThread]);
    }
    return 0;
}

- (IBAction)butpThread:(id)sender {
    pthread_t thread;
    //参数1.传入的线程地址，线程属性，线程执行的任务，函数参数
    pthread_create(&thread, NULL, run, NULL);
    //同时开启多条线程
    pthread_t pthreads;
    pthread_create(&pthreads, NULL, run, @"ddd");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
