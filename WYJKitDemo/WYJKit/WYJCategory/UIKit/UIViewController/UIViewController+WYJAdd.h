/*
  Created by 祎 on 2021
  Copyright © 2021年 祎. All rights reserved.
*/

#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN
@interface UIViewController (WYJAdd)

#pragma make ------ 设置导航栏标题 ------
- (void)setNavTitle:(NSString *)title;
- (void)setNavTitle:(NSString *)title color:(UIColor *)color;
- (void)setNavTitle:(NSString *)title color:(UIColor *)color font:(UIFont *)font;
- (void)setNavTitleView:(UIView *)titleView;
/**
 *  导航栏 按钮，
 color为空时，表示默认颜色
 */
#pragma make ------ 导航 返回 ------
// 返回  图片为空时,为文字"<"
- (void)setBackItem:(UIImage *)image;
- (void)setBackItem:(UIImage *)image closeItem:(UIImage *)closeImage;
- (void)showNavTitle:(NSString *)title backItem:(BOOL)show;

#pragma make ------ 导航 按钮 ------
/** 导航按钮 图片 */
- (UIBarButtonItem *)navItemWithImage:(UIImage *)image action:(SEL)action;

/** 导航按钮 文字 */
- (UIBarButtonItem *)navItemWithTitle:(NSString *)title action:(SEL)action;
- (UIBarButtonItem *)navItemWithTitle:(NSString *)title color:(UIColor *)color action:(SEL)action;

/** 导航按钮 图文 */
- (UIBarButtonItem *)navItemWithImage:(UIImage *)image title:(NSString *)title action:(SEL)action;
- (UIBarButtonItem *)navItemWithImage:(nullable UIImage *)image title:(nullable NSString *)title color:(nullable UIColor *)color action:(SEL)action;
- (UIBarButtonItem *)navItemWithImage:(nullable UIImage *)image title:(nullable NSString *)title color:(nullable UIColor *)color target:(id)target action:(SEL)action;

#pragma make ------ 导航 左按钮 ------
/** 导航 左按钮 图片 */
- (void)setNavLeftItemWithImage:(UIImage *)image action:(SEL)action;
- (void)setNavLeftItemWithImage:(UIImage *)image actionBlock:(void(^)(void))block;

/** 导航 左按钮 文字 */
- (void)setNavLeftItemWithTitle:(NSString *)title action:(SEL)action;
- (void)setNavLeftItemWithTitle:(NSString *)title color:(UIColor *)color action:(SEL)action;
- (void)setNavLeftItemWithTitle:(NSString *)title actionBlock:(void(^)(void))block;
- (void)setNavLeftItemWithTitle:(NSString *)title color:(UIColor *)color actionBlock:(void(^)(void))block;

/** 导航 左按钮 图文 */
- (void)setNavLeftItemWithImage:(UIImage *)image title:(NSString *)title action:(SEL)action;
- (void)setNavLeftItemWithImage:(nullable UIImage *)image title:(nullable NSString *)title color:(nullable UIColor *)color action:(SEL)action;
- (void)setNavLeftItemWithImage:(UIImage *)image title:(NSString *)title actionBlock:(void(^)(void))block;
- (void)setNavLeftItemWithImage:(nullable UIImage *)image title:(nullable NSString *)title color:(nullable UIColor *)color actionBlock:(void(^)(void))block;

#pragma make ------ 导航 右按钮 ------
/** 导航 右按钮 图片 */
- (void)setNavRightItemWithImage:(UIImage *)image action:(SEL)action;
- (void)setNavRightItemWithImage:(UIImage *)image actionBlock:(void(^)(void))block;

/** 导航 右按钮 文字 */
- (void)setNavRightItemWithTitle:(NSString *)title action:(SEL)action;
- (void)setNavRightItemWithTitle:(NSString *)title color:(UIColor *)color action:(SEL)action;
- (void)setNavRightItemWithTitle:(NSString *)title actionBlock:(void(^)(void))block;
- (void)setNavRightItemWithTitle:(NSString *)title color:(UIColor *)color actionBlock:(void(^)(void))block;

/** 导航 右按钮 图文 */
- (void)setNavRightItemWithImage:(UIImage *)image title:(NSString *)title action:(SEL)action;
- (void)setNavRightItemWithImage:(nullable UIImage *)image title:(nullable NSString *)title color:(nullable UIColor *)color action:(SEL)action;
- (void)setNavRightItemWithImage:(UIImage *)image title:(NSString *)title actionBlock:(void(^)(void))block;
- (void)setNavRightItemWithImage:(nullable UIImage *)image title:(nullable NSString *)title color:(nullable UIColor *)color actionBlock:(void(^)(void))block;

#pragma make ------ 导航 多按钮 ------
/** 文本*/
- (void)setNavLeftItemsWithTitles:(NSArray<NSString *> *)titles action:(SEL)action;
- (void)setNavLeftItemsWithTitles:(NSArray<NSString *> *)titles actionBlock:(void(^)(NSInteger tag))block;
- (void)setNavLeftItemsWithTitles:(NSArray <NSString *> *)titles colors:(NSArray<UIColor *> *)colors actionBlock:(void(^)(NSInteger tag))block;
///图片
- (void)setNavLeftItemsWithImages:(NSArray<UIImage *> *)images action:(SEL)action;
///图片
- (void)setNavLeftItemsWithImages:(NSArray<UIImage *> *)images actionBlock:(void(^)(NSInteger tag))block;

///通用
- (void)setNavLeftItemsWithImages:(nullable NSArray <UIImage *> *)images titles:(nullable NSArray *)titles color:(nullable NSArray *)colors action:(SEL)action;
- (void)setNavLeftItemsWithImages:(nullable NSArray <UIImage *> *)images titles:(nullable NSArray *)titles color:(nullable NSArray *)colors actionBlock:(void(^)(NSInteger tag))block;

/** 文本*/
- (void)setNavRightItemsWithTitles:(NSArray<NSString *> *)titles action:(SEL)action;
- (void)setNavRightItemsWithTitles:(NSArray<NSString *> *)titles actionBlock:(void(^)(NSInteger tag))block;
- (void)setNavRightItemsWithTitles:(nullable NSArray <NSString *> *)titles colors:(nullable NSArray<UIColor *> *)colors actionBlock:(void(^)(NSInteger tag))block;

///图片
- (void)setNavRightItemsWithImages:(NSArray<UIImage *> *)images action:(SEL)action;
///图片
- (void)setNavRightItemsWithImages:(NSArray<UIImage *> *)images actionBlock:(void(^)(NSInteger tag))block;

///通用
- (void)setNavRightItemsWithImages:(nullable NSArray <UIImage *> *)images titles:(nullable NSArray *)titles color:(nullable NSArray *)colors action:(SEL)action;
- (void)setNavRightItemsWithImages:(nullable NSArray <UIImage *> *)images titles:(nullable NSArray *)titles color:(nullable NSArray *)colors actionBlock:(void(^)(NSInteger tag))block;

/**
 *  返回上一个界面
 */
- (void)goBack;
- (void)goBack:(BOOL)animated;
/**
 *  返回主界面
 */
- (void)dismissOrPopToRootControlelr;
- (void)dismissOrPopToRootController:(BOOL)animated;

/**
 *  获取根目录
 */
- (instancetype)topPresentedVC;
- (instancetype)topPresentedVCWihtKeys:(NSArray<NSString *> *)keys;
+ (instancetype)rootTopPresentedVC;

/**
 *  控制器数组中 仅存在一个实例
 */
- (NSArray<UIViewController *> *)optimizeVcs:(NSArray<UIViewController *> *)vcs;
- (NSArray<UIViewController *> *)optimizeVcs:(NSArray<UIViewController *> *)vcs maxCount:(NSUInteger)count;

/** push */
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated;
-(void)pushViewController:(UIViewController *)viewController;
// 跳转并销毁
- (void)pushViewController:(UIViewController *)vc destructionCount:(NSInteger)count;
/// 跳转到指定控制器并移除所有控制器，仅保留根控制器
- (void)pushToViewControllerAndRemoveAllExceptRoot:(UIViewController *)viewController;
@end

NS_ASSUME_NONNULL_END
