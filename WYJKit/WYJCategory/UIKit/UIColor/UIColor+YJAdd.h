/*******************************************************************************
 Copyright (K), 2019 - ~, ╰莪呮想好好宠Nǐつ 
 
 Author:        ╰莪呮想好好宠Nǐつ (Wang Yijing)
 E-mail:        1091676312@qq.com
 GitHub:        https://github.com/MemoryKing
 ********************************************************************************/

#import <UIKit/UIKit.h>

// 颜色
#define WRGBCOLOR(r,g,b)                     [UIColor colorWithRed:r / 255.0 green:g / 255.0  blue:b / 255.0 alpha:1]
//16进制
#define WRGBACOLOR(r,g,b,a)                  [UIColor colorWithRed:r / 255.0 green:g / 255.0  blue:b / 255.0 alpha:a]

#ifndef WHexColor
#define WHexColor(_hex_)   [UIColor hexStr:((__bridge NSString *)CFSTR(#_hex_))]
#endif

#define WHSVCOLOR(h,s,v)                     [UIColor colorWithHue:h saturation:s value:v alpha:1]
#define WHSVACOLOR(h,s,v,a)                  [UIColor colorWithHue:h saturation:s value:v alpha:a]
//设置随机颜色
#define WRandomColor [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0]

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (YJAdd)

+ (UIColor *)hexStr:(NSString *)hexStr alpha:(CGFloat)a;

+ (UIColor *)hexStr:(NSString *)hexStr;

+ (UIColor *)randomColor;

@end

NS_ASSUME_NONNULL_END


