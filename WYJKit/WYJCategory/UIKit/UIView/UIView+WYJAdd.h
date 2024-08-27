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
- (void)yi_roundeConrners:(UIRectCorner)rectCon cornerRadii:(CGSize)size;
/** 设置阴影 */
- (void)yi_shadowsColor:(UIColor *)color size:(CGSize)size radius:(CGFloat)radius opacity:(CGFloat)opacity;

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

- (void)yi_addBorderToSide:(UIRectEdge)side color:(UIColor *)color thickness:(CGFloat)thickness cornerRadius:(CGFloat)cornerRadius corners:(UIRectCorner)corners;
@end
NS_ASSUME_NONNULL_END

