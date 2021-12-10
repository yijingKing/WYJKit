/*
  Created by King on 2021
  Copyright © 2021年 King. All rights reserved.
*/

#import "WYJBaseViewController.h"


@interface WYJBaseViewController ()

@property(nonatomic, copy)void (^block)(UIImage *);
/// //判断是否加载中
@property (nonatomic ,assign)BOOL isLoading;
@end

@implementation WYJBaseViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)injected{
    NSLog(@"injected--%@",self);
    [self viewDidLoad];
}
- (void)dealloc {
    NSLog(@"VC释放---:%@",[self class]);
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //防止自动下移64
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.extendedLayoutIncludesOpaqueBars = YES;
    // 防止返回手势失效
    self.navigationController.interactivePopGestureRecognizer.delegate = (id<UIGestureRecognizerDelegate>)self;
    self.view.backgroundColor = [UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:1];
    
}

#pragma make --- 系统配置 ---
- (void)setBarStyle:(UIStatusBarStyle)barStyle {
    _barStyle = barStyle;
    [self setNeedsStatusBarAppearanceUpdate];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return self.barStyle;
}

@end

