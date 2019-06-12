//
//  MyContextTestView.m
//  QcxSDKDemo
//
//  Created by 乔春晓 on 2018/7/4.
//  Copyright © 2018年 乔春晓. All rights reserved.
//

#import "MyContextTestView.h"

@implementation MyContextTestView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    [self draw1];
    [self draw2];
    [self draw3];
    [self draw4];
    [self draw5];
}

// 画方块
- (void)draw1 {
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGRect rect = CGRectMake(10, 10, 100, 30);
    
    CGContextSetStrokeColorWithColor(ctx, [UIColor cyanColor].CGColor);
    CGContextSetLineWidth(ctx, 10);
    CGContextSetFillColorWithColor(ctx, [UIColor redColor].CGColor);
    CGContextAddRect(ctx, rect);
    CGContextFillPath(ctx);
}

// 画圆
- (void)draw2 {
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextAddArc(ctx, 100, 150, 80, 0, - M_PI * 3 / 2, 1);
    CGContextSetFillColorWithColor(ctx, [UIColor blueColor].CGColor);
    CGContextSetStrokeColorWithColor(ctx, [UIColor lightGrayColor].CGColor);
    CGContextFillPath(ctx);
}

// 画椭圆
- (void)draw3 {
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGRect rect = CGRectMake(10, 250, 100, 40);
    CGContextAddEllipseInRect(ctx, rect);
    CGContextSetFillColorWithColor(ctx, [UIColor purpleColor].CGColor);
    CGContextFillPath(ctx);
}

// 画多边形
- (void)draw4 {
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextBeginPath(ctx);
    
    CGContextMoveToPoint(ctx, 10, 300);
    CGContextAddLineToPoint(ctx, 100, 300);
    CGContextAddLineToPoint(ctx, 130, 330);
    CGContextAddLineToPoint(ctx, 10, 330);
    
    CGContextClosePath(ctx);
    CGContextFillPath(ctx);
    
}

// 画线
- (void)draw5 {
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextBeginPath(ctx);
    
    CGContextMoveToPoint(ctx, 10, 350);
    CGContextAddQuadCurveToPoint(ctx, 50, 450, 100, 100);
    
    CGContextSetStrokeColorWithColor(ctx, [UIColor cyanColor].CGColor);
    CGContextSetLineWidth(ctx, 13);
    CGContextStrokePath(ctx);
    
}



@end
