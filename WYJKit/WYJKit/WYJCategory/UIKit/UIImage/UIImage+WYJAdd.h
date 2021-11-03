/*******************************************************************************
 Copyright (K), 2019 - ~, ╰莪呮想好好宠Nǐつ 
 
 Author:        ╰莪呮想好好宠Nǐつ (Wang Yijing)
 E-mail:        1091676312@qq.com
 GitHub:        https://github.com/MemoryKing
 ********************************************************************************/


#import <UIKit/UIKit.h>

typedef enum  {
    GradientTypeTopToBottom ,       //从上到小
    GradientTypeLeftToRight ,       //从左到右
    GradientTypeUpLeftToBottomRight ,   //左上到右下
    GradientTypeUpRightToBottomLeft    //右上到左下
} GradientType;

NS_ASSUME_NONNULL_BEGIN
@interface UIImage (WYJAdd)
/** image conversion base64 */
@property (nonatomic, copy, readonly,nullable)NSString * base64String;

/**
 渐变色
 @param size size
 @param colors color array
 @param gradientType direction
 @return image
 */
+ (nullable UIImage *)imageFromSize:(CGSize)size Colors:(NSArray*)colors byGradientType:(GradientType)gradientType;


/**
 用给定的角大小圆角一个新图像。
 
 @param radius       圆角半径
 
 @param corners      圆角位置
 
 @param borderWidth  边框线的宽度
 
 @param borderColor  边框线的颜色
 
 @param borderLineJoin 边界线
 */
- (nullable UIImage *)imageByRoundCornerRadius:(CGFloat)radius
                                       corners:(UIRectCorner)corners
                                   borderWidth:(CGFloat)borderWidth
                                   borderColor:(nullable UIColor *)borderColor
                                borderLineJoin:(CGLineJoin)borderLineJoin;

/// 获取图片、区域的主色
/// @param image 图片
/// @param scale 缩放比例
/// @param rect 位置
+ (nullable NSDictionary *)mostColor:(UIImage *)image scale:(CGFloat)scale rect:(CGRect)rect;
///裁剪图片
- (nullable UIImage *)cropSquareImageRect:(CGRect)rect;
///图片是怎样就怎样 不会自动渲染
+ (nullable UIImage *)imageWithNamed:(nullable NSString *)name;
@end


NS_ASSUME_NONNULL_END
