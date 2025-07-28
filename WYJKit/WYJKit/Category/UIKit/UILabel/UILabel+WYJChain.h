//
//  UILabel+WYJChain.h
//  WYJKit
//
//  Created by 祎 on 2025/6/17.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (WYJChain)

/** 设置文本内容 */
@property (nonatomic, copy, readonly) UILabel *(^yi_textChain)(NSString *text);

/** 设置文本颜色 */
@property (nonatomic, copy, readonly) UILabel *(^yi_textColorChain)(UIColor *color);

/** 设置字体 */
@property (nonatomic, copy, readonly) UILabel *(^yi_fontChain)(UIFont *font);

/** 设置文本对齐方式 */
@property (nonatomic, copy, readonly) UILabel *(^yi_textAlignmentChain)(NSTextAlignment alignment);

/** 设置行数（默认 1 行，0 为不限行） */
@property (nonatomic, copy, readonly) UILabel *(^yi_numberOfLinesChain)(NSInteger lines);

/** 设置富文本内容 */
@property (nonatomic, copy, readonly) UILabel *(^yi_attributedTextChain)(NSAttributedString *attr);




@end

NS_ASSUME_NONNULL_END
