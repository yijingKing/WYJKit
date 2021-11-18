/*
  Created by 祎 on 2021
  Copyright © 2021年 祎. All rights reserved.
  GitHub: https://github.com/MemoryKing
*/


#import <UIKit/UIKit.h>

typedef enum  {
    WYJGradientTypeTopToBottom ,       //从上到小
    WYJGradientTypeLeftToRight ,       //从左到右
    WYJGradientTypeUpLeftToBottomRight ,   //左上到右下
    WYJGradientTypeUpRightToBottomLeft    //右上到左下
} WYJGradientType;

NS_ASSUME_NONNULL_BEGIN
@interface UIImage (WYJAdd)
/** image conversion base64 */
@property (nonatomic, copy, readonly,nullable)NSString * yi_base64String;

/**
 渐变色
 @param size size
 @param colors color array
 @param gradientType direction
 @return image
 */
+ (nullable UIImage *)yi_imageFromSize:(CGSize)size Colors:(NSArray*)colors byGradientType:(WYJGradientType)gradientType;


/**
 用给定的角大小圆角一个新图像。
 
 @param radius       圆角半径
 
 @param corners      圆角位置
 
 @param borderWidth  边框线的宽度
 
 @param borderColor  边框线的颜色
 
 @param borderLineJoin 边界线
 */
- (nullable UIImage *)yi_imageByRoundCornerRadius:(CGFloat)radius
                                       corners:(UIRectCorner)corners
                                   borderWidth:(CGFloat)borderWidth
                                   borderColor:(nullable UIColor *)borderColor
                                borderLineJoin:(CGLineJoin)borderLineJoin;

/// 获取图片、区域的主色
/// @param image 图片
/// @param scale 缩放比例
/// @param rect 位置
+ (nullable NSDictionary *)yi_mostColor:(UIImage *)image scale:(CGFloat)scale rect:(CGRect)rect;
///裁剪图片
- (nullable UIImage *)yi_cropSquareImageRect:(CGRect)rect;
///图片不自动渲染
+ (nullable UIImage *)imageWithNamed:(nullable NSString *)name;
@end


NS_ASSUME_NONNULL_END
