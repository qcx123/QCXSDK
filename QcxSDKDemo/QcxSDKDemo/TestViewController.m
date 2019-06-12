//
//  TestViewController.m
//  QcxSDKDemo
//
//  Created by 乔春晓 on 2019/4/26.
//  Copyright © 2019 乔春晓. All rights reserved.
//

#import "TestViewController.h"

@interface TestViewController ()

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor blueColor];
    
    UIButton *btn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    btn.frame = CGRectMake(0, 0, 100, 100);
    btn.backgroundColor = [UIColor redColor];
    btn.center = self.view.center;
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:btn];
}

- (void)btnClick:(UIButton *)btn {
    UIViewController *vc = [[UIViewController alloc] init];
    vc.view.backgroundColor = [UIColor cyanColor];
    __weak typeof(self) weakSealf = self;
    NSLog(@"weakSelf = %@",weakSealf);
    [self presentViewController:vc animated:YES completion:^{
        typeof(self) theSelf = weakSealf;
        if (theSelf) {
            NSLog(@"theSelf = %@",theSelf);
            [theSelf dismissViewControllerAnimated:YES completion:nil];
        }
    }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
