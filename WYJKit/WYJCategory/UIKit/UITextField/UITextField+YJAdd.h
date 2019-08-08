/*******************************************************************************
 Copyright (K), 2019 - ~, ╰莪呮想好好宠Nǐつ
 
 Author:        ╰莪呮想好好宠Nǐつ (Wang Yijing)
 E-mail:        1091676312@qq.com
 GitHub:        https://github.com/MemoryKing
 ********************************************************************************/


#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITextField (YJAdd)
/** 占位文字颜色 */
@property (nonatomic, strong) UIColor * placeholderColor;
/** 最大显示字符限制(会自动根据该属性截取文本字符长度) */
@property (nonatomic, assign) NSInteger maximumLimit;

/**
 *  文本发生改变时回调
 */
- (void)textDidChange:(void (^)(NSString *))handle;
/**
 *  处理系统输入法导致的乱码,如果调用了maximumLimit属性，内部会默认处理乱码
 */
- (void)fixMessyDisplay;
@end

NS_ASSUME_NONNULL_END
