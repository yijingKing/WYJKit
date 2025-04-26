/*
  Created by 祎 on 2021
  Copyright © 2021年 祎. All rights reserved.
*/


#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WYJBaseViewController : UIViewController
@property (nonatomic,assign) UIStatusBarStyle barStyle;
@property (nonatomic, strong) UIView * nav_base_view;
@property (nonatomic, strong) UIView * nav_bar_view;
/// 状态栏文字颜色  默认  black
@property (nonatomic, assign) BOOL statusBarTitleWhite;

@property (nonatomic, strong) UIButton * right_base_btn;

/// 导航栏是否隐藏
@property (nonatomic, assign) BOOL nav_hidden;

/// 开启通知刷新页面  默认：NO      回调方法 reloadViewData
@property (nonatomic, assign) BOOL open_noti_reload;
- (void)startNotiReloadData;


/// 设置导航栏标题
@property (nonatomic, copy) NSString * n_title;
@property (nonatomic, copy) UIColor * n_titleColor;
@property (nonatomic, copy) UIColor * n_backgroundColor;
@property (nonatomic, strong) UIScrollView * scrollView;


- (void)setRightBtnTitle:(NSString *)title block:(void(^)(UIButton *btn))block;
- (void)setRightBtnTitle:(NSString *)title color:(UIColor *)color fontSize:(CGFloat)fontSize block:(void(^)(UIButton *btn))block;
- (void)setRightBtnImage:(NSString *)image block:(void(^)(UIButton *btn))block;
- (void)setBackBtnImage:(NSString *)image;
- (void)setBackImage:(UIImage *)image;
/// 页面初始化
- (void)setupUI;
/// 约束
- (void)setupConstraints;
/// 页面初始化
- (void)initChildView;

/// 网络请求
- (void)requestData;

/// 通知回调刷新数据
- (void)reloadViewData;
- (void)onBackAction;

- (void)openHeaderRefresh:(void (^) (void))block;
- (void)openLoadMore:(void (^) (void))block;
- (void)endRefresh:(NSInteger)currentPage maxPage:(NSInteger)maxPage;
- (void)endHeaderRefresh;

- (void)popVC;

- (void)pushVC:(UIViewController *)vc;

- (void)destructionCount:(NSInteger)count pushVC:(UIViewController *)vc;


@end

NS_ASSUME_NONNULL_END

