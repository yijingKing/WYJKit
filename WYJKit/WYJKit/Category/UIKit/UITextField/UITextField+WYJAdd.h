/*
  Created by 祎 on 2021
  Copyright © 2021年 祎. All rights reserved.
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

/**
 添加带清空功能的右侧按钮
 @param image 清空按钮图片
 @param imageSize 图片尺寸
 @param margin 按钮与输入框的间距
 @param buttonClick 点击事件
 */
- (void)yi_setupClearButtonOnRightWithImage:(UIImage *)image imageSize:(CGSize)imageSize margin:(CGFloat)margin buttonClick:(void (^)(UIButton * button))buttonClick;


/**
 *  仅文本，默认 spacing 为 0、padding 为 0、无 labelBlock
 */
- (void)yi_setupLeftViewWithText:(NSString *)text;
- (void)yi_setupLeftViewWithText:(NSString *)text width:(CGFloat)width;
- (void)yi_setupLeftViewWithText:(NSString *)text width:(CGFloat)width labelBlock:(void (^)(UILabel *label))labelBlock;
- (void)yi_setupLeftViewWithImage:(UIImage *)image imageSize:(CGSize)imageSize width:(CGFloat)width;
/**
 *  仅文本 + spacing + padding
 */
- (void)yi_setupLeftViewWithText:(NSString *)text containerPadding:(UIEdgeInsets)padding;
/**
 *  仅文本 + spacing + padding + labelBlock
 */
- (void)yi_setupLeftViewWithText:(NSString *)text containerPadding:(UIEdgeInsets)padding labelBlock:(void (^)(UILabel *label))labelBlock;
/**
 *  仅文本 + spacing + labelBlock
 */
- (void)yi_setupLeftViewWithText:(NSString *)text spacing:(CGFloat)spacing labelBlock:(void (^)(UILabel *label))labelBlock;
- (void)yi_setupLeftViewWithImage:(UIImage *)image imageSize:(CGSize)imageSize;

- (void)yi_setupLeftViewWithImage:(UIImage *)image imageSize:(CGSize)imageSize containerPadding:(UIEdgeInsets)padding;

- (void)yi_setupLeftViewWithImage:(UIImage *)image imageSize:(CGSize)imageSize text:(NSString *)text;

- (void)yi_setupLeftViewWithImage:(UIImage *)image imageSize:(CGSize)imageSize text:(NSString *)text spacing:(CGFloat)spacing;

- (void)yi_setupLeftViewWithImage:(UIImage *)image imageSize:(CGSize)imageSize text:(NSString *)text spacing:(CGFloat)spacing containerPadding:(UIEdgeInsets)padding;

- (void)yi_setupLeftViewWithImage:(UIImage *)image imageSize:(CGSize)imageSize text:(NSString *)text spacing:(CGFloat)spacing containerPadding:(UIEdgeInsets)padding labelBlock:(void (^)(UILabel *label))labelBlock;


- (void)yi_setupLeftViewWithImage:(UIImage *)image
                     imageSize:(CGSize)imageSize
                          text:(NSString *)text
                         width:(double)width
                      spacing:(CGFloat)spacing
             containerPadding:(UIEdgeInsets)containerPadding
                       labelBlock:(void (^)(UILabel *label))labelBlock;



/**
 *  设置右侧视图为文本
 *  @param text 右侧显示的文本内容
 */
- (void)yi_setupRightViewWithText:(NSString *)text;
/**
 *  设置右侧视图为文本，可指定宽度
 *  @param text 右侧显示的文本内容
 *  @param width 右侧视图的固定宽度
 */
- (void)yi_setupRightViewWithText:(NSString *)text width:(double)width;
/**
 *  设置右侧视图为文本，可指定间距
 *  @param text 右侧显示的文本内容
 *  @param spacing 文本与输入框边缘的间距
 */
- (void)yi_setupRightViewWithText:(NSString *)text spacing:(CGFloat)spacing;
/**
 *  设置右侧视图为文本，可指定宽度和间距
 *  @param text 右侧显示的文本内容
 *  @param width 右侧视图的固定宽度
 *  @param spacing 文本与输入框边缘的间距
 */
- (void)yi_setupRightViewWithText:(NSString *)text width:(double)width spacing:(CGFloat)spacing;
/**
 *  设置右侧视图为文本，可自定义标签样式
 *  @param text 右侧显示的文本内容
 *  @param labelBlock 用于自定义标签样式的回调
 */
- (void)yi_setupRightViewWithText:(NSString *)text labelBlock:(void (^)(UILabel *label))labelBlock;
/**
 *  设置右侧视图为文本，可指定宽度并自定义标签样式
 *  @param text 右侧显示的文本内容
 *  @param width 右侧视图的固定宽度
 *  @param labelBlock 用于自定义标签样式的回调
 */
- (void)yi_setupRightViewWithText:(NSString *)text width:(double)width labelBlock:(void (^)(UILabel *label))labelBlock;
/**
 *  设置右侧视图为文本，可指定间距并自定义标签样式
 *  @param text 右侧显示的文本内容
 *  @param spacing 文本与输入框边缘的间距
 *  @param labelBlock 用于自定义标签样式的回调
 */
- (void)yi_setupRightViewWithText:(NSString *)text spacing:(CGFloat)spacing labelBlock:(void (^)(UILabel *label))labelBlock;
/**
 *  设置右侧视图为文本，可指定宽度和间距并自定义标签样式
 *  @param text 右侧显示的文本内容
 *  @param width 右侧视图的固定宽度
 *  @param spacing 文本与输入框边缘的间距
 *  @param labelBlock 用于自定义标签样式的回调
 */
- (void)yi_setupRightViewWithText:(NSString *)text width:(double)width spacing:(CGFloat)spacing labelBlock:(void (^)(UILabel *label))labelBlock;
/**
 *  设置右侧视图为图片
 *  @param image 右侧显示的图片
 *  @param imageSize 图片的尺寸
 */
- (void)yi_setupRightViewWithImage:(UIImage *)image imageSize:(CGSize)imageSize;
/**
 *  设置右侧视图为图片，可指定宽度
 *  @param image 右侧显示的图片
 *  @param imageSize 图片的尺寸
 *  @param width 右侧视图的固定宽度
 */
- (void)yi_setupRightViewWithImage:(UIImage *)image imageSize:(CGSize)imageSize width:(double)width;
/**
 *  设置右侧视图为图片，可指定间距
 *  @param image 右侧显示的图片
 *  @param imageSize 图片的尺寸
 *  @param spacing 图片与输入框边缘的间距
 */
- (void)yi_setupRightViewWithImage:(UIImage *)image imageSize:(CGSize)imageSize  spacing:(CGFloat)spacing;
/**
 *  设置右侧视图为图片，可指定宽度和间距
 *  @param image 右侧显示的图片
 *  @param imageSize 图片的尺寸
 *  @param width 右侧视图的固定宽度
 *  @param spacing 图片与输入框边缘的间距
 */
- (void)yi_setupRightViewWithImage:(UIImage *)image imageSize:(CGSize)imageSize width:(double)width spacing:(CGFloat)spacing;

/**
 *  新增一个自定义leftView, 可以外部直接通过block设置
 *
 *  @param yi_setupBlock 用于设置rightView的block，传入leftView的父容器
 */
- (void)yi_setupCustomLeftViewWithBlock:(void (^)(UIView *containerView))setupBlock;
/**
 *  新增一个自定义rightView, 可以外部直接通过block设置
 *
 *  @param yi_setupBlock 用于设置rightView的block，传入rightView的父容器
 */
 - (void)yi_setupCustomRightViewWithBlock:(void (^)(UIView *containerView))setupBlock;



@end


