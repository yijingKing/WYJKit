/*
  Created by King on 2021
  Copyright © 2021年 King. All rights reserved.
*/


#import <UIKit/UIKit.h>
#import "UIImage+WYJAdd.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIView (WYJAdd)

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

/**
 Returns the view's view controller (may be nil).
 */
@property (nullable, nonatomic, readonly) UIViewController *yi_viewController;


@end
NS_ASSUME_NONNULL_END

