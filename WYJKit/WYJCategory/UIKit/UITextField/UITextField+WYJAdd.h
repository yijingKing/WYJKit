/*
  Created by King on 2021
  Copyright © 2021年 King. All rights reserved.
*/

#import <UIKit/UIKit.h>


@interface UITextField (WYJAdd)
/** 占位文字颜色 */
@property (nonatomic, strong) UIColor * placeholderColor;
/** 最大显示字符限制(会自动根据该属性截取文本字符长度) */
@property (nonatomic, assign) NSInteger maximumLimit;

/**
 *  文本发生改变时回调
 */
- (void)textDidChange:(void (^)(NSString *string))handle;
/**
 *  处理系统输入法导致的乱码,如果调用了maximumLimit属性，内部会默认处理乱码
 */
- (void)fixMessyDisplay;
- (void)setLeftViewWithWidth:(double)width;
- (void)setLeftViewWithIcon:(nullable UIImage *)image width:(double)width imageSize:(CGSize)imageSize spacing:(double)spacing;
@end


