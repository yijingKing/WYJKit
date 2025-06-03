//
//  UIImageView+WYJAddition.h
//
//  Created by 祎 on 2021
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImageView (WYJAddition)

/**
 *  @brief  根据bundle中的图片名创建imageview
 *
 *  @param imageName bundle中的图片名
 *
 *  @return imageview
 */
+ (id)yi_imageViewWithImageNamed:(NSString*)imageName;
/**
 *  @brief  根据frame创建imageview
 *
 *  @param frame imageview frame
 *
 *  @return imageview
 */
+ (id)yi_imageViewWithFrame:(CGRect)frame;

+ (id)yi_imageViewWithStretchableImage:(NSString*)imageName Frame:(CGRect)frame;
/**
 *  @brief  创建imageview动画
 *
 *  @param imageArray 图片名称数组
 *  @param duration   动画时间
 *
 *  @return imageview
 */
+ (id)yi_imageViewWithImageArray:(NSArray*)imageArray duration:(NSTimeInterval)duration;
- (void)yi_setImageWithStretchableImage:(NSString*)imageName;


// 画水印
// 图片水印
- (void)yi_setImage:(UIImage *)image withWaterMark:(UIImage *)mark inRect:(CGRect)rect;
// 文字水印
- (void)yi_setImage:(UIImage *)image withStringWaterMark:(NSString *)markString inRect:(CGRect)rect color:(UIColor *)color font:(UIFont *)font;
- (void)yi_setImage:(UIImage *)image withStringWaterMark:(NSString *)markString atPoint:(CGPoint)point color:(UIColor *)color font:(UIFont *)font;
@end

NS_ASSUME_NONNULL_END
