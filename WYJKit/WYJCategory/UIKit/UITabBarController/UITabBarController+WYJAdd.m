/*
  Created by King on 2021
  Copyright © 2021年 King. All rights reserved.
*/

#import "UITabBarController+WYJAdd.h"
#import "WYJNavigationController.h"
@implementation UITabBarController (WYJAdd)
//封装添加子控制器的方法
- (void)addChildVc:(UIViewController *)childVc title:(NSString *)title image:(UIImage *)image selectedImage:(UIImage *)selectedImage {
    [self addChildVc:childVc title:title image:image selectedImage:selectedImage isNav:YES];
}
- (void)addChildVc:(UIViewController *)childVc title:(NSString *)title image:(UIImage *)image selectedImage:(UIImage *)selectedImage isNav:(BOOL)isNav {
    self.tabBar.tintColor = UIColor.blackColor;
    [[UITabBar appearance] setBackgroundColor:UIColor.redColor];
    //设置标题
    childVc.tabBarItem.title = title;
    if (@available(iOS 10.0, *)) {
        childVc.tabBarItem.badgeColor = UIColor.redColor;
    }
    childVc.tabBarItem.image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    //需要设置照片的模式，用照片原图，默认是蓝色的
    childVc.tabBarItem.selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    if (isNav) {
        UINavigationController * nav = [UINavigationController.alloc initWithRootViewController:childVc];
        [self addChildViewController:nav];
    } else {
        [self addChildViewController:childVc];
    }
}

//修改tabbar顶部分割线颜色
-(void)shadowLineColor:(UIColor *)lineColor {
    //改变tabbar 线条颜色
    CGRect rect = CGRectMake(0, 0, UIScreen.mainScreen.bounds.size.width, 1);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, lineColor.CGColor);
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    [self.tabBar setShadowImage:img];
    [self.tabBar setBackgroundColor:UIColor.whiteColor];
}

@end
