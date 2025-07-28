/*
 Created by 祎 on 2021
 Copyright © 2021年 祎. All rights reserved.
 */

#import <UIKit/UIKit.h>
#import "UIView+YJThen.h"
NS_ASSUME_NONNULL_BEGIN

@interface YJTextFieldMaker : YJViewMaker

@property (nonatomic, weak) UITextField *textField;

/// 设置视图的框架
/// @param frame 视图的框架
/// @return 返回 YJTextFieldMaker 实例以支持链式调用
@property (nonatomic, strong, readonly) YJTextFieldMaker *(^frame)(CGRect frame);

/// 设置输入框的文本
/// @param text 输入框的文本内容
/// @return 返回 YJTextFieldMaker 实例以支持链式调用
@property (nonatomic, strong, readonly) YJTextFieldMaker *(^text)(NSString *text);

/// 设置字体
/// @param font 字体
/// @return 返回 YJTextFieldMaker 实例以支持链式调用
@property (nonatomic, strong, readonly) YJTextFieldMaker *(^font)(UIFont *font);

/// 设置文字颜色
/// @param color 文字颜色
/// @return 返回 YJTextFieldMaker 实例以支持链式调用
@property (nonatomic, strong, readonly) YJTextFieldMaker *(^textColor)(UIColor *color);

/// 设置占位符
/// @param placeholder 占位符文本
/// @return 返回 YJTextFieldMaker 实例以支持链式调用
@property (nonatomic, strong, readonly) YJTextFieldMaker *(^placeholder)(NSString *placeholder);

- (instancetype)initWithTextField:(UITextField *)textField;

@end

@interface UITextField (YJThen)

/// 配置UITextField的属性
/// @param block 配置 block，提供链式调用接口
- (void)yi_configureWithMake:(void (^)(YJTextFieldMaker *make))block;
/// 配置UITextField的属性
/// @param block 配置 block，提供链式调用接口
+ (UITextField *)yi_configureWithMake:(void (^)(YJTextFieldMaker *make))block;
@end

NS_ASSUME_NONNULL_END
