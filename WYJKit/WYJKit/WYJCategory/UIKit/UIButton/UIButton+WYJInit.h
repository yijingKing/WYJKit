/*******************************************************************************
 Copyright (K), 2019 - ~, ╰莪呮想好好宠Nǐつ
 
 Author:        ╰莪呮想好好宠Nǐつ (Wang Yijing)
 E-mail:        1091676312@qq.com
 GitHub:        https://github.com/MemoryKing
 ********************************************************************************/

#import <UIKit/UIKit.h>


@interface UIButton (WYJInit)
+ (UIButton *)initWithFrame:(CGRect)frame title:(NSString *)title size:(CGSize)size
                 titleColor:(UIColor *)titleColor
                       font:(UIFont *)font
                 buttonType:(UIButtonType)buttonType
                    bgColor:(UIColor *)bgColor
                     corner:(float)cornerRadius
                     target:(id)target
                     action:(SEL)action;
@end

