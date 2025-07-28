//
//  UITextField+WYJChain.h
//  WYJKit
//
//  Created by 祎 on 2025/6/20.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITextField (WYJChain)
/**
 *  使用链式调用设置文本框的文本内容
 *  @param text 要设置的文本内容
 *  @return 返回一个返回值为 UITextField 指针的 block
 */
- (UITextField *(^)(NSString *text))yi_textChain;
/**
 *  使用链式调用设置文本框的占位符文本
 *  @param placeholder 要设置的占位符文本
 *  @return 返回一个返回值为 UITextField 指针的 block
 */
- (UITextField *(^)(NSString *placeholder))yi_placeholderChain;
/**
 *  使用链式调用设置文本框的文本颜色
 *  @param color 要设置的文本颜色
 *  @return 返回一个返回值为 UITextField 指针的 block
 */
- (UITextField *(^)(UIColor *color))yi_textColorChain;
/**
 *  使用链式调用设置文本框的字体
 *  @param font 要设置的字体
 *  @return 返回一个返回值为 UITextField 指针的 block
 */
- (UITextField *(^)(UIFont *font))yi_fontChain;
/**
 *  使用链式调用设置文本框的文本对齐方式
 *  @param alignment 要设置的文本对齐方式
 *  @return 返回一个返回值为 UITextField 指针的 block
 */
- (UITextField *(^)(NSTextAlignment alignment))yi_textAlignmentChain;
/**
 *  使用链式调用设置文本框的键盘类型
 *  @param type 要设置的键盘类型
 *  @return 返回一个返回值为 UITextField 指针的 block
 */
- (UITextField *(^)(UIKeyboardType type))yi_keyboardTypeChain;
/**
 *  使用链式调用设置文本框是否为密码输入模式
 *  @param secure 是否为密码输入模式，YES 表示是，NO 表示否
 *  @return 返回一个返回值为 UITextField 指针的 block
 */
- (UITextField *(^)(BOOL secure))yi_secureTextEntryChain;
/**
 *  使用链式调用设置文本框的背景颜色
 *  @param color 要设置的背景颜色
 *  @return 返回一个返回值为 UITextField 指针的 block
 */
- (UITextField *(^)(UIColor *color))yi_backgroundColorChain;

/**
 *  使用链式调用设置文本框的激活状态
 *  @param enabled 是否激活
 *  @return 返回一个返回值为 UITextField 指针的 block
 */
- (UITextField *(^)(BOOL disabled))yi_enabledChain;
@end

NS_ASSUME_NONNULL_END
