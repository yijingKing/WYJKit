/*
  Created by King on 2021
  Copyright © 2021年 King. All rights reserved.
*/

#import <UIKit/UIKit.h>
#import "WYJBaseView.h"
NS_ASSUME_NONNULL_BEGIN

@interface WYJNavigationView : WYJBaseView

/// 左侧钮
/// @param size 大小
/// @param image 图片
/// @param title 文本
- (void)setLeftItemWithSize:(CGSize *)size image:(UIImage *)image title:(NSString *)title titleColor:(UIColor *)titleColor;
@end

NS_ASSUME_NONNULL_END
