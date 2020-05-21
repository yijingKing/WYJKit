/*******************************************************************************
 Copyright (K), 2019 - ~, ╰莪呮想好好宠Nǐつ 
 
 Author:        ╰莪呮想好好宠Nǐつ (Wang Yijing)
 E-mail:        1091676312@qq.com
 GitHub:        https://github.com/MemoryKing
 ********************************************************************************/

#import <UIKit/UIKit.h>

@interface UIViewController (YJAdd)
/** title color */
@property (nonatomic, strong) UIColor * yi_titleColor;

/** hidden navigation shadow */
@property (nonatomic, assign) BOOL yi_hiddenShadow;

/** hidden navigation */
@property (nonatomic, assign) BOOL yi_hiddenNavigationBar;

/** navigation background color */
@property (nonatomic, strong) UIColor * yi_navBackgroundColor;

/** background color */
@property (nonatomic, strong) UIColor * yi_backgroundColor;

/** end editing */
@property (nonatomic, assign) BOOL yi_endEditing;


#pragma make ------ 设置导航栏标题 ------
- (void)yi_setNavTitle:(NSString *)title;
- (void)yi_setNavTitle:(NSString *)title color:(UIColor *)color;
- (void)yi_setNavTitleView:(UIView *)titleView;
/**
 *  导航栏 按钮，
 color为空时，表示默认颜色
 */
#pragma make ------ 导航 返回 ------
// 返回  图片为空时,为文字"<"
- (void)yi_setBackItem:(UIImage *)image;
- (void)yi_setBackItem:(UIImage *)image closeItem:(UIImage *)closeImage;
- (void)yi_showNavTitle:(NSString *)title backItem:(BOOL)show;

#pragma make ------ 导航 按钮 ------
/** 导航按钮 图片 */
- (UIBarButtonItem *)yi_navItemWithImage:(UIImage *)image action:(SEL)action;

/** 导航按钮 文字 */
- (UIBarButtonItem *)yi_navItemWithTitle:(NSString *)title action:(SEL)action;
- (UIBarButtonItem *)yi_navItemWithTitle:(NSString *)title color:(UIColor *)color action:(SEL)action;

/** 导航按钮 图文 */
- (UIBarButtonItem *)yi_navItemWithImage:(UIImage *)image title:(NSString *)title action:(SEL)action;
- (UIBarButtonItem *)yi_navItemWithImage:(UIImage *)image title:(NSString *)title color:(UIColor *)color action:(SEL)action;
- (UIBarButtonItem *)yi_navItemWithImage:(UIImage *)image title:(NSString *)title color:(UIColor *)color target:(id)target action:(SEL)action;

#pragma make ------ 导航 左按钮 ------
/** 导航 左按钮 图片 */
- (void)yi_setNavLeftItemWithImage:(UIImage *)image action:(SEL)action;
- (void)yi_setNavLeftItemWithImage:(UIImage *)image actionBlock:(void(^)(void))block;

/** 导航 左按钮 文字 */
- (void)yi_setNavLeftItemWithTitle:(NSString *)title action:(SEL)action;
- (void)yi_setNavLeftItemWithTitle:(NSString *)title color:(UIColor *)color action:(SEL)action;
- (void)yi_setNavLeftItemWithTitle:(NSString *)title actionBlock:(void(^)(void))block;
- (void)yi_setNavLeftItemWithTitle:(NSString *)title color:(UIColor *)color actionBlock:(void(^)(void))block;

/** 导航 左按钮 图文 */
- (void)yi_setNavLeftItemWithImage:(UIImage *)image title:(NSString *)title action:(SEL)action;
- (void)yi_setNavLeftItemWithImage:(UIImage *)image title:(NSString *)title color:(UIColor *)color action:(SEL)action;
- (void)yi_setNavLeftItemWithImage:(UIImage *)image title:(NSString *)title actionBlock:(void(^)(void))block;
- (void)yi_setNavLeftItemWithImage:(UIImage *)image title:(NSString *)title color:(UIColor *)color actionBlock:(void(^)(void))block;

#pragma make ------ 导航 右按钮 ------
/** 导航 右按钮 图片 */
- (void)yi_setNavRightItemWithImage:(UIImage *)image action:(SEL)action;
- (void)yi_setNavRightItemWithImage:(UIImage *)image actionBlock:(void(^)(void))block;

/** 导航 右按钮 文字 */
- (void)yi_setNavRightItemWithTitle:(NSString *)title action:(SEL)action;
- (void)yi_setNavRightItemWithTitle:(NSString *)title color:(UIColor *)color action:(SEL)action;
- (void)yi_setNavRightItemWithTitle:(NSString *)title actionBlock:(void(^)(void))block;
- (void)yi_setNavRightItemWithTitle:(NSString *)title color:(UIColor *)color actionBlock:(void(^)(void))block;

/** 导航 右按钮 图文 */
- (void)yi_setNavRightItemWithImage:(UIImage *)image title:(NSString *)title action:(SEL)action;
- (void)yi_setNavRightItemWithImage:(UIImage *)image title:(NSString *)title color:(UIColor *)color action:(SEL)action;
- (void)yi_setNavRightItemWithImage:(UIImage *)image title:(NSString *)title actionBlock:(void(^)(void))block;
- (void)yi_setNavRightItemWithImage:(UIImage *)image title:(NSString *)title color:(UIColor *)color actionBlock:(void(^)(void))block;

#pragma make ------ 导航 多按钮 ------
/** 文本*/
- (void)yi_setNavLeftItemsWithTitles:(NSArray<NSString *> *)titles action:(SEL)action;
- (void)yi_setNavLeftItemsWithTitles:(NSArray<NSString *> *)titles actionBlock:(void(^)(NSInteger tag))block;
- (void)yi_setNavLeftItemsWithTitles:(NSArray <NSString *> *)titles colors:(NSArray<UIColor *> *)colors actionBlock:(void(^)(NSInteger tag))block;
///图片
- (void)yi_setNavLeftItemsWithImages:(NSArray<UIImage *> *)images action:(SEL)action;
///图片
- (void)yi_setNavLeftItemsWithImages:(NSArray<UIImage *> *)images actionBlock:(void(^)(NSInteger tag))block;

///通用
- (void)yi_setNavLeftItemsWithImages:(NSArray <UIImage *> *)images titles:(NSArray *)titles color:(NSArray *)colors action:(SEL)action;
- (void)yi_setNavLeftItemsWithImages:(NSArray <UIImage *> *)images titles:(NSArray *)titles color:(NSArray *)colors actionBlock:(void(^)(NSInteger tag))block;

/** 文本*/
- (void)yi_setNavRightItemsWithTitles:(NSArray<NSString *> *)titles action:(SEL)action;
- (void)yi_setNavRightItemsWithTitles:(NSArray<NSString *> *)titles actionBlock:(void(^)(NSInteger tag))block;
- (void)yi_setNavRightItemsWithTitles:(NSArray <NSString *> *)titles colors:(NSArray<UIColor *> *)colors actionBlock:(void(^)(NSInteger tag))block;

///图片
- (void)yi_setNavRightItemsWithImages:(NSArray<UIImage *> *)images action:(SEL)action;
///图片
- (void)yi_setNavRightItemsWithImages:(NSArray<UIImage *> *)images actionBlock:(void(^)(NSInteger tag))block;

///通用
- (void)yi_setNavRightItemsWithImages:(NSArray <UIImage *> *)images titles:(NSArray *)titles color:(NSArray *)colors action:(SEL)action;
- (void)yi_setNavRightItemsWithImages:(NSArray <UIImage *> *)images titles:(NSArray *)titles color:(NSArray *)colors actionBlock:(void(^)(NSInteger tag))block;

/**
 *  返回上一个界面
 */
- (void)yi_goBack;
- (void)yi_goBack:(BOOL)animated;
/**
 *  返回主界面
 */
- (void)yi_dismissOrPopToRootControlelr;
- (void)yi_dismissOrPopToRootController:(BOOL)animated;

/**
 *  获取根目录
 */
- (instancetype)yi_topPresentedVC;
- (instancetype)yi_topPresentedVCWihtKeys:(NSArray<NSString *> *)keys;
+ (instancetype)yi_rootTopPresentedVC;

/**
 *  控制器数组中 仅存在一个实例
 */
- (NSArray<UIViewController *> *)optimizeVcs:(NSArray<UIViewController *> *)vcs;
- (NSArray<UIViewController *> *)optimizeVcs:(NSArray<UIViewController *> *)vcs maxCount:(NSUInteger)count;

/** push */
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated;

@end

