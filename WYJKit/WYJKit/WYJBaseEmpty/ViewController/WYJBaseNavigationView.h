/*******************************************************************************
 Copyright (K), 2019 - ~, ╰莪呮想好好宠Nǐつ
 
 Author:        ╰莪呮想好好宠Nǐつ (Wang Yijing)
 E-mail:        1091676312@qq.com
 GitHub:        https://github.com/MemoryKing
 ********************************************************************************/


#import <UIKit/UIKit.h>
#import "WYJBaseView.h"
NS_ASSUME_NONNULL_BEGIN

@interface WYJBaseNavigationView : WYJBaseView

/// 左侧钮
/// @param size 大小
/// @param image 图片
/// @param title 文本
- (void)setLeftItemWithSize:(CGSize *)size image:(UIImage *)image title:(NSString *)title titleColor:(UIColor *)titleColor;
@end

NS_ASSUME_NONNULL_END
