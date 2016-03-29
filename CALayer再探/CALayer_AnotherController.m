//
//  CALayer_AnotherController.m
//  CALayer再探
//
//  Created by 张学军 on 15/11/24.
//  Copyright © 2015年 张学军. All rights reserved.
//

#import "CALayer_AnotherController.h"

@interface CALayer_AnotherController ()

@end

@implementation CALayer_AnotherController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    [self draw];
}

/**
 *  画一个不规则形状
 */
- (void)draw {
    CGPoint pointOne = CGPointMake(0, 300);
    CGPoint pointTwo = CGPointMake(0, 400);
    CGPoint pointThree = CGPointMake(320, 400);
    CGPoint pointFour = CGPointMake(320, 300);
    
    CGPoint controlPoint = CGPointMake(160, 260);
    
    
    CAShapeLayer *layer = [CAShapeLayer layer];
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:pointOne];
    [path addLineToPoint:pointTwo];
    [path addLineToPoint:pointThree];
    
    [path addLineToPoint:pointFour];
    
    [path addCurveToPoint:pointOne controlPoint1:controlPoint controlPoint2:controlPoint];
    
    
    layer.path = path.CGPath;
    layer.strokeColor = [UIColor redColor].CGColor;
    [self.view.layer addSublayer:layer];
    
}


@end
