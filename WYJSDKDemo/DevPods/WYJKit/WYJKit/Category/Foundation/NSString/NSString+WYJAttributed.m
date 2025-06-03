/*
 Created by 祎 on 2021
 Copyright © 2021年 祎. All rights reserved.
 */

#import "NSString+WYJAttributed.h"
@implementation NSString (WYJAttributed)
- (NSAttributedString *)yi_attributedFontWithTargetString:(nullable NSString *)targetString
                                                 fontSize:(nullable UIFont *)fontSize {
    return [self yi_attributedFontWithTargetString:targetString fontSize:fontSize color:nil];
}

- (NSAttributedString *)yi_attributedFontWithTargetString:(nullable NSString *)targetString
                                                 fontSize:(nullable UIFont *)fontSize
                                                    color:(nullable UIColor *)color {
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:self];
    NSRange targetRange = [self rangeOfString:targetString];
    if (targetRange.location != NSNotFound) {
        if (fontSize) {
            NSDictionary *attributes = @{NSFontAttributeName: fontSize};
            [attributedString addAttributes:attributes range:targetRange];
        }
        if (color) {
            NSDictionary *attributes = @{NSForegroundColorAttributeName: color};
            [attributedString addAttributes:attributes range:targetRange];
        }
    }
    return attributedString;
}

- (NSAttributedString *)yi_toAttributed {
    return [[NSMutableAttributedString alloc] initWithString:self];
}

@end

@implementation NSAttributedString (WYJAdd)
/// 创建带图片的富文本（图片在前或在后）
/// @param image 要插入的图片
/// @param bounds 图片的显示区域（大小和偏移）
/// @param text 要显示的文本
/// @param appendToTail 是否将图片追加在文字尾部（YES：后置，NO：前置）
/// @param spacing 图标与文字之间的间距
/// @return 返回组合好的 NSAttributedString
+ (NSAttributedString *)yi_attributedStringWithImage:(UIImage *)image bounds:(CGRect)bounds text:(NSString *)text appendImageToTail:(BOOL)appendToTail spacing:(CGFloat)spacing {
    NSTextAttachment *attachment = [[NSTextAttachment alloc] init];
    attachment.image = image;
    attachment.bounds = bounds;
    NSAttributedString *imageAttr = [NSAttributedString attributedStringWithAttachment:attachment];
    NSAttributedString *textAttr = [[NSAttributedString alloc] initWithString:text];
    NSAttributedString *spaceAttr = [NSAttributedString yi_spaceWithWidth:spacing];
    NSMutableAttributedString *result = [[NSMutableAttributedString alloc] init];
    if (appendToTail) {
        [result appendAttributedString:textAttr];
        [result appendAttributedString:spaceAttr];
        [result appendAttributedString:imageAttr];
    } else {
        [result appendAttributedString:imageAttr];
        [result appendAttributedString:spaceAttr];
        [result appendAttributedString:textAttr];
    }
    return result;
}
/// 在当前富文本前/后追加图片
/// @param image 要插入的图片
/// @param bounds 图片的显示区域（大小和偏移）
/// @param toTail 是否追加到尾部（YES：后置，NO：前置）
/// @param spacing 图标与文字之间的间距
/// @return 返回新的 NSAttributedString
- (NSAttributedString *)yi_attributedStringByAppendingImage:(UIImage *)image bounds:(CGRect)bounds toTail:(BOOL)toTail spacing:(CGFloat)spacing {
    NSTextAttachment *attachment = [[NSTextAttachment alloc] init];
    attachment.image = image;
    attachment.bounds = bounds;
    NSAttributedString *imageAttr = [NSAttributedString attributedStringWithAttachment:attachment];
    NSAttributedString *spaceAttr = [NSAttributedString yi_spaceWithWidth:spacing];
    NSMutableAttributedString *mutable = [[NSMutableAttributedString alloc] initWithAttributedString:self];
    if (toTail) {
        [mutable appendAttributedString:spaceAttr];
        [mutable appendAttributedString:imageAttr];
    } else {
        NSMutableAttributedString *result = [[NSMutableAttributedString alloc] init];
        [result appendAttributedString:imageAttr];
        [result appendAttributedString:spaceAttr];
        [result appendAttributedString:mutable];
        return result;
    }
    return mutable;
}
/// 创建指定宽度的空白间距
/// @param width 空白宽度
/// @return 返回空白 NSAttributedString
+ (NSAttributedString *)yi_spaceWithWidth:(CGFloat)width {
    NSTextAttachment *spaceAttachment = [[NSTextAttachment alloc] init];
    spaceAttachment.bounds = CGRectMake(0, 0, width, 1);
    return [NSAttributedString attributedStringWithAttachment:spaceAttachment];
}
@end
