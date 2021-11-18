/*******************************************************************************
 Copyright (K), 2019 - ~, Eugene King
 
 Author:        Eugene King (Wang Yijing)
 E-mail:        1091676312@qq.com
 History:
 ********************************************************************************/

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (WYJInit)
/// 构建->文本-颜色-字体
/// @param text 文本
/// @param color 颜色
/// @param font 字体
+ (UILabel *)yi_createWithText:(NSString *)text color:(nullable UIColor *)color font:(nullable UIFont *)font;
/// 构建->位置-文本-颜色-字体
/// @param frame 位置
/// @param text 文本
/// @param color 颜色
/// @param font 字体
+ (UILabel *)yi_createWithFrame:(CGRect)frame text:(NSString *)text color:(nullable UIColor *)color font:(nullable UIFont *)font;
/// 构建->位置-文本-颜色-字体-是否自适应
/// @param frame 位置
/// @param text 文本
/// @param color 颜色
/// @param font 字体
/// @param isAdjust 是否自适应
+ (UILabel *)yi_createWithFrame:(CGRect)frame text:(NSString *)text color:(nullable UIColor *)color font:(nullable UIFont *)font adjustText:(BOOL)isAdjust;
@end

NS_ASSUME_NONNULL_END
