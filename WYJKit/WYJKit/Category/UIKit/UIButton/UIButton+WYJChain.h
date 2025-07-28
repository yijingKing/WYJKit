//
//  UIButton+Chain.h
//  WYJKit
//
//  Created by 祎 on 2025/6/17.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (WYJChain)

/** 设置标题字体大小（titleLabel.font），默认状态
 */
@property (nonatomic, copy) UIButton *(^yi_titleFontChain)(CGFloat fontSize);

/** 设置标题字体对象（titleLabel.font），默认状态 */
@property (nonatomic, copy) UIButton *(^yi_fontChain)(UIFont *font);

/** 设置标题文本对齐方式（titleLabel.textAlignment） */
@property (nonatomic, copy) UIButton *(^yi_textAlignmentChain)(NSTextAlignment alignment);

/** 设置普通状态下的标题文字 */
@property (nonatomic, copy) UIButton *(^yi_titleTextChain)(NSString *title);

/** 设置普通状态下标题颜色 */
@property (nonatomic, copy) UIButton *(^yi_titleColorChain)(UIColor *color);

/** 设置普通状态下的按钮图像 */
@property (nonatomic, copy) UIButton *(^yi_imageChain)(UIImage *image);

/** 设置普通状态下的背景图 */
@property (nonatomic, copy) UIButton *(^yi_backgroundImageChain)(UIImage *image);

/** 设置普通状态下的富文本标题 */
@property (nonatomic, copy) UIButton *(^yi_attributedTextChain)(NSAttributedString *attributedText);

/** 设置选中状态下的标题文字 */
@property (nonatomic, copy) UIButton *(^yi_selectTitleChain)(NSString *title);

/** 设置选中状态下标题颜色 */
@property (nonatomic, copy) UIButton *(^yi_selectTitleColorChain)(UIColor *color);

/** 设置选中状态下的按钮图像 */
@property (nonatomic, copy) UIButton *(^yi_selectImageChain)(UIImage *image);

/** 设置选中状态下的背景图 */
@property (nonatomic, copy) UIButton *(^yi_selectBackgroundImageChain)(UIImage *image);

/** 设置选中状态下的富文本标题 */
@property (nonatomic, copy) UIButton *(^yi_selectAttributedTextChain)(NSAttributedString *attributedText);


@end

NS_ASSUME_NONNULL_END
