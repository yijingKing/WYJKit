/*
  Created by 祎 on 2021
  Copyright © 2021年 祎. All rights reserved.
*/

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

/// 文字渐变
/// @param hexColorString eg:#FFFFFF,#FFFFFF 或#FFFFFF
- (void)yi_setGradientTextColor:(NSString *)hexColorString;

@end

NS_ASSUME_NONNULL_END
