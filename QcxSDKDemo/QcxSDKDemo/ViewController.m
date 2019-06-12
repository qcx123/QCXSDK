//
//  ViewController.m
//  QcxSDKDemo
//
//  Created by 乔春晓 on 2018/6/28.
//  Copyright © 2018年 乔春晓. All rights reserved.
//

#import "ViewController.h"
#import <QcxSDK/QcxSDK.h>
#import "MyContextView.h"
#import "MyContextTestView.h"
#import "MyBezierView.h"

#import <AVKit/AVKit.h>
#import "TestViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    MyTestView *view = [[MyTestView alloc] initWithFrame:CGRectMake(10, 10, 300, 500)];
//    view.backgroundColor = [UIColor lightGrayColor];
//    [self.view addSubview:view];
    self.view.backgroundColor = [UIColor whiteColor];
    
//    MyContextView *contextView = [[MyContextView alloc] initWithFrame:self.view.frame];
//    contextView.backgroundColor = [UIColor whiteColor];
//    [self.view addSubview:contextView];
    
    
//    MyContextTestView *contextView = [[MyContextTestView alloc] initWithFrame:self.view.frame];
//    contextView.backgroundColor = [UIColor whiteColor];
//    [self.view addSubview:contextView];
    
//    MyBezierView *contextView = [[MyBezierView alloc] initWithFrame:self.view.frame];
//    contextView.backgroundColor = [UIColor whiteColor];
//    [self.view addSubview:contextView];
    
    
    
}



- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    AVPlayer *player = [AVPlayer playerWithURL:[[NSBundle mainBundle] URLForResource:@"2.mp4" withExtension:nil]];
//    AVPlayerViewController *playerVC = [[AVPlayerViewController alloc] init];
//    playerVC.player = player;
//
//    [self presentViewController:playerVC animated:YES completion:nil];
    
//    playerVC.view.frame = CGRectMake(0, 300, self.view.frame.size.width, 300);
//    [self.view addSubview:playerVC.view];
//    [self addChildViewController:playerVC];
    
    TestViewController *vc = [[TestViewController alloc] init];
    [self presentViewController:vc animated:YES completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
