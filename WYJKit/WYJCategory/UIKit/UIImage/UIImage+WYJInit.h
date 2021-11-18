/*
  Created by 祎 on 2021
  Copyright © 2021年 祎. All rights reserved.
  GitHub: https://github.com/MemoryKing
*/
#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN
@interface UIImage (WYJInit)

#pragma make ------ 颜色生成图片 ------
/// 颜色生成图片
+ (nullable UIImage *)yi_imageWithColor:(UIColor *)color;
+ (nullable UIImage *)yi_imageWithColor:(UIColor *)color size:(CGSize)size;
@end
NS_ASSUME_NONNULL_END

