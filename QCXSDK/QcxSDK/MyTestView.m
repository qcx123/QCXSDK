//
//  MyTestView.m
//  GitDemo
//
//  Created by 乔春晓 on 2018/6/27.
//  Copyright © 2018年 乔春晓. All rights reserved.
//

#import "MyTestView.h"
#import <Masonry.h>

@interface MyTestView ()
//@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UIButton *btn;
@property (nonatomic, assign) NSInteger i;
@end

// 测试提交

@implementation MyTestView

- (instancetype)initWithFrame:(CGRect)frame{
    if ([super initWithFrame:frame]) {
        _i = 10;
        _btn = [UIButton buttonWithType:(UIButtonTypeCustom)];
//        _btn.frame = CGRectMake(0, 0, 60, 25);
        [_btn setTitle:@"点我" forState:(UIControlStateNormal)];
        [_btn setTitleColor:[UIColor redColor] forState:(UIControlStateNormal)];
        _btn.backgroundColor = [UIColor yellowColor];
        [self addSubview:_btn];
        [_btn addTarget:self action:@selector(btnAction) forControlEvents:(UIControlEventTouchUpInside)];
        [_btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(60);
            make.height.mas_equalTo(25);
            make.top.mas_equalTo(self).offset(0);
            make.left.mas_equalTo(self).offset(0);
        }];
        
        
    }
    return self;
}

- (void)btnAction {
    _i += 10;
    [self setNeedsUpdateConstraints];
}

- (void)updateConstraints{
    __weak MyTestView *weakSelf = self;
    [_btn mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(60);
        make.height.mas_equalTo(25);
        make.top.mas_equalTo(self).offset(weakSelf.i);
        make.left.mas_equalTo(self).offset(weakSelf.i);
    }];
    [super updateConstraints];
}

@end
