/*
  Created by 祎 on 2021
  Copyright © 2021年 祎. All rights reserved.
  GitHub: https://github.com/MemoryKing
*/
#import <UIKit/UIKit.h>

@interface UIButton (WYJInit)
/// 创建->位置-文本-颜色
/// @param frame 位置
/// @param title 文本
/// @param titleColor 文本颜色
+ (UIButton *)yi_createWithFrame:(CGRect)frame
                        title:(NSString *)title
                   titleColor:(UIColor *)titleColor;
/// 创建->位置-文本-颜色-字体
/// @param frame 位置
/// @param title 文本
/// @param titleColor 文本颜色
/// @param font 文本字体
+ (UIButton *)yi_createWithFrame:(CGRect)frame
                        title:(NSString *)title
                   titleColor:(UIColor *)titleColor
                         font:(UIFont *)font;
/// 创建->位置-文本-颜色-字体-方法
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
                       action:(SEL)action;
/// 创建->位置-文本-颜色-字体-样式-背景-方法
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
                       action:(SEL)action;
/// 构建->位置-文本-颜色-字体-样式-背景-圆角-方法
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
                     action:(SEL)action;

/// 创建->位置-图片-选中图片
/// @param frame 位置
/// @param image 图片
/// @param selectedImage 选中图片
+ (UIButton *)yi_createWithFrame:(CGRect)frame
                        image:(UIImage *)image
                selectedImage:(UIImage *)selectedImage;
/// 创建->位置-图片-选中图片-目标-函数
/// @param frame 位置
/// @param image 图片
/// @param selectedImage 选中图片
/// @param target 目标
/// @param action 函数
+ (UIButton *)yi_createWithFrame:(CGRect)frame
                        image:(UIImage *)image
                selectedImage:(UIImage *)selectedImage
                       target:(id)target
                       action:(SEL)action;
/// 创建->位置-图片-选中图片-样式-圆角-目标-函数
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
                       action:(SEL)action;
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
                         font:(UIFont *)font;
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
                       action:(SEL)action;
@end

