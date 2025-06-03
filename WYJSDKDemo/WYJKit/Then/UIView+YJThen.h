/*
 Created by 祎 on 2021
 Copyright © 2021年 祎. All rights reserved.
 */

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YJViewMaker : NSObject

@property (nonatomic, weak) UIView *view;

/// 设置背景颜色
/// @param color 背景颜色
/// @return 返回 YJViewMaker 实例以支持链式调用
@property (nonatomic, strong, readonly) YJViewMaker *(^backgroundColor)(UIColor *color);

/// 设置视图的框架
/// @param frame 视图的框架
/// @return 返回 YJViewMaker 实例以支持链式调用
@property (nonatomic, strong, readonly) YJViewMaker *(^frame)(CGRect frame);

/// 设置视图的圆角半径
/// @param radius 圆角半径
/// @return 返回 YJViewMaker 实例以支持链式调用
@property (nonatomic, strong, readonly) YJViewMaker *(^cornerRadius)(CGFloat radius);

/// 设置视图的边框宽度
/// @param width 边框宽度
/// @return 返回 YJViewMaker 实例以支持链式调用
@property (nonatomic, strong, readonly) YJViewMaker *(^borderWidth)(CGFloat width);

/// 设置视图的边框颜色
/// @param color 边框颜色
/// @return 返回 YJViewMaker 实例以支持链式调用
@property (nonatomic, strong, readonly) YJViewMaker *(^borderColor)(UIColor *color);

/// 设置视图的裁剪模式
/// @param clipsToBounds 是否启用裁剪
/// @return 返回 YJViewMaker 实例以支持链式调用
@property (nonatomic, strong, readonly) YJViewMaker *(^clipsToBounds)(BOOL clipsToBounds);
/// 设置视图的裁剪模式
/// @param masksToBounds 是否启用裁剪
/// @return 返回 YJViewMaker 实例以支持链式调用
@property (nonatomic, strong, readonly) YJViewMaker *(^masksToBounds)(BOOL masksToBounds);

/// 设置视图的透明度
/// @param alpha 透明度值
/// @return 返回 YJViewMaker 实例以支持链式调用
@property (nonatomic, strong, readonly) YJViewMaker *(^alpha)(CGFloat alpha);

/// 设置视图的阴影颜色
/// @param color 阴影颜色
/// @return 返回 YJViewMaker 实例以支持链式调用
@property (nonatomic, strong, readonly) YJViewMaker *(^shadowColor)(UIColor *color);

/// 设置视图的阴影偏移
/// @param offset 阴影偏移
/// @return 返回 YJViewMaker 实例以支持链式调用
@property (nonatomic, strong, readonly) YJViewMaker *(^shadowOffset)(CGSize offset);

/// 设置视图的阴影模糊半径
/// @param radius 阴影模糊半径
/// @return 返回 YJViewMaker 实例以支持链式调用
@property (nonatomic, strong, readonly) YJViewMaker *(^shadowRadius)(CGFloat radius);

/// 设置视图的变换
/// @param transform 变换
/// @return 返回 YJViewMaker 实例以支持链式调用
@property (nonatomic, strong, readonly) YJViewMaker *(^transform)(CGAffineTransform transform);

/// 设置视图的隐藏状态
/// @param hidden 是否隐藏
/// @return 返回 YJViewMaker 实例以支持链式调用
@property (nonatomic, strong, readonly) YJViewMaker *(^hidden)(BOOL hidden);

/// 设置视图的弹性效果
/// @param enabled 是否启用弹性效果
/// @return 返回 YJViewMaker 实例以支持链式调用
@property (nonatomic, strong, readonly) YJViewMaker *(^userInteractionEnabled)(BOOL enabled);

- (instancetype)initWithView:(UIView *)view;


- (void)setupBlocks;
@end

@interface UIView (YJThen)

/// 配置视图的属性
/// @param block 配置 block，提供链式调用接口
- (void)yi_configureWithMake:(void (^)(YJViewMaker *make))block;
/// 配置视图的属性
/// @param block 配置 block，提供链式调用接口
+ (UIView *)yi_configureWithMake:(void (^)(YJViewMaker *make))block;
@end

NS_ASSUME_NONNULL_END
