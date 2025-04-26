/*
 Created by 祎 on 2021
 Copyright © 2021年 祎. All rights reserved.
 */

#import <UIKit/UIKit.h>
#import "UIView+YJThen.h"

NS_ASSUME_NONNULL_BEGIN

// Maker 类，用于链式调用方法
@interface YJLabelMaker : YJViewMaker

// 初始化方法，传入一个 UILabel 实例
- (instancetype)initWithLabel:(UILabel *)label;

/// 设置 UILabel 的文本。
/// @param text UILabel 的文本内容。
/// @return 返回 YJLabelMaker 实例以支持链式调用。
@property (nonatomic, strong, readonly) YJLabelMaker *(^text)(NSString *text);

/// 设置 UILabel 的字体。
/// @param font UILabel 的字体。
/// @return 返回 YJLabelMaker 实例以支持链式调用。
@property (nonatomic, strong, readonly) YJLabelMaker *(^font)(UIFont *font);

/// 设置 UILabel 的文本颜色。
/// @param color UILabel 的文本颜色。
/// @return 返回 YJLabelMaker 实例以支持链式调用。
@property (nonatomic, strong, readonly) YJLabelMaker *(^textColor)(UIColor *color);

/// 设置 UILabel 的渐变文本颜色。
/// @param colors UILabel 的文本渐变颜色字符串,多色用','隔开。
/// @return 返回 YJLabelMaker 实例以支持链式调用。
@property (nonatomic, strong, readonly) YJLabelMaker *(^gradientTextColor)(NSString * colors);

/// 设置 UILabel 的文本对齐方式。
/// @param alignment UILabel 的文本对齐方式。
/// @return 返回 YJLabelMaker 实例以支持链式调用。
@property (nonatomic, strong, readonly) YJLabelMaker *(^textAlignment)(NSTextAlignment alignment);

/// 设置 UILabel 的行间距。
/// @param lineSpacing 行间距的大小。
/// @return 返回 YJLabelMaker 实例以支持链式调用。
@property (nonatomic, strong, readonly) YJLabelMaker *(^lineSpacing)(CGFloat lineSpacing);

/// 设置 UILabel 的最大行数。
/// @param numberOfLines 最大行数（0 表示无限制）。
/// @return 返回 YJLabelMaker 实例以支持链式调用。
@property (nonatomic, strong, readonly) YJLabelMaker *(^numberOfLines)(NSInteger numberOfLines);

/// 设置 UILabel 的富文本内容。
/// @param attributedText UILabel 的富文本内容。
/// @return 返回 YJLabelMaker 实例以支持链式调用。
@property (nonatomic, strong, readonly) YJLabelMaker *(^attributedText)(NSAttributedString *attributedText);

@end


@interface UILabel (YJThen)

/// 通过块方法配置 UILabel
- (void)yi_configureWithMake:(void (^)(YJLabelMaker *make))block;
/// 通过块方法配置 UILabel
+ (UILabel *)yi_configureWithMake:(void (^)(YJLabelMaker *make))block;
@end

NS_ASSUME_NONNULL_END
