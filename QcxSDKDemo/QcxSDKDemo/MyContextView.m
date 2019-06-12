//
//  MyContextView.m
//  QcxSDKDemo
//
//  Created by 乔春晓 on 2018/7/3.
//  Copyright © 2018年 乔春晓. All rights reserved.
//

#import "MyContextView.h"

@implementation MyContextView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        UILabel * Label = [[UILabel alloc]initWithFrame:CGRectMake(100, 100, 200, 60)];
        [self addSubview:Label];
//        NSMutableAttributedString * mutableAttriStr = [[NSMutableAttributedString alloc] initWithString:@"Wenchen"];
        NSDictionary * attris = @{NSForegroundColorAttributeName:[UIColor whiteColor],NSStrokeColorAttributeName:[UIColor greenColor],NSStrokeWidthAttributeName:@(2),NSFontAttributeName:[UIFont systemFontOfSize:30]};
       
        NSTextAttachment *attach = [[NSTextAttachment alloc] init];
        attach.image = [UIImage imageNamed:@"1"];
        attach.bounds = CGRectMake(0, 0, 20, 20);
        NSAttributedString *imageStr = [NSAttributedString attributedStringWithAttachment:attach];
        NSMutableAttributedString * mutableAttriStr = [[NSMutableAttributedString alloc] initWithString:@"Wenchen"];
        [mutableAttriStr setAttributes:attris range:NSMakeRange(0,mutableAttriStr.length)];
        [mutableAttriStr appendAttributedString:imageStr];
        Label.attributedText = mutableAttriStr;
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    [self drawRectangle];
    [self drawCircleAtX:160 Y:230];
    [self drawEllipseAtX:60 Y:160];
    [self drawEllipseAtX:200 Y:160];
    [self drawTriangle];
    [self drawQuadCurveAtBeginX:50 beginY:130 cpx:0 cpy:100 endX:25 endY:170];
    [self drawQuadCurveAtBeginX:270 beginY:130 cpx:320 cpy:100 endX:295 endY:170];
    [self drawCurve2];
    
    [@"这些文字是画上去的" drawInRect:CGRectMake(90, 400, 300, 60) withAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSStrokeColorAttributeName:[UIColor redColor],NSStrokeWidthAttributeName:@(2),NSFontAttributeName:[UIFont systemFontOfSize:30]}];
    
    [self gl_drawTextInRect:CGRectMake(30, 500, 400, 60) text:@"画文字" attributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSStrokeColorAttributeName:[UIColor redColor],NSStrokeWidthAttributeName:@(2),NSFontAttributeName:[UIFont systemFontOfSize:30]}];
}



/**
 画方块
 */
- (void)drawRectangle {
    CGRect rectangle = CGRectMake(80, 400, 160, 60);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGContextAddRect(ctx, rectangle);
    CGContextSetFillColorWithColor(ctx, [UIColor greenColor].CGColor);
    
    CGContextFillPath(ctx);
}


/**
 CGContextAddArc(CGContextRef c, CGFloat x, CGFloat y, CGFloat radius, CGFloat startAngle, CGFloat endAngle, int clockwise)

 c           当前图形
 x           圆弧的中心点坐标x
 y           曲线控制点的y坐标
 radius      指定点的x坐标值
 startAngle  弧的起点与正X轴的夹角，
 endAngle    弧的终点与正X轴的夹角
 clockwise   指定1创建一个顺时针的圆弧，或是指定0创建一个逆时针圆弧
 */
- (void)drawCircleAtX:(CGFloat)x Y:(CGFloat)y {
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextAddArc(ctx, x, y, 150, 0, 2 * M_PI, 1);
    CGContextSetShadowWithColor(ctx, CGSizeMake(10, 10), 20.f, [UIColor grayColor].CGColor);
    CGContextSetFillColorWithColor(ctx, [UIColor yellowColor].CGColor);
    CGContextFillPath(ctx);
}


/**
 绘制椭圆,绘制椭圆我们需要先给定一个容纳椭圆的矩形，然后使用CGContextAddEllipseInRect(CGContextRef context, CGRect rect)
 */
- (void)drawEllipseAtX:(CGFloat)x Y:(CGFloat)y {
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGRect rectangle = CGRectMake(x, y, 60, 30);
    CGContextAddEllipseInRect(ctx, rectangle);
    CGContextSetFillColorWithColor(ctx, [UIColor redColor].CGColor);
    CGContextFillPath(ctx);
}


/**
 多边形
 */
- (void)drawTriangle {
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextBeginPath(ctx);
    
    CGContextMoveToPoint(ctx, 160, 40);
    CGContextAddLineToPoint(ctx, 190, 80);
    CGContextAddLineToPoint(ctx, 130, 80);
    CGContextClosePath(ctx);
    
    CGContextSetFillColorWithColor(ctx, [UIColor blueColor].CGColor);
    CGContextFillPath(ctx);
}


/**
 不规则形状(画耳朵)
 1.绘制一个弧度
 1.1第一种和贝塞尔曲线一样
 给定起始点：CGContextMoveToPoint(CGContextRef c, CGFloat x, CGFloat y)
 给定控制点和终点：CGContextAddQuadCurveToPoint(CGContextRef c, CGFloat cpx, CGFloat cpy, CGFloat x, CGFloat y)
 cpx: 曲线控制点的x坐标
 cpy: 曲线控制点的y坐标
 */
/**
 @param beginX 起始点x
 @param beginY 起始点y
 @param cpx 曲线控制点的x坐标
 @param cpy 曲线控制点的y坐标
 @param endX 结束点X
 @param endY 结束点y
 */
- (void)drawQuadCurveAtBeginX:(CGFloat)beginX
                       beginY:(CGFloat)beginY
                          cpx:(CGFloat)cpx
                          cpy:(CGFloat)cpy
                         endX:(CGFloat)endX
                         endY:(CGFloat)endY{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextBeginPath(ctx);
    
    CGContextMoveToPoint(ctx, beginX, beginY);
    CGContextAddQuadCurveToPoint(ctx, cpx, cpy, endX, endY);
    
    CGContextSetLineWidth(ctx, 10);
    CGContextSetStrokeColorWithColor(ctx, [UIColor brownColor].CGColor);
    CGContextStrokePath(ctx);
}


/**
 1.2需要两个控制点（画鼻子）
 */
- (void)drawCurve2 {
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextBeginPath(ctx);
    
    CGContextMoveToPoint(ctx, 160, 170);
    CGContextAddCurveToPoint(ctx, 160, 250, 230, 250, 160, 290);
    
    CGContextSetLineWidth(ctx, 10);
    CGContextSetStrokeColorWithColor(ctx, [UIColor brownColor].CGColor);
    CGContextStrokePath(ctx);
}


// 练习
/**
 绘制一个左右和垂直居中的文字
 
 @param rect 绘制的区域
 @param text 绘制的文字
 @param attributes 文字的样式
 */
- (void)gl_drawTextInRect:(CGRect)rect text:(NSString *)text attributes:(NSDictionary *)attributes {
    
    // 计算字体的大小
    CGSize textSize = [text sizeWithAttributes:attributes];
    
    CGFloat originX = rect.origin.x + ((rect.size.width - textSize.width) / 2.0);
    CGFloat originY = rect.origin.y + ((rect.size.height - textSize.height) / 2.0);
    // 计算绘制字体的rect
    CGRect textRect = CGRectMake(originX, originY, rect.size.width, textSize.height);
    
    // 绘制字体
    [text drawInRect:textRect withAttributes:attributes];
}

@end
