//
//  UIView+WYJChain.h
//  WYJKit
//
//  Created by 祎 on 2025/6/17.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (WYJChain)

/** 设置视图的 frame
 */
@property (nonatomic, copy) UIView *(^yi_frameChain)(CGRect frame);

/** 设置背景颜色
 */
@property (nonatomic, copy) UIView *(^yi_backgroundColorChain)(UIColor *color);

/** 设置圆角半径（自动 masksToBounds = YES）
 */
@property (nonatomic, copy) UIView *(^yi_cornerRadiusChain)(CGFloat radius);

/** 设置是否裁剪超出子视图
 */
@property (nonatomic, copy) UIView *(^yi_clipsToBoundsChain)(BOOL clipsToBounds);

/** 设置边框宽度
 */
@property (nonatomic, copy) UIView *(^yi_borderWidthChain)(CGFloat borderWidth);

/** 设置边框颜色
 */
@property (nonatomic, copy) UIView *(^yi_borderColorChain)(UIColor *borderColor);

/** 设置是否隐藏视图
 */
@property (nonatomic, copy) UIView *(^yi_hiddenChain)(BOOL hidden);

/** 设置是否响应用户交互
 */
@property (nonatomic, copy) UIView *(^yi_userInteractionEnabledChain)(BOOL userInteractionEnabled);

@end

NS_ASSUME_NONNULL_END
