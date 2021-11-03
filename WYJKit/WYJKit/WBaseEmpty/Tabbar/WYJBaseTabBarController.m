/*******************************************************************************
 Copyright (K), 2019 - ~, ╰莪呮想好好宠Nǐつ
 
 Author:        ╰莪呮想好好宠Nǐつ (Wang Yijing)
 E-mail:        1091676312@qq.com
 GitHub:        https://github.com/MemoryKing
 ********************************************************************************/

#import "WYJBaseTabBarController.h"
#import "WYJNavigationController.h"
#import "ViewController.h"
@interface WYJBaseTabBarController ()

@end

@implementation WYJBaseTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addChildVc:ViewController.alloc.init title:@"123" image:@"" selectedImage:@""];
    [self addChildVc:ViewController.alloc.init title:@"456" image:@"" selectedImage:@""];
    [self addChildVc:ViewController.alloc.init title:@"789" image:@"" selectedImage:@""];
}

//封装添加子控制器的方法
- (void)addChildVc:(UIViewController *)childVc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage{
    //设置标题
    childVc.tabBarItem.title = title;
    childVc.tabBarItem.badgeColor = UIColor.redColor;
    childVc.tabBarItem.image = [[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    //需要设置照片的模式，用照片原图，默认是蓝色的
    childVc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    WYJNavigationController *homeNav = [[WYJNavigationController alloc] initWithRootViewController:childVc];
    //不要忘记添加到父控制器上
    [self addChildViewController:homeNav];
}
@end
