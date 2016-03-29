//
//  ViewController.m
//  CALayer再探
//
//  Created by 张学军 on 15/11/24.
//  Copyright © 2015年 张学军. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)NSMutableArray *titles;

@property(nonatomic,strong)NSMutableArray *classNames;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _titles = [NSMutableArray array];
    _classNames = [NSMutableArray array];
    
    [self addCell:@"CALayer" andClass:@"CALayerController"];
    [self addCell:@"CALayer-Curve" andClass:@"CALayerCurveController"];
    [self addCell:@"CALayer-CurveAnimation" andClass:@"CALayer_curveAnimationController"];
    [self addCell:@"CALayer_Another" andClass:@"CALayer_AnotherController"];
    [self addCell:@"CALayer_Wechat" andClass:@"CALayer_WechatController"];
    
    UITableView *table = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    table.delegate = self;
    table.dataSource = self;
    [self.view addSubview:table];
    
}

- (void)addCell:(NSString *)cell andClass:(NSString *)className {
    [_titles addObject:cell];
    [_classNames addObject:className];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _titles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"identifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.textLabel.text = _titles[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *className = _classNames[indexPath.row];
    Class class = NSClassFromString(className);
    
    if (class) {
        UIViewController *vc = class.new;
        vc.title = _titles[indexPath.row];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

@end
