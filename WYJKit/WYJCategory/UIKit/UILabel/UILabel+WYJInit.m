/*******************************************************************************
 Copyright (K), 2019 - ~, Eugene King
 
 Author:        Eugene King (Wang Yijing)
 E-mail:        1091676312@qq.com
 History:
 ********************************************************************************/

#import "UILabel+WYJInit.h"

@implementation UILabel (WYJInit)
/// 构建->文本-颜色-字体
/// @param text 文本
/// @param color 颜色
/// @param font 字体
+ (UILabel *)yi_createWithText:(NSString *)text color:(nullable UIColor *)color font:(nullable UIFont *)font {
    return [self yi_createWithFrame:CGRectZero text:text color:color font:font adjustText:NO];
}
/// 构建->位置-文本-颜色-字体
/// @param frame 位置
/// @param text 文本
/// @param color 颜色
/// @param font 字体
+ (UILabel *)yi_createWithFrame:(CGRect)frame text:(NSString *)text color:(nullable UIColor *)color font:(nullable UIFont *)font {
    return [self yi_createWithFrame:frame text:text color:color font:font adjustText:NO];
}
/// 构建->位置-文本-颜色-字体-是否自适应
/// @param frame 位置
/// @param text 文本
/// @param color 颜色
/// @param font 字体
/// @param isAdjust 是否自适应
+ (UILabel *)yi_createWithFrame:(CGRect)frame text:(NSString *)text color:(nullable UIColor *)color font:(nullable UIFont *)font adjustText:(BOOL)isAdjust{
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    if (text) {
        label.text = text;
    }
    if (color) {
        label.textColor = color;
    }
    if (font) {
        label.font = font;
    }
    if (isAdjust) {
        label.adjustsFontSizeToFitWidth = YES;
    }
    return label;
}


@end
