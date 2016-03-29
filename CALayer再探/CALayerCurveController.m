//
//  CALayerCurveController.m
//  CALayer再探
//
//  Created by 张学军 on 15/11/24.
//  Copyright © 2015年 张学军. All rights reserved.
//

#import "CALayerCurveController.h"

@interface CALayerCurveController ()

@end

@implementation CALayerCurveController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self drawOne];
    [self drawTwo];
}


//三点画曲线 曲线并不会到达控制点 控制点决定曲率
- (void)drawOne {
    
    CGPoint startPoint = CGPointMake(40, 120);
    CGPoint controlPoint = CGPointMake(100, 70);
    CGPoint endPoint = CGPointMake(200, 150);
    
    CALayer *layer1 = [CALayer layer];
    layer1.frame = CGRectMake(startPoint.x, startPoint.y, 5, 5);
    layer1.backgroundColor = [UIColor redColor].CGColor;
    
    CALayer *layer2 = [CALayer layer];
    layer2.frame = CGRectMake(controlPoint.x, controlPoint.y, 5, 5);
    layer2.backgroundColor = [UIColor redColor].CGColor;
    
    CALayer *layer3 = [CALayer layer];
    layer3.frame =  CGRectMake(endPoint.x, endPoint.y, 5, 5);
    layer3.backgroundColor = [UIColor redColor].CGColor;
    
    //重点
    CAShapeLayer *layer = [CAShapeLayer layer];
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:startPoint];//移动到起始点
    [path addCurveToPoint:endPoint controlPoint1:controlPoint controlPoint2:controlPoint];//设置结束点和控制点
    layer.path = path.CGPath;
    layer.strokeColor = [UIColor cyanColor].CGColor;
    layer.fillColor = [UIColor clearColor].CGColor;
    
    

    [self.view.layer addSublayer:layer];
    [self.view.layer addSublayer:layer1];
    [self.view.layer addSublayer:layer2];
    [self.view.layer addSublayer:layer3];
}

//两个控制点 可以画正余弦曲线
- (void)drawTwo {
    CGPoint startPoint = CGPointMake(50, 400);
    CGPoint controlPoint1 = CGPointMake(130, 250);
    CGPoint controlPoint2 = CGPointMake(190, 550);
    CGPoint endPoint = CGPointMake(270, 400);
    
    CALayer *layer1 = [CALayer layer];
    layer1.frame = CGRectMake(startPoint.x, startPoint.y, 5, 5);
    layer1.backgroundColor = [UIColor redColor].CGColor;
    
    CALayer *layer2 = [CALayer layer];
    layer2.frame = CGRectMake(controlPoint1.x, controlPoint1.y, 5, 5);
    layer2.backgroundColor = [UIColor redColor].CGColor;
    
    CALayer *layer3 = [CALayer layer];
    layer3.frame =  CGRectMake(endPoint.x, endPoint.y, 5, 5);
    layer3.backgroundColor = [UIColor redColor].CGColor;
    
    CALayer *layer4 = [CALayer layer];
    layer4.frame = CGRectMake(controlPoint2.x, controlPoint2.y, 5, 5);
    layer4.backgroundColor = [UIColor redColor].CGColor;
    
    //重点
    CAShapeLayer *layer = [CAShapeLayer layer];
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:startPoint];//移动到起始点
    [path addCurveToPoint:endPoint controlPoint1:controlPoint1 controlPoint2:controlPoint2];//设置结束点和控制点
    layer.path = path.CGPath;
    layer.strokeColor = [UIColor cyanColor].CGColor;
    layer.fillColor = [UIColor clearColor].CGColor;
    
    
    
    [self.view.layer addSublayer:layer];
    [self.view.layer addSublayer:layer1];
    [self.view.layer addSublayer:layer2];
    [self.view.layer addSublayer:layer3];
    [self.view.layer addSublayer:layer4];
  
    
}

@end
