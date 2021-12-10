/*
  Created by King on 2021
  Copyright © 2021年 King. All rights reserved.
*/
#import "UIImage+WYJInit.h"

@implementation UIImage (WYJInit)
#pragma make ------ 颜色生成图片 ------
/// 颜色生成图片
+ (nullable UIImage *)yi_imageWithColor:(UIColor *)color {
    return [self yi_imageWithColor:color size:CGSizeMake(1, 1)];
}

+ (nullable UIImage *)yi_imageWithColor:(UIColor *)color size:(CGSize)size {
    if (!color || size.width <= 0 || size.height <= 0) return nil;
    CGRect rect = CGRectMake(0.0f, 0.0f, size.width, size.height);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}
@end
