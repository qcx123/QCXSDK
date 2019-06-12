//
//  MyBezierView.m
//  QcxSDKDemo
//
//  Created by 乔春晓 on 2018/7/4.
//  Copyright © 2018年 乔春晓. All rights reserved.
//

#import "MyBezierView.h"

@implementation MyBezierView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    
    // 1.画一条直线
    UIBezierPath *path = [[UIBezierPath alloc] init];
    path.lineWidth = 3.0f;
    path.lineCapStyle = kCGLineCapSquare;
    path.lineJoinStyle = kCGLineCapRound;
    path.miterLimit = 10.f;
    path.flatness = 10.f;
    path.usesEvenOddFillRule = YES;

    // 设置起始点
    [path moveToPoint:CGPointMake(10, 10)];
    // 添加自路径
    [path addLineToPoint:CGPointMake(50, 10)];
    // 根据坐标点连线
    [path stroke];
    
    // 2.绘制折线就是加一个端点
    UIBezierPath *path1 = [[UIBezierPath alloc] init];
    [path1 moveToPoint:CGPointMake(10, 60)];
    [path1 addLineToPoint:CGPointMake(100, 60)];
    [path1 addLineToPoint:CGPointMake(50, 80)];
    [path1 closePath];
    [path1 stroke];
    
    // 3.矩形，第一种用折线（不再展示）第二种用另一种初始化方法
    UIBezierPath *path2 = [UIBezierPath bezierPathWithRect:CGRectMake(10, 100, 100, 30)];
//    [path2 fill];
    [path2 stroke];
    
    // 4.绘制圆角矩形
    UIBezierPath *path3 = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(200, 30, 150, 30) cornerRadius:5];
    [path3 stroke];
    
    UIBezierPath *path4 = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(200, 70, 150, 30) byRoundingCorners:UIRectCornerTopLeft | UIRectCornerBottomRight cornerRadii:CGSizeMake(5, 5)];
    [[UIColor redColor] set];
    [path4 stroke];
    
}


@end
