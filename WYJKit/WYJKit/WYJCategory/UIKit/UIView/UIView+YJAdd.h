/*******************************************************************************
 Copyright (K), 2019 - ~, ╰莪呮想好好宠Nǐつ 
 
 Author:        ╰莪呮想好好宠Nǐつ (Wang Yijing)
 E-mail:        1091676312@qq.com
 GitHub:        https://github.com/MemoryKing
 ********************************************************************************/


#import <UIKit/UIKit.h>
#import "UIImage+WYJAdd.h"



@interface UIView (YJAdd)

/** 设置部分圆角*/
- (void)roundeConrners:(UIRectCorner)rectCon cornerRadii:(CGSize)size;
/** 设置阴影 */
- (void)shadowsColor:(UIColor *)color size:(CGSize)size radius:(CGFloat)radius opacity:(CGFloat)opacity;

/**
 渐变色
 
 @param size size
 @param colors color array
 @param gradientType direction
 @return image
 */
- (UIView *)imageFromSize:(CGSize)size Colors:(NSArray*)colors byGradientType:(GradientType)gradientType;

/**
 Remove all subviews.

 @warning Never call this method inside your view's drawRect: method.
 */
- (void)removeAllSubviews;

/**
 Returns the view's view controller (may be nil).
 */
@property (nullable, nonatomic, readonly) UIViewController *viewController;


@end


