/*
  Created by 祎 on 2021
  Copyright © 2021年 祎. All rights reserved.
*/

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITabBarController (WYJAdd)
//修改tabbar顶部分割线颜色
-(void)shadowLineColor:(UIColor *)lineColor;
//封装添加子控制器的方法
- (void)addChildVc:(UIViewController *)childVc title:(NSString *)title image:(UIImage *)image selectedImage:(UIImage *)selectedImage;

- (void)addChildVc:(UIViewController *)childVc title:(NSString *)title image:(UIImage *)image selectedImage:(UIImage *)selectedImage isNav:(BOOL)isNav;
@end

NS_ASSUME_NONNULL_END
