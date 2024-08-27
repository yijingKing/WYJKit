/*
  Created by 祎 on 2021
  Copyright © 2021年 祎. All rights reserved.
*/
#import "UIButton+WYJInit.h"
#import "UIFontHeader.h"
@implementation UIButton (WYJInit)
/// @param frame 位置
/// @param title 文本
/// @param titleColor 文本颜色
+ (UIButton *)yi_createWithFrame:(CGRect)frame
                        title:(NSString *)title
                   titleColor:(UIColor *)titleColor {
    return [self yi_createWithFrame:frame title:title titleColor:titleColor font:PFRFontWithSizes(17) buttonType:UIButtonTypeCustom bgColor:UIColor.whiteColor corner:0 target:nil action:nil];
}
/// @param frame 位置
/// @param title 文本
/// @param titleColor 文本颜色
/// @param font 文本字体
+ (UIButton *)yi_createWithFrame:(CGRect)frame
                        title:(NSString *)title
                   titleColor:(UIColor *)titleColor
                         font:(UIFont *)font {
    return [self yi_createWithFrame:frame title:title titleColor:titleColor font:font buttonType:UIButtonTypeCustom bgColor:UIColor.whiteColor corner:0 target:nil action:nil];
}
/// @param frame 位置
/// @param title 文本
/// @param titleColor 文本颜色
/// @param font 文本字体
/// @param target 目标
/// @param action 函数
+ (UIButton *)yi_createWithFrame:(CGRect)frame
                        title:(NSString *)title
                   titleColor:(UIColor *)titleColor
                         font:(UIFont *)font
                       target:(id)target
                       action:(SEL)action {
    return [self yi_createWithFrame:frame title:title titleColor:titleColor font:font buttonType:UIButtonTypeCustom bgColor:UIColor.whiteColor corner:0 target:target action:action];
}
/// @param frame 位置
/// @param title 文本
/// @param titleColor 文本颜色
/// @param font 文本字体
/// @param buttonType 样式
/// @param bgColor 背景颜色
/// @param target 目标
/// @param action 函数
+ (UIButton *)yi_createWithFrame:(CGRect)frame
                        title:(NSString *)title
                   titleColor:(UIColor *)titleColor
                         font:(UIFont *)font
                   buttonType:(UIButtonType)buttonType
                      bgColor:(UIColor *)bgColor
                       target:(id)target
                       action:(SEL)action {
    return [self yi_createWithFrame:frame title:title titleColor:titleColor font:font buttonType:buttonType bgColor:bgColor corner:0 target:target action:action];
}
/// @param frame 位置
/// @param title 文本
/// @param titleColor 文本颜色
/// @param font 文本字体
/// @param buttonType 样式
/// @param bgColor 背景颜色
/// @param cornerRadius 圆角
/// @param target 目标
/// @param action 函数
+ (UIButton *)yi_createWithFrame:(CGRect)frame
                        title:(NSString *)title
                   titleColor:(UIColor *)titleColor
                         font:(UIFont *)font
                   buttonType:(UIButtonType)buttonType
                      bgColor:(UIColor *)bgColor
                       corner:(float)cornerRadius
                       target:(id)target
                       action:(SEL)action {
    UIButton *button = [UIButton buttonWithType:buttonType];
    button.frame = frame;
    if (title) {
        [button setTitle:title forState:UIControlStateNormal];
    }
    if (titleColor) {
        [button setTitleColor:titleColor forState:UIControlStateNormal];
    }
    if (font) {
        button.titleLabel.font = font;
    }
    if (bgColor) {
        button.backgroundColor = bgColor;
    }
    if (cornerRadius > 0) {
        button.layer.cornerRadius = cornerRadius;
        button.layer.masksToBounds = YES;
    }
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return button;
}
/// @param frame 位置
/// @param image 图片
/// @param selectedImage 选中图片
+ (UIButton *)yi_createWithFrame:(CGRect)frame
                        image:(UIImage *)image
                selectedImage:(UIImage *)selectedImage {
    return [self yi_createWithFrame:frame image:image selectedImage:selectedImage buttonType:UIButtonTypeCustom corner:0 target:nil action:nil];
}
/// @param frame 位置
/// @param image 图片
/// @param selectedImage 选中图片
/// @param target 目标
/// @param action 函数
+ (UIButton *)yi_createWithFrame:(CGRect)frame
                        image:(UIImage *)image
                selectedImage:(UIImage *)selectedImage
                       target:(id)target
                       action:(SEL)action {
    return [self yi_createWithFrame:frame image:image selectedImage:selectedImage buttonType:UIButtonTypeCustom corner:0 target:target action:action];
}
/// @param frame 位置
/// @param image 图片
/// @param selectedImage 选中图片
/// @param buttonType 样式
/// @param cornerRadius 圆角
/// @param target 目标
/// @param action 函数
+ (UIButton *)yi_createWithFrame:(CGRect)frame
                        image:(UIImage *)image
                selectedImage:(UIImage *)selectedImage
                   buttonType:(UIButtonType)buttonType
                       corner:(float)cornerRadius
                       target:(id)target
                       action:(SEL)action {
    UIButton *button = [UIButton buttonWithType:buttonType];
    button.frame = frame;
    if (image) {
        [button setImage:image forState:normal];
    }
    if (selectedImage) {
        [button setImage:selectedImage forState:UIControlStateSelected];
    }
    if (cornerRadius > 0) {
        button.layer.cornerRadius = cornerRadius;
        button.layer.masksToBounds = YES;
    }
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return button;
}

/// 构建->位置-文本-文本颜色-选中文本-选中文本颜色-图片-选中图片-字体
/// @param frame 位置
/// @param title 文本
/// @param titleColor 文本颜色
/// @param selectedTitle 选中文本
/// @param selectedColor 选中文本颜色
/// @param image 图片
/// @param selectedImage 选中图片
/// @param font 字体
+ (UIButton *)yi_createWithFrame:(CGRect)frame
                        title:(NSString *)title
                   titleColor:(UIColor *)titleColor
                selectedTitle:(NSString *)selectedTitle
                selectedColor:(UIColor *)selectedColor
                        image:(UIImage *)image
                selectedImage:(UIImage *)selectedImage
                         font:(UIFont *)font {
    return [self yi_createWithFrame:frame title:title titleColor:titleColor selectedTitle:selectedTitle selectedColor:selectedColor image:image selectedImage:selectedImage font:font buttonType:UIButtonTypeCustom corner:0 target:nil action:nil];
}
/// 构建->位置-文本-文本颜色-选中文本-选中文本颜色-图片-选中图片-字体-样式-圆角
/// @param frame 位置
/// @param title 文本
/// @param titleColor 文本颜色
/// @param selectedTitle 选中文本
/// @param selectedColor 选中文本颜色
/// @param image 图片
/// @param selectedImage 选中图片
/// @param font 字体
/// @param buttonType 样式
/// @param cornerRadius 圆角
/// @param target 目标
/// @param action 函数
+ (UIButton *)yi_createWithFrame:(CGRect)frame
                        title:(NSString *)title
                   titleColor:(UIColor *)titleColor
                selectedTitle:(NSString *)selectedTitle
                selectedColor:(UIColor *)selectedColor
                        image:(UIImage *)image
                selectedImage:(UIImage *)selectedImage
                         font:(UIFont *)font
                   buttonType:(UIButtonType)buttonType
                       corner:(float)cornerRadius
                       target:(id)target
                       action:(SEL)action {
    UIButton *button = [UIButton buttonWithType:buttonType];
    button.frame = frame;
    if (title) {
        [button setTitle:title forState:UIControlStateNormal];
    }
    if (titleColor) {
        [button setTitleColor:titleColor forState:UIControlStateNormal];
    }
    if (selectedTitle) {
        [button setTitle:selectedTitle forState:UIControlStateSelected];
    }
    if (selectedColor) {
        [button setTitleColor:selectedColor forState:UIControlStateSelected];
    }
    if (image) {
        [button setImage:image forState:normal];
    }
    if (selectedImage) {
        [button setImage:selectedImage forState:UIControlStateSelected];
    }
    if (font) {
        button.titleLabel.font = font;
    }
    if (cornerRadius > 0) {
        button.layer.cornerRadius = cornerRadius;
        button.layer.masksToBounds = YES;
    }
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return button;
}


@end
