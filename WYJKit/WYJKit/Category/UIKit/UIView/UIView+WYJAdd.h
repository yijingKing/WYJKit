/*
  Created by 祎 on 2021
  Copyright © 2021年 祎. All rights reserved.
*/


#import <UIKit/UIKit.h>
#import "UIImage+WYJAdd.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIView (WYJAdd)



/**
 Returns the view's view controller (may be nil).
 */
@property (nullable, nonatomic, readonly) UIViewController *yi_viewController;
/** 设置部分圆角*/
- (void)yi_roundedCorner:(UIRectCorner)rectCon radii:(CGFloat)radii;
/** 设置部分圆角*/
- (void)yi_roundedCorner:(UIRectCorner)rectCon cornerRadii:(CGSize)size;
/** 设置部分圆角*/
- (void)yi_roundedCornerWithFrame:(CGRect)frame rectCorner:(UIRectCorner)rectCon radii:(CGFloat)radii;
/** 设置阴影 */
- (void)yi_shadowsColor:(UIColor *)color offset:(CGSize)size radius:(CGFloat)radius opacity:(CGFloat)opacity;

/**
 渐变色
 
 @param size size
 @param colors color array
 @param gradientType direction
 @return image
 */
- (nullable UIView *)yi_imageFromSize:(CGSize)size Colors:(NSArray*)colors byGradientType:(WYJGradientType)gradientType;

/**
 Remove all subviews.

 @warning Never call this method inside your view's drawRect: method.
 */
- (void)yi_removeAllSubviews;

/// 添加边框
/// @param side 位置
/// @param color 颜色
/// @param lineWidth 宽
- (void)yi_addBorderToSide:(UIRectEdge)side color:(UIColor *)color lineWidth:(CGFloat)lineWidth;
/// 添加渐变边框
- (void)yi_addGradientBorderToSide:(UIRectEdge)side colors:(NSArray<UIColor *> *)colors locations:(NSArray<NSNumber *>*)locations lineWidth:(CGFloat)lineWidth;
/// 添加边框
/// @param side 位置
/// @param color 颜色
/// @param lineWidth 宽
- (void)yi_addBorderToWithFrame:(CGRect)frane side:(UIRectEdge)side color:(UIColor *)color lineWidth:(CGFloat)lineWidth;
// 增加模糊效果的方法
- (void)yi_addMorseEffectWithAlpha:(CGFloat)alpha;
@end
NS_ASSUME_NONNULL_END

