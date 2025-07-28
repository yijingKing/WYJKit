/*
  Created by 祎 on 2021
  Copyright © 2021年 祎. All rights reserved.
*/


#import "UIColor+WYJAdd.h"
#import <objc/runtime.h>

@implementation UIColor (WYJAdd)

+ (UIColor *)yi_hexStr:(NSString *)hexStr alpha:(CGFloat)a {
    NSString *cString = [[hexStr stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    if ([cString hasPrefix:@"0X"] || [cString hasPrefix:@"0x"]) {
        cString = [cString substringFromIndex:2];
    }
    if ([cString hasPrefix:@"#"]) {
        cString = [cString substringFromIndex:1];
    }
    
    NSUInteger length = cString.length;
    if (length != 6 && length != 8) {
        return [UIColor clearColor];
    }
    
    unsigned int r, g, b;
    float alpha = a;
    
    NSRange range = NSMakeRange(0, 2);
    NSString *rString = [cString substringWithRange:range];
    
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    if (length == 8) {
        range.location = 6;
        NSString *aString = [cString substringWithRange:range];
        
        unsigned int aValue;
        [[NSScanner scannerWithString:aString] scanHexInt:&aValue];
        alpha = aValue / 255.0f;
    }
    
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:(r / 255.0f)
                           green:(g / 255.0f)
                            blue:(b / 255.0f)
                           alpha:alpha];
}

+ (UIColor *)yi_hexStr:(NSString *)hexStr {
    return [UIColor yi_hexStr:hexStr alpha:1.0];
}

+ (UIColor *)yi_randomColor {
    NSInteger aRedValue = arc4random() % 255;
    NSInteger aGreenValue = arc4random() % 255;
    NSInteger aBlueValue = arc4random() % 255;
    return [UIColor colorWithRed:aRedValue / 255.0 green:aGreenValue / 255.0 blue:aBlueValue / 255.0 alpha:1];
}

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
+ (nullable UIColor*)yi_gradientFromColor:(UIColor*)color toColor:(UIColor*)toColor isHorizontal:(BOOL)isHorizontal Length:(int)length
{
    CGSize size = CGSizeZero;
    if (isHorizontal) {
        size = CGSizeMake(length, 1);
    } else {
        size = CGSizeMake(1, length);
    }
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    // 创建Quartz
    CGContextRef context = UIGraphicsGetCurrentContext();
    // 创建色彩空间对象
    CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();
    // 颜色数组
    NSArray* colors = [NSArray arrayWithObjects:(id)color.CGColor, (id)toColor.CGColor, nil];
    // 创建渐变对象
    CGGradientRef gradient = CGGradientCreateWithColors(colorspace, (__bridge CFArrayRef)colors, NULL);
    if (isHorizontal) {
        CGContextDrawLinearGradient(context, gradient, CGPointMake(0, 0), CGPointMake(size.width, 0), 0);
    } else {
        CGContextDrawLinearGradient(context, gradient, CGPointMake(0, 0), CGPointMake(0, size.height), 0);
    }
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorspace);
    UIGraphicsEndImageContext();
    
    return [UIColor colorWithPatternImage:image];
}

//判断颜色深浅
- (BOOL)yi_isDarkColor {
    const CGFloat *componentColors = CGColorGetComponents(self.CGColor);
    CGFloat colorBrightness = ((componentColors[0] * 299) + (componentColors[1] * 587) + (componentColors[2] * 114)) / 1000;
    if (colorBrightness < 0.5){
        //深色
        return YES;
    } else{
        //浅色
        return NO;
    }
}



@end
