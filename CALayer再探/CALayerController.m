//
//  CALayerController.m
//  CALayer再探
//
//  Created by 张学军 on 15/11/24.
//  Copyright © 2015年 张学军. All rights reserved.
//

#import "CALayerController.h"

@interface CALayerController ()

@end

@implementation CALayerController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self draw];
    [self drawOne];
    [self drawTwo];
}


- (void)draw {
    
    //基本
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.frame = CGRectMake(0, 100, 200, 100);
    layer.backgroundColor = [UIColor blackColor].CGColor;
    [self.view.layer addSublayer:layer];
}

/**
 *  用贝塞尔曲线画矩形
 
 backgroundColor无效
 */
- (void)drawOne {
    
    CAShapeLayer *layer = [CAShapeLayer layer];
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(0, 250, 200, 100)];
    layer.path = path.CGPath;
    layer.strokeColor = [UIColor redColor].CGColor;//边框色 轨道色
    layer.fillColor = [UIColor whiteColor].CGColor;//填充色
    layer.lineWidth = 10;
    
//    layer.backgroundColor = [UIColor cyanColor].CGColor; 无效
    
    [self.view.layer addSublayer:layer];
}


- (void)drawTwo {
    CAShapeLayer *layer = [CAShapeLayer layer];
    //多种初始化方式
//    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 400, 200, 100) cornerRadius:50];
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(200, 440) radius:50 startAngle:M_PI endAngle:5.0/3*M_PI clockwise:YES];
    layer.path = path.CGPath;
    layer.fillColor = [UIColor yellowColor].CGColor;
    layer.strokeColor = [UIColor blueColor].CGColor;
    [self.view.layer addSublayer:layer];
}

@end
