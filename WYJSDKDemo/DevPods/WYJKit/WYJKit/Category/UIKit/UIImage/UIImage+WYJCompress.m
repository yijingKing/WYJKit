//
//  UIImage+WYJCompress.m
//  Created by 祎 on 2021
//

#import "UIImage+WYJCompress.h"

@implementation UIImage (WYJCompress)
+ (UIImage*)yi_resizableImage:(NSString *)name {
    UIImage *normal = [UIImage imageNamed:name];
    
    CGFloat imageW = normal.size.width * 0.5;
    CGFloat imageH = normal.size.height * 0.5;
    return [normal resizableImageWithCapInsets:UIEdgeInsetsMake(imageH, imageW, imageH, imageW)];
}


+ (NSData *)yi_compressImage:(UIImage *)image toMaxLength:(NSInteger)maxLength maxWidth:(NSInteger)maxWidth {
    NSAssert(maxLength > 0, @"图片的大小必须大于 0");
    NSAssert(maxWidth > 0, @"图片的最大边长必须大于 0");
    
    CGSize newSize = [self yi_scaleImage:image withLength:maxWidth];
    UIImage *newImage = [self yi_resizeImage:image withNewSize:newSize];
    
    CGFloat compress = 0.9f;
    NSData *data = UIImageJPEGRepresentation(newImage, compress);
    
    while (data.length > maxLength && compress > 0.01) {
        compress -= 0.02f;
        
        data = UIImageJPEGRepresentation(newImage, compress);
    }
    return data;
}

+ (UIImage *)yi_resizeImage:(UIImage *) image withNewSize:(CGSize) newSize {
    UIGraphicsBeginImageContext(newSize);
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

+ (CGSize)yi_scaleImage:(UIImage *) image withLength:(CGFloat) imageLength{
    CGFloat newWidth = 0.0f;
    CGFloat newHeight = 0.0f;
    CGFloat width = image.size.width;
    CGFloat height = image.size.height;
    if (width > imageLength || height > imageLength){
        if (width > height) {
            newWidth = imageLength;
            newHeight = newWidth * height / width;
        }else if(height > width){
            newHeight = imageLength;
            newWidth = newHeight * width / height;
        }else{
            newWidth = imageLength;
            newHeight = imageLength;
        }
    }else{
        return CGSizeMake(width, height);
    }
    return CGSizeMake(newWidth, newHeight);
}
- (nullable NSData *)yi_forceCompressToMaxLength:(NSUInteger)maxLength {
    UIImage * image = self;
    if (!image) return nil;
    
    CGFloat compression = 1.0;
    NSData *data = UIImageJPEGRepresentation(image, compression);
    if (data.length <= maxLength) return data;
    
    // 第一步：先尝试压缩质量
    compression = 0.9;
    while (data.length > maxLength && compression > 0.1) {
        compression -= 0.1;
        data = UIImageJPEGRepresentation(image, compression);
    }
    if (data.length <= maxLength) return data;
    
    // 第二步：压缩尺寸 + 再次压缩质量
    CGSize originalSize = image.size;
    CGSize targetSize = originalSize;
    NSUInteger tryCount = 0;
    
    while (data.length > maxLength && tryCount < 10) {
        tryCount++;
        
        CGFloat scaleRatio = sqrt((CGFloat)maxLength / data.length);
        targetSize = CGSizeMake(targetSize.width * scaleRatio, targetSize.height * scaleRatio);
        
        UIGraphicsBeginImageContextWithOptions(targetSize, YES, 1.0);
        [image drawInRect:CGRectMake(0, 0, targetSize.width, targetSize.height)];
        UIImage *resizedImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        // 重设压缩质量
        compression = 0.9;
        data = UIImageJPEGRepresentation(resizedImage, compression);
        
        while (data.length > maxLength && compression > 0.1) {
            compression -= 0.1;
            data = UIImageJPEGRepresentation(resizedImage, compression);
        }
        
        if (data.length <= maxLength) {
            return data;
        }
    }
    return (data.length <= maxLength) ? data : nil;
}
@end
