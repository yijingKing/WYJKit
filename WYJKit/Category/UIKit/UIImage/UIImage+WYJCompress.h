//
//  UIImage+WYJCompress.h
//  Created by 祎 on 2021
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (WYJCompress)
/**
 *  压缩上传图片到指定字节
 *
 *  @param image     压缩的图片
 *  @param maxLength 压缩后最大字节大小
 *
 *  @return 压缩后图片的二进制
 */
+ (NSData *)yi_compressImage:(UIImage *)image toMaxLength:(NSInteger) maxLength maxWidth:(NSInteger)maxWidth;

/**
 *  获得指定size的图片
 *
 *  @param image   原始图片
 *  @param newSize 指定的size
 *
 *  @return 调整后的图片
 */
+ (UIImage *)yi_resizeImage:(UIImage *) image withNewSize:(CGSize) newSize;

/**
 *  通过指定图片最长边，获得等比例的图片size
 *
 *  @param image       原始图片
 *  @param imageLength 图片允许的最长宽度（高度）
 *
 *  @return 获得等比例的size
 */
+ (CGSize)yi_scaleImage:(UIImage *) image withLength:(CGFloat) imageLength;

///对指定图片进行拉伸
+ (UIImage*)yi_resizableImage:(NSString *)name;

///压缩上传图片到指定字节(压缩质量和尺寸)
- (nullable NSData *)yi_forceCompressToMaxLength:(NSUInteger)maxLength;
@end

NS_ASSUME_NONNULL_END
