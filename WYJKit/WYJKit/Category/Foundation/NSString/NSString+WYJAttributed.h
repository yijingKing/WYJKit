/*
  Created by 祎 on 2021
  Copyright © 2021年 祎. All rights reserved.
*/

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (WYJAttributed)
- (NSAttributedString *)yi_toAttributed;
- (NSAttributedString *)yi_attributedFontWithTargetString:(nullable NSString *)targetString
                                                 fontSize:(nullable UIFont *)fontSize;

- (NSAttributedString *)yi_attributedFontWithTargetString:(nullable NSString *)targetString
                                                 fontSize:(nullable UIFont *)fontSize
                                                    color:(nullable UIColor *)color;
@end



@interface NSAttributedString (WYJAdd)
/// 创建指定宽度的空白间距
/// @param width 空白宽度
/// @return 返回空白 NSAttributedString
+ (NSAttributedString *)yi_spaceWithWidth:(CGFloat)width;
/// 创建带图片的富文本（图片在前或在后）
/// @param image 要插入的图片
/// @param bounds 图片的显示区域（大小和偏移）
/// @param text 要显示的文本
/// @param appendToTail 是否将图片追加在文字尾部（YES：后置，NO：前置）
/// @param spacing 图标与文字之间的间距
/// @return 返回组合好的 NSAttributedString
+ (NSAttributedString *)yi_attributedStringWithImage:(UIImage *)image bounds:(CGRect)bounds text:(NSString *)text appendImageToTail:(BOOL)appendToTail spacing:(CGFloat)spacing;
/// 在当前富文本前/后追加图片
/// @param image 要插入的图片
/// @param bounds 图片的显示区域（大小和偏移）
/// @param toTail 是否追加到尾部（YES：后置，NO：前置）
/// @param spacing 图标与文字之间的间距
/// @return 返回新的 NSAttributedString
- (NSAttributedString *)yi_attributedStringByAppendingImage:(UIImage *)image bounds:(CGRect)bounds toTail:(BOOL)toTail spacing:(CGFloat)spacing;


@end
NS_ASSUME_NONNULL_END
