//
//  WechatEyeView.m
//  CALayer再探
//
//  Created by 张学军 on 15/11/24.
//  Copyright © 2015年 张学军. All rights reserved.
//

#import "WechatEyeView.h"

@interface WechatEyeView()

@property (strong, nonatomic) CAShapeLayer *topEyesocketLayer;

@property (strong, nonatomic) CAShapeLayer *eyeballLayer;

@property (strong, nonatomic) CAShapeLayer *bottomEyesocketLayer;

@property (strong, nonatomic) CAShapeLayer *eyeFirstLightLayer;

@property (strong, nonatomic) CAShapeLayer *eyeSecondLightLayer;

@end



@implementation WechatEyeView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
//        self.backgroundColor = [UIColor cyanColor];
        [self.layer addSublayer:self.topEyesocketLayer];
        [self.layer addSublayer:self.eyeballLayer];
        [self.layer addSublayer:self.bottomEyesocketLayer];
        [self.layer addSublayer:self.eyeFirstLightLayer];
        [self.layer addSublayer:self.eyeSecondLightLayer];
        [self setupAnimation];
    }
    return self;
}

- (void)setupAnimation {
    self.eyeFirstLightLayer.lineWidth = 0.f;
    self.eyeSecondLightLayer.lineWidth = 0.f;
    self.eyeballLayer.opacity = 0.f;//相当于alpha
    _bottomEyesocketLayer.strokeStart = 0.5f;
    _bottomEyesocketLayer.strokeEnd = 0.5f;
    _topEyesocketLayer.strokeStart = 0.5f;
    _topEyesocketLayer.strokeEnd = 0.5f;
}

- (CAShapeLayer *)topEyesocketLayer {
    if (!_topEyesocketLayer) {
        _topEyesocketLayer = [CAShapeLayer layer];

        //上眼眶  画曲线
        CGPoint startPoint = CGPointMake(0, self.frame.size.height/2);
        CGPoint endPoint = CGPointMake(self.frame.size.width, self.frame.size.height/2);
        CGPoint controlPoint = CGPointMake(self.frame.size.width/2, 0);
        
        UIBezierPath *path = [UIBezierPath bezierPath];
        [path moveToPoint:startPoint];
        [path addCurveToPoint:endPoint controlPoint1:controlPoint controlPoint2:controlPoint];
        _topEyesocketLayer.path = path.CGPath;
        _topEyesocketLayer.strokeColor = [UIColor whiteColor].CGColor;
        _topEyesocketLayer.fillColor = [UIColor clearColor].CGColor;
    }
    return _topEyesocketLayer;
}

- (CAShapeLayer *)bottomEyesocketLayer {
    if (!_bottomEyesocketLayer) {
        _bottomEyesocketLayer = [CAShapeLayer layer];
        
        //底部眼眶 曲线
        CGPoint startPoint = CGPointMake(0, self.frame.size.height/2);
        CGPoint endPoint = CGPointMake(self.frame.size.width, self.frame.size.height/2);
        CGPoint controlPoint = CGPointMake(self.frame.size.width/2, self.frame.size.height);
        
        UIBezierPath *path = [UIBezierPath bezierPath];
        [path moveToPoint:startPoint];
        [path addCurveToPoint:endPoint controlPoint1:controlPoint controlPoint2:controlPoint];
        _bottomEyesocketLayer.path = path.CGPath;
        _bottomEyesocketLayer.strokeColor = [UIColor whiteColor].CGColor;
        _bottomEyesocketLayer.fillColor = [UIColor clearColor].CGColor;
    }
    return _bottomEyesocketLayer;
}

- (CAShapeLayer *)eyeballLayer {
    if (!_eyeballLayer) {
        //眼球 圆
        _eyeballLayer = [CAShapeLayer layer];
        UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.frame.size.width/2, self.frame.size.height/2) radius:self.frame.size.height*.3 startAngle:0 endAngle:M_PI*2 clockwise:YES];
        
        _eyeballLayer.path = path.CGPath;
        _eyeballLayer.fillColor = [UIColor clearColor].CGColor;
        _eyeballLayer.strokeColor = [UIColor whiteColor].CGColor;
    }
    return _eyeballLayer;
}

- (CAShapeLayer *)eyeFirstLightLayer {
    if (!_eyeFirstLightLayer) {
        _eyeFirstLightLayer = [CAShapeLayer layer];
        //圆弧
        UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.frame.size.width/2, self.frame.size.height/2) radius:self.frame.size.height *.2 startAngle:210.f/180.f*M_PI endAngle:225.f/180.f*M_PI clockwise:YES];
        _eyeFirstLightLayer.path = path.CGPath;
        _eyeFirstLightLayer.fillColor = [UIColor clearColor].CGColor;
        _eyeFirstLightLayer.strokeColor = [UIColor whiteColor].CGColor;
    }
    return _eyeFirstLightLayer;
}



- (CAShapeLayer *)eyeSecondLightLayer {
    if (!_eyeSecondLightLayer) {
        _eyeSecondLightLayer = [CAShapeLayer layer];
        //圆弧
        UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.frame.size.width/2, self.frame.size.height/2) radius:self.frame.size.height*.2 startAngle:240.f/180.f*M_PI endAngle:270.f/180.f*M_PI clockwise:YES];
        _eyeSecondLightLayer.path = path.CGPath;
        _eyeSecondLightLayer.fillColor = [UIColor clearColor ].CGColor;
        _eyeSecondLightLayer.strokeColor = [UIColor whiteColor].CGColor;
        
        
    }
    return _eyeSecondLightLayer;
    
}


- (void)animationWith:(CGFloat)y andFlag:(CGFloat)flag{
    
    /**
     *  偏移量<固定值
        线宽<5
        线宽每次+1
     */
    if (y < flag) {
        if (self.eyeFirstLightLayer.lineWidth < 5.f) {
            self.eyeFirstLightLayer.lineWidth += 1.f;
            self.eyeSecondLightLayer.lineWidth += 1.f;
        }
    }
    
    /**
     *  确保每次眼球比中间线  先出来或者先消失
        不透明度变化
     */
    if(y < flag - 20) {
        if (self.eyeballLayer.opacity <= 1.0f) {
            self.eyeballLayer.opacity += 0.1f;
        }
        
    }
    
    /**
     *  确保每次眼眶比眼球 先出来或者先消失
     */
    if (y < flag - 40) {
        if (self.topEyesocketLayer.strokeEnd < 1.f && self.topEyesocketLayer.strokeStart > 0.f) {
            self.topEyesocketLayer.strokeEnd += 0.1f;
            self.topEyesocketLayer.strokeStart -= 0.1f;
            self.bottomEyesocketLayer.strokeEnd += 0.1f;
            self.bottomEyesocketLayer.strokeStart -= 0.1f;
        }
    }
    
    if (y > flag - 40) {
        if (self.topEyesocketLayer.strokeEnd > 0.5f && self.topEyesocketLayer.strokeStart < 0.5f) {
            self.topEyesocketLayer.strokeEnd -= 0.1f;
            self.topEyesocketLayer.strokeStart += 0.1f;
            self.bottomEyesocketLayer.strokeEnd -= 0.1f;
            self.bottomEyesocketLayer.strokeStart += 0.1f;
        }
    }
    
    if (y > flag - 20) {
        if (self.eyeballLayer.opacity >= 0.0f) {
            self.eyeballLayer.opacity -= 0.1f;
        }
    }
    
    if (y > flag) {
        if (self.eyeFirstLightLayer.lineWidth > 0.f) {
            self.eyeFirstLightLayer.lineWidth -= 1.f;
            self.eyeSecondLightLayer.lineWidth -= 1.f;
        }
    }
}

@end
