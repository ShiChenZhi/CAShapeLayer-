//
//  ViewController.m
//  画图
//
//  Created by shichenzhi on 2017/9/7.
//  Copyright © 2017年 shichenzhi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //画曲线
//    [self drawLine];
    //直线动画
//    [self drawAnimated];
    //周围扩散动画
//    [self drawAnimatedTwo]
    //曲线动画
//    [self drawAnimatedThree];
    //圆形（环形）动画
    [self drawAnimatedFour];
}

- (void)drawAnimatedFour
{
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(375/2-100, 667/2-100, 200, 200)];
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation.duration = 3.0;
    animation.fromValue = @(0);
    animation.toValue = @(1);
    animation.repeatCount = 100;
    
    CAShapeLayer *layer = [self createShapeLayerNoFrame:[UIColor clearColor]];
    layer.path = path.CGPath;
    layer.lineWidth = 25.0;
    //圆的起始位置，默认为0
    layer.strokeStart = 0;
    //圆的结束位置，默认为1，如果值为0.75，则显示3/4的圆
    layer.strokeEnd = 1;
    [layer addAnimation:animation forKey:@"strokeEndAnimation"];
}

- (void)drawAnimatedThree
{
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(50, 667/2)];
    [path addCurveToPoint:CGPointMake(330, 667/2) controlPoint1:CGPointMake(125, 200) controlPoint2:CGPointMake(185, 450)];
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation.duration = 5;
    animation.fromValue = @(0);
    animation.toValue = @(1);
    animation.repeatCount = 100;
    
    CAShapeLayer *layer = [self createShapeLayerNoFrame:[UIColor clearColor]];
    layer.path = path.CGPath;
    layer.lineWidth = 2.0;
    [layer addAnimation:animation forKey:@"strokeEndAnimation"];
}

- (void)drawAnimated
{
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(50, 667/2)];
    [path addLineToPoint:CGPointMake(375/2, 667/2)];
    [path addLineToPoint:CGPointMake(300, 667/2)];
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation.duration = 5;
    animation.fromValue = @(0);
    animation.toValue = @(1);
    animation.repeatCount = 100;
    
    CAShapeLayer *layer = [self createShapeLayerNoFrame:[UIColor orangeColor]];
    layer.path = path.CGPath;
    layer.lineWidth = 2.0;
//    layer.strokeStart = 0;
//    layer.strokeEnd = 0;
    [layer addAnimation:animation forKey:@"strokeEndAnimation"];
}

- (void)drawLine
{
    UIBezierPath *path = [self startPoint:CGPointMake(50, 300) endPoint:CGPointMake(200, 300) controlPoint:CGPointMake(125, 200)];
    
    UIBezierPath *path1 = [self startPoint:CGPointMake(200, 300) endPoint:CGPointMake(350, 300) controlPoint:CGPointMake(275, 400)];
    
    CAShapeLayer *layer = [self createShapeLayer:[UIColor orangeColor]];
    layer.path = path.CGPath;
    
    CAShapeLayer *layer1 = [self createShapeLayer:[UIColor greenColor]];
    layer1.path = path1.CGPath;
}

- (void)drawAnimatedTwo
{
    UIBezierPath *path = [self bezierPathOne];
    UIBezierPath *path1 = [self bezierPathTwo];
    
    CABasicAnimation *one = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    one.fromValue = (__bridge id _Nullable)(path.CGPath);
    one.toValue = (__bridge id _Nullable)(path1.CGPath);
    one.duration = 2;
    
    CAShapeLayer *layer = [self createShapeLayerNoFrame:[UIColor clearColor]];
    layer.path = path1.CGPath;
    [layer addAnimation:one forKey:@"strokeEndAnimation"];
}

- (UIBezierPath *)bezierPathOne
{
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(22.5, 2.5)];
    [path addLineToPoint:CGPointMake(31, 25)];
    [path addLineToPoint:CGPointMake(22, 32)];
    [path addLineToPoint:CGPointMake(17, 15)];
    [path closePath];
    
    return path;
}

- (UIBezierPath *)bezierPathTwo
{
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(22.5, 2.5)];
    [path addLineToPoint:CGPointMake(40, 25)];
    [path addLineToPoint:CGPointMake(22, 35)];
    [path addLineToPoint:CGPointMake(13, 10)];
    [path closePath];
    
    return path;
}

/**
 配置贝塞尔曲线

 @param startPoint 起始点
 @param endPoint 结束点
 @param controlPoint 控制点
 @return UIBezierPath对象
 */
- (UIBezierPath *)startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint controlPoint:(CGPoint)controlPoint
{
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:startPoint];
    [path addQuadCurveToPoint:endPoint controlPoint:controlPoint];
    
    return path;
}

- (CAShapeLayer *)createShapeLayer:(UIColor *)color
{
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.frame = CGRectMake(0, 0, 50, 50);
    //设置背景色
//    layer.backgroundColor = [UIColor cyanColor].CGColor;
    //设置描边色
    layer.strokeColor = [UIColor blackColor].CGColor;
    //设置填充色
    layer.fillColor = color.CGColor;
    [self.view.layer addSublayer:layer];
    
    return layer;
}

- (CAShapeLayer *)createShapeLayerNoFrame:(UIColor *)color
{
    CAShapeLayer *layer = [CAShapeLayer layer];
    //设置背景色
    //    layer.backgroundColor = [UIColor cyanColor].CGColor;
    //设置描边色
    layer.strokeColor = [UIColor orangeColor].CGColor;
    //设置填充色
    layer.fillColor = color.CGColor;
    [self.view.layer addSublayer:layer];
    
    return layer;
}

- (CALayer *)createLayer
{
    CALayer *layer = [CALayer layer];
    layer.borderWidth = 1.0;
    layer.borderColor = [UIColor blackColor].CGColor;
    [self.view.layer addSublayer:layer];
    
    return layer;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
