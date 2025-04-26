/*
 Created by 祎 on 2021
 Copyright © 2021年 祎. All rights reserved.
 */

#import <UIKit/UIKit.h>
#import "UIView+YJThen.h"
NS_ASSUME_NONNULL_BEGIN

@interface YJButtonMaker : YJViewMaker

/// 设置按钮的 title。
/// @param title 按钮的标题。
/// @param state 按钮的状态（例如：UIControlStateNormal, UIControlStateSelected）。
/// @return 返回 YJButtonMaker 实例以支持链式调用。
@property (nonatomic, strong, readonly) YJButtonMaker *(^title)(NSString *title, UIControlState state);

/// 设置按钮的标题颜色。
/// @param color 按钮的标题颜色。
/// @param state 按钮的状态（例如：UIControlStateNormal, UIControlStateSelected）。
/// @return 返回 YJButtonMaker 实例以支持链式调用。
@property (nonatomic, strong, readonly) YJButtonMaker *(^titleColor)(UIColor *color, UIControlState state);

/// 设置按钮的图片。
/// @param image 按钮的图片。
/// @param state 按钮的状态（例如：UIControlStateNormal, UIControlStateSelected）。
/// @return 返回 YJButtonMaker 实例以支持链式调用。
@property (nonatomic, strong, readonly) YJButtonMaker *(^image)(UIImage *image, UIControlState state);

/// 设置按钮的内容内边距.
/// @param insets 按钮的内容内边距（上、左、下、右）.
/// @return 返回 YJButtonMaker 实例以支持链式调用.
@property (nonatomic, strong, readonly) YJButtonMaker *(^contentEdgeInsets)(UIEdgeInsets insets);

/// 设置按钮的字体.
/// @param font 按钮的字体.
/// @return 返回 YJButtonMaker 实例以支持链式调用.
@property (nonatomic, strong, readonly) YJButtonMaker *(^font)(UIFont *font);
/// 设置普通状态下的文本。
@property (nonatomic, copy) YJButtonMaker *(^normalTitle)(NSString *title);
/// 设置选中状态下的文本。
@property (nonatomic, copy) YJButtonMaker *(^selectedTitle)(NSString *title);
/// 设置普通状态下的文本颜色。
@property (nonatomic, copy) YJButtonMaker *(^normalColor)(UIColor *color);
/// 设置选中状态下的文本颜色。
@property (nonatomic, copy) YJButtonMaker *(^selectedColor)(UIColor *color);
/// 设置普通状态下的字体。
@property (nonatomic, copy) YJButtonMaker *(^normalFont)(UIFont *font);
/// 设置选中状态下的字体（注意：UIButton 不支持为不同状态设置不同字体，实际设置为通用字体，仅保留语义）。
@property (nonatomic, copy) YJButtonMaker *(^selectedFont)(UIFont *font);
/// 设置普通状态下的图片
@property (nonatomic, copy) YJButtonMaker *(^normalImage)(UIImage *image);
/// 设置普通状态下的图片
@property (nonatomic, copy) YJButtonMaker *(^selectedImage)(UIImage *image);
/// 设置普通状态下的背景图片。
@property (nonatomic, copy) YJButtonMaker *(^normalBackgroundImage)(UIImage *image);
/// 设置选中状态下的背景图片。
@property (nonatomic, copy) YJButtonMaker *(^selectedBackgroundImage)(UIImage *image);
/// 设置点击事件。
@property (nonatomic, copy) YJButtonMaker *(^addTarget)(id target, SEL selector);

/// 设置。
@property (nonatomic, copy) YJButtonMaker *(^masksToBounds)(BOOL masks);


/// 初始化 YJButtonMaker 实例.
/// @param button 要配置的 UIButton 实例.
/// @return 返回初始化后的 YJButtonMaker 实例。
- (instancetype)initWithButton:(UIButton *)button;

@end

@interface UIButton (YJThen)

/// 使用块方法配置 UIButton
- (void)yi_configureWithMake:(void (^)(YJButtonMaker *make))block;
/// 使用块方法配置 UIButton
+ (UIButton *)yi_configureWithMake:(void (^)(YJButtonMaker *make))block;

@end

NS_ASSUME_NONNULL_END
