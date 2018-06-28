//
//  ViewController.m
//  QcxSDKDemo
//
//  Created by 乔春晓 on 2018/6/28.
//  Copyright © 2018年 乔春晓. All rights reserved.
//

#import "ViewController.h"
#import <QcxSDK/QcxSDK.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    MyTestView *view = [[MyTestView alloc] initWithFrame:CGRectMake(10, 10, 300, 500)];
    view.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:view];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
