//
//  CALayer_curveAnimationController.m
//  CALayer再探
//
//  Created by 张学军 on 15/11/24.
//  Copyright © 2015年 张学军. All rights reserved.
//

#import "CALayer_curveAnimationController.h"

@interface CALayer_curveAnimationController ()

@property(nonatomic,strong)CAShapeLayer *layer;

@end

@implementation CALayer_curveAnimationController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self draw];
    
    
    //取消注释可以看动画
    [self animationOne];
    [self animationTwo];
    [self animationThree];
}


- (void)draw {
    
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
    _layer = [CAShapeLayer layer];
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:startPoint];//移动到起始点
    [path addCurveToPoint:endPoint controlPoint1:controlPoint1 controlPoint2:controlPoint2];//设置结束点和控制点
    _layer.path = path.CGPath;
    _layer.strokeColor = [UIColor cyanColor].CGColor;
    _layer.fillColor = [UIColor clearColor].CGColor;
    
    
    
    [self.view.layer addSublayer:_layer];
    [self.view.layer addSublayer:layer1];
    [self.view.layer addSublayer:layer2];
    [self.view.layer addSublayer:layer3];
    [self.view.layer addSublayer:layer4];
    
   
}
/**
 * 这个动画的来源都是 @"strokeEnd" 这个path
 
 并且 strokeEnd这个属性范围是 0-1
 */
- (void)animationOne {
    

    CABasicAnimation *ani = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    ani.fromValue = @0;
    ani.toValue = @1;
    ani.duration = 2;
    ani.repeatCount = MAXFLOAT;
    [_layer addAnimation:ani forKey:@""];
}

/**
 *  两个动画一起执行
 */
- (void)animationTwo {

    CABasicAnimation *ani1 = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    ani1.fromValue = @0.5;
    ani1.toValue = @1;
    ani1.duration = 1;
    ani1.repeatCount = MAXFLOAT;
    [_layer addAnimation:ani1 forKey:@""];
    
    CABasicAnimation *ani2 = [CABasicAnimation animationWithKeyPath:@"strokeStart"];
    ani2.fromValue = @0.5;
    ani2.toValue = @0;
    ani2.duration = 1;
    ani2.repeatCount = MAXFLOAT;
    [_layer addAnimation:ani2 forKey:@""];
}



/**
 *  线宽变化
 */
- (void)animationThree {
    
    
    CABasicAnimation *ani = [CABasicAnimation animationWithKeyPath:@"lineWidth"];
    ani.fromValue = @1;
    ani.toValue = @10;
    ani.duration = 2;
    ani.repeatCount = MAXFLOAT;
    [_layer addAnimation:ani forKey:@""];
}
@end
