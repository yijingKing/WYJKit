/*
 Created by 祎 on 2021
 Copyright © 2021年 祎. All rights reserved.
 */

#import <UIKit/UIKit.h>
#import "UIView+YJThen.h"
NS_ASSUME_NONNULL_BEGIN

@interface YJImageViewMaker : YJViewMaker

/// 设置 UIImageView 的图片。
/// @param image 要设置的图片。
/// @return 返回 YJImageViewMaker 实例以支持链式调用。
@property (nonatomic, strong, readonly) YJImageViewMaker *(^image)(UIImage *image);

/// 设置 UIImageView 的内容模式。
/// @param mode 要设置的内容模式（例如：UIViewContentModeScaleAspectFit）。
/// @return 返回 YJImageViewMaker 实例以支持链式调用。
@property (nonatomic, strong, readonly) YJImageViewMaker *(^contentMode)(UIViewContentMode mode);

/// 初始化 YJImageViewMaker 实例。
/// @param imageView 要配置的 UIImageView 实例。
/// @return 返回初始化后的 YJImageViewMaker 实例。
- (instancetype)initWithImageView:(UIImageView *)imageView;

@end


@interface UIImageView (YJThen)

/// 通过块方法配置 UIImageView
- (void)yi_configureWithMake:(void (^)(YJImageViewMaker *make))block;
/// 通过块方法配置 UIImageView
+ (UIImageView *)yi_configureWithMake:(void (^)(YJImageViewMaker *make))block;
@end


NS_ASSUME_NONNULL_END
