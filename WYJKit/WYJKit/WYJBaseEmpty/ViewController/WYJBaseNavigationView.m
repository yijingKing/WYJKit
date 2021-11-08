/*******************************************************************************
 Copyright (K), 2019 - ~, ╰莪呮想好好宠Nǐつ
 
 Author:        ╰莪呮想好好宠Nǐつ (Wang Yijing)
 E-mail:        1091676312@qq.com
 GitHub:        https://github.com/MemoryKing
 ********************************************************************************/


#import "WYJBaseNavigationView.h"
#import "UIKitCagoryHeader.h"

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
