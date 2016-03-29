//
//  CALayer_WechatController.m
//  CALayer再探
//
//  Created by 张学军 on 15/11/24.
//  Copyright © 2015年 张学军. All rights reserved.
//

#import "CALayer_WechatController.h"
#import "WechatEyeView.h"

@interface CALayer_WechatController ()<UIScrollViewDelegate>

@property(nonatomic,strong)WechatEyeView *eyeView;

@end

@implementation CALayer_WechatController



/**
 *  实现微信下拉视频 小眼睛动画
 */

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIScrollView *scoller = [[UIScrollView alloc] initWithFrame:self.view.frame];
    scoller.backgroundColor = [UIColor redColor];
    [self.view addSubview:scoller];
    scoller.delegate = self;
    scoller.contentSize = CGSizeMake(0, 700);
    

    _eyeView = [[WechatEyeView alloc] initWithFrame:CGRectMake(110, 80, 150, 100)];
    [scoller addSubview:_eyeView];

}


/**
 *  让偏移量和一个固定值来生成动画
 *
 *  @param scrollView <#scrollView description#>
 */
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat flag = self.view.frame.origin.y * 2.f - 20.f;
    [_eyeView animationWith:scrollView.contentOffset.y andFlag:flag];
}





@end
