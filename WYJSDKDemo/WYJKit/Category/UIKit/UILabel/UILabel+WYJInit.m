/*
  Created by 祎 on 2021
  Copyright © 2021年 祎. All rights reserved.
*/

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


- (void)yi_setGradientTextColor:(NSString *)hexColorString {
    [self sizeToFit];
    [self setNeedsLayout];
    [self layoutIfNeeded];
    if (hexColorString.length == 0 || hexColorString == nil) {
        self.textColor = UIColor.whiteColor;
        return;
    }
    
    NSArray *colorsArray = [hexColorString componentsSeparatedByString:@","];
    if (colorsArray.count == 1) {
        UIColor *color = [self colorWithHexString:hexColorString];
        self.textColor = color;
        return;
    }
    
    NSMutableArray *cgColors = [NSMutableArray array];
    for (NSString *hex in colorsArray) {
        UIColor *color = [self colorWithHexString:hex];
        [cgColors addObject:(id)color.CGColor];
    }
    
    CGSize titleSize = self.bounds.size;
    if (titleSize.height == 0) {
        titleSize = [self intrinsicContentSize];
    }
    
    if (titleSize.width == 0 || titleSize.height == 0) {
        return;
    }
    
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.colors = cgColors;
    gradientLayer.startPoint = CGPointMake(0, 0.5);
    gradientLayer.endPoint = CGPointMake(1, 0.5);
    gradientLayer.frame = CGRectMake(0, 0, titleSize.width, titleSize.height);
    
    UIGraphicsImageRenderer *renderer = [[UIGraphicsImageRenderer alloc] initWithSize:titleSize];
    UIImage *gradientImage = [renderer imageWithActions:^(UIGraphicsImageRendererContext * _Nonnull rendererContext) {
        [gradientLayer renderInContext:rendererContext.CGContext];
    }];
    
    [self setTextColor:[UIColor colorWithPatternImage:gradientImage]];
}

// 颜色转换方法
- (UIColor *)colorWithHexString:(NSString *)hexString {
    unsigned rgbValue = 0;
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    [scanner setScanLocation:1];
    [scanner scanHexInt:&rgbValue];
    return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16) / 255.0
                           green:((rgbValue & 0x00FF00) >> 8) / 255.0
                            blue:(rgbValue & 0x0000FF) / 255.0
                           alpha:1.0];
}

@end
