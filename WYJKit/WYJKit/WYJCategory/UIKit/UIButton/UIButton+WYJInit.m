/*******************************************************************************
 Copyright (K), 2019 - ~, ╰莪呮想好好宠Nǐつ
 
 Author:        ╰莪呮想好好宠Nǐつ (Wang Yijing)
 E-mail:        1091676312@qq.com
 GitHub:        https://github.com/MemoryKing
 ********************************************************************************/

#import "UIButton+WYJInit.h"

@implementation UIButton (WYJInit)
+ (UIButton *)initWithFrame:(CGRect)frame title:(NSString *)title size:(CGSize)size
                 titleColor:(UIColor *)titleColor
                       font:(UIFont *)font
                 buttonType:(UIButtonType)buttonType
                    bgColor:(UIColor *)bgColor
                     corner:(float)cornerRadius
                     target:(id)target
                     action:(SEL)action {
    UIButton *button = [UIButton buttonWithType:buttonType];
    button.frame = frame;
    if (title) {
        [button setTitle:title forState:UIControlStateNormal];
    }
    if (titleColor) {
        [button setTitleColor:titleColor forState:UIControlStateNormal];
    }
    if (font) {
        button.titleLabel.font = font;
    }
    if (bgColor) {
        button.backgroundColor = bgColor;
    }
    if (cornerRadius > 0) {
        button.layer.cornerRadius = cornerRadius;
        button.layer.masksToBounds = YES;
    }
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return button;
}


@end
