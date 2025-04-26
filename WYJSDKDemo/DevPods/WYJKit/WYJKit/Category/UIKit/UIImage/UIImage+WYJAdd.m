/*
  Created by 祎 on 2021
  Copyright © 2021年 祎. All rights reserved.
*/


#import "UIImage+WYJAdd.h"



@implementation UIImage (WYJAdd)

- (nullable NSString *)yi_base64String {
    NSData * imagedata = UIImagePNGRepresentation(self);
    NSString * image64 = [imagedata base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    
    return image64;
}

+ (nullable UIImage *)yi_imageFromSize:(CGSize)size Colors:(NSArray*)colors byGradientType:(WYJGradientType)gradientType {
    NSMutableArray *ar = [NSMutableArray array];
    for(UIColor *c in colors) {
        [ar addObject:(id)c.CGColor];
    }
    UIGraphicsBeginImageContextWithOptions(size, YES, 1);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    CGColorSpaceRef colorSpace = CGColorGetColorSpace([[colors lastObject] CGColor]);
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (CFArrayRef)ar, NULL);
    CGPoint start;
    CGPoint end;
    switch (gradientType) {
        case WYJGradientTypeTopToBottom:
            start = CGPointMake(0.0, 0.0);
            end = CGPointMake(0.0, size.height);
            break;
        case WYJGradientTypeLeftToRight:
            start = CGPointMake(0.0, 0.0);
            end = CGPointMake(size.width, 0.0);
            break;
        case WYJGradientTypeUpLeftToBottomRight:
            start = CGPointMake(0.0, 0.0);
            end = CGPointMake(size.width, size.height);
            break;
        case WYJGradientTypeUpRightToBottomLeft:
            start = CGPointMake(size.width, 0.0);
            end = CGPointMake(0.0, size.height);
            break;
        default:
            break;
    }
    CGContextDrawLinearGradient(context, gradient, start, end, kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    CGGradientRelease(gradient);
    CGContextRestoreGState(context);
    CGColorSpaceRelease(colorSpace);
    UIGraphicsEndImageContext();
    return image;
}


- (nullable UIImage *)yi_imageByRoundCornerRadius:(CGFloat)radius
                              corners:(UIRectCorner)corners
                          borderWidth:(CGFloat)borderWidth
                          borderColor:(UIColor *)borderColor
                       borderLineJoin:(CGLineJoin)borderLineJoin {
    
    if (corners != UIRectCornerAllCorners) {
        UIRectCorner tmp = 0;
        if (corners & UIRectCornerTopLeft) tmp |= UIRectCornerBottomLeft;
        if (corners & UIRectCornerTopRight) tmp |= UIRectCornerBottomRight;
        if (corners & UIRectCornerBottomLeft) tmp |= UIRectCornerTopLeft;
        if (corners & UIRectCornerBottomRight) tmp |= UIRectCornerTopRight;
        corners = tmp;
    }
    
    UIGraphicsBeginImageContextWithOptions(self.size, NO, self.scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
    CGContextScaleCTM(context, 1, -1);
    CGContextTranslateCTM(context, 0, -rect.size.height);
    
    CGFloat minSize = MIN(self.size.width, self.size.height);
    if (borderWidth < minSize / 2) {
        UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectInset(rect, borderWidth, borderWidth) byRoundingCorners:corners cornerRadii:CGSizeMake(radius, borderWidth)];
        [path closePath];
        
        CGContextSaveGState(context);
        [path addClip];
        CGContextDrawImage(context, rect, self.CGImage);
        CGContextRestoreGState(context);
    }
    
    if (borderColor && borderWidth < minSize / 2 && borderWidth > 0) {
        CGFloat strokeInset = (floor(borderWidth * self.scale) + 0.5) / self.scale;
        CGRect strokeRect = CGRectInset(rect, strokeInset, strokeInset);
        CGFloat strokeRadius = radius > self.scale / 2 ? radius - self.scale / 2 : 0;
        UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:strokeRect byRoundingCorners:corners cornerRadii:CGSizeMake(strokeRadius, borderWidth)];
        [path closePath];
        
        path.lineWidth = borderWidth;
        path.lineJoinStyle = borderLineJoin;
        [borderColor setStroke];
        [path stroke];
    }
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}


/// 获取图片、区域的主色
+ (nullable NSDictionary *)yi_mostColor:(UIImage *)image scale:(CGFloat)scale rect:(CGRect)rect {
    
#if __IPHONE_OS_VERSION_MAX_ALLOWED > __IPHONE_6_1
    int bitmapInfo = kCGBitmapByteOrderDefault | kCGImageAlphaPremultipliedLast;
#else
    int bitmapInfo = kCGImageAlphaPremultipliedLast;
#endif
    if (scale <= 0.1) {
        scale = 0.1;
    }else if(scale >= 1){
        scale = 1;
    }
    
    if (rect.size.width > 0 && rect.size.height > 0) {
        image = [image yi_cropSquareImageRect:rect];
    }
    
    //第一步 先把图片缩小 加快计算速度. 但越小结果误差可能越大
    CGSize thumbSize = CGSizeMake([image size].width * scale, [image size].height * scale);
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = CGBitmapContextCreate(NULL,
                                                 thumbSize.width,
                                                 thumbSize.height,
                                                 8,//bits per component
                                                 thumbSize.width*4,
                                                 colorSpace,
                                                 bitmapInfo);
    
    CGRect drawRect = CGRectMake(0, 0, thumbSize.width, thumbSize.height);
    CGContextDrawImage(context, drawRect, image.CGImage);
    CGColorSpaceRelease(colorSpace);
    
    //第二步 取每个点的像素值
    unsigned char* data = CGBitmapContextGetData (context);
    
    if (data == NULL){
        CGContextRelease(context);
        return nil;
    }
    
    NSCountedSet *cls = [NSCountedSet setWithCapacity:thumbSize.width*thumbSize.height];
    
    for (int x=0; x<thumbSize.height; x++) {
        for (int y=0; y<thumbSize.width; y++) {
            int offset = 4*(x*thumbSize.width + y);
            int red = data[offset];
            int green = data[offset+1];
            int blue = data[offset+2];
            int alpha =  data[offset+3];
            
            NSArray *clr=@[@(red),@(green),@(blue),@(alpha)];
            [cls addObject:clr];
        }
    }
    CGContextRelease(context);

    //第三步 找到出现次数最多的那个颜色
    NSEnumerator *enumerator = [cls objectEnumerator];
    NSArray *curColor = nil;
    
    NSArray *MaxColor=nil;
    NSUInteger MaxCount=0;
    
    while ( (curColor = [enumerator nextObject]) != nil ){
        NSUInteger tmpCount = [cls countForObject:curColor];
        if ( tmpCount < MaxCount ) continue;
        MaxCount=tmpCount;
        MaxColor=curColor;
    }
    //返回三色值+透明度
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] initWithCapacity:0];
    [dic setValue:@([MaxColor[0] intValue]/255.0f) forKey:@"red"];
    [dic setValue:@([MaxColor[1] intValue]/255.0f) forKey:@"green"];
    [dic setValue:@([MaxColor[2] intValue]/255.0f) forKey:@"blue"];
    [dic setValue:@([MaxColor[3] intValue]/255.0f) forKey:@"alpha"];
    return dic;
}
///裁剪图片
- (nullable UIImage *)yi_cropSquareImageRect:(CGRect)rect {
    CGImageRef sourceImageRef = [self CGImage];
    CGImageRef newImageRef = CGImageCreateWithImageInRect(sourceImageRef, rect);
    UIImage *newImage = [UIImage imageWithCGImage:newImageRef];
    return newImage;
}

+ (nullable UIImage *)imageWithNamed:(nullable NSString *)name{
    UIImage *image = [[self imageNamed:name] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    return image;
}


+ (UIImage *)y_qrodeFromString:(NSString *)inputString {
    // 将字符串转换为NSData
    NSData *data = [inputString dataUsingEncoding:NSUTF8StringEncoding];
    
    // 创建CIFilter过滤器对象，类型为QRCode
    CIFilter *filter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    
    // 重置滤镜的默认属性
    [filter setDefaults];
    
    // 设置输入数据
    [filter setValue:data forKey:@"inputMessage"];
    
    // 设置纠错级别 (L: 7%, M: 15%, Q: 25%, H: 30%)
    [filter setValue:@"H" forKey:@"inputCorrectionLevel"];
    
    // 获取生成的二维码图像
    CIImage *ciImage = [filter outputImage];
    
    // 将CIImage转换为UIImage并放大
    return [self yi_createNonInterpolatedUIImageFromCIImage:ciImage withScale:10.0];
}
+ (UIImage *)yi_createNonInterpolatedUIImageFromCIImage:(CIImage *)ciImage withScale:(CGFloat)scale {
    CGRect extent = CGRectIntegral(ciImage.extent);
    CGFloat scaleWidth = scale * CGRectGetWidth(extent);
    CGFloat scaleHeight = scale * CGRectGetHeight(extent);
    
    // 创建位图上下文
    UIGraphicsBeginImageContext(CGSizeMake(scaleWidth, scaleHeight));
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // 创建CoreImage上下文
    CIContext *ciContext = [CIContext contextWithOptions:nil];
    
    // 创建CGImage
    CGImageRef cgImage = [ciContext createCGImage:ciImage fromRect:extent];
    
    // 设置上下文的插值质量
    CGContextSetInterpolationQuality(context, kCGInterpolationNone);
    
    // 绘制图片
    CGContextDrawImage(context, CGRectMake(0, 0, scaleWidth, scaleHeight), cgImage);
    
    // 获取UIImage
    UIImage *qrCodeImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // 释放资源
    UIGraphicsEndImageContext();
    CGImageRelease(cgImage);
    
    return qrCodeImage;
}

@end
