/*
  Created by King on 2021
  Copyright © 2021年 King. All rights reserved.
*/

#import <UIKit/UIKit.h>

// 颜色
#ifndef WRGBCOLOR
#define WRGBCOLOR(r,g,b)                     [UIColor colorWithRed:r / 255.0 green:g / 255.0  blue:b / 255.0 alpha:1]
#endif
//16进制
#ifndef WRGBACOLOR
#define WRGBACOLOR(r,g,b,a)                  [UIColor colorWithRed:r / 255.0 green:g / 255.0  blue:b / 255.0 alpha:a]
#endif
#ifndef WHexColor
#define WHexColor(_hex_)                     [UIColor yi_hexStr:((__bridge NSString *)CFSTR(#_hex_))]
#endif
#ifndef WHSVCOLOR
#define WHSVCOLOR(h,s,v)                     [UIColor colorWithHue:h saturation:s value:v alpha:1]
#endif
#ifndef WHSVACOLOR
#define WHSVACOLOR(h,s,v,a)                  [UIColor colorWithHue:h saturation:s value:v alpha:a]
#endif
//设置随机颜色
#ifndef WRandomColor
#define WRandomColor                         [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0]
#endif


NS_ASSUME_NONNULL_BEGIN
@interface UIColor (WYJAdd)

+ (UIColor *)yi_hexStr:(NSString *)hexStr alpha:(CGFloat)a;

+ (UIColor *)yi_hexStr:(NSString *)hexStr;

+ (UIColor *)yi_randomColor;
///判断颜色深浅
- (BOOL)yi_isDarkColor;

/**
 *  @brief  渐变颜色(横向渐变, 纵向渐变,length为渐变长度)
 *
 *  @param color     开始颜色
 *  @param toColor     结束颜色
 *  @param isHorizontal 是否是水平
 *  @param length  渐变长度
 *
 *  @return 渐变颜色
 */
+ (nullable UIColor*)yi_gradientFromColor:(UIColor*)color toColor:(UIColor*)toColor isHorizontal:(BOOL)isHorizontal Length:(int)length;
@end
NS_ASSUME_NONNULL_END



