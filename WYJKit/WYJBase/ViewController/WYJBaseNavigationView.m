/*
  Created by 祎 on 2021
  Copyright © 2021年 祎. All rights reserved.
  GitHub: https://github.com/MemoryKing
*/

#import "WYJBaseNavigationView.h"
#import "WYJKitHeader.h"

@interface WYJBaseNavigationView ()
/// 返回按钮
@property (nonatomic,strong) UIButton *backButton;

@end

@implementation WYJBaseNavigationView

/// 左侧钮
/// @param size 大小
/// @param image 图片
/// @param title 文本
- (void)setLeftItemWithSize:(CGSize *)size image:(UIImage *)image title:(NSString *)title titleColor:(UIColor *)titleColor {
    
}


#pragma mark - Lazy loading

- (UIButton *)backButton {
    if (!_backButton) {
        _backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    }
    return _backButton;
}




@end
