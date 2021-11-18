/*******************************************************************************
 Copyright (K), 2019 - ~, Eugene King
 
 File name:     UIFont+WYJKit.h
 Author:        Eugene King (Wang Yijing)
 E-mail:        1091676312@qq.com
 ********************************************************************************/

#import <UIKit/UIKit.h>

@interface WYJNavigationButton : UIButton
- (void)setup NS_REQUIRES_SUPER;

+ (instancetype)buttonWithTarget:(id)target action:(SEL)action;
+ (instancetype)buttonWithImage:(UIImage *)image target:(id)target action:(SEL)action;
+ (instancetype)buttonWithTitle:(NSString *)title target:(id)target action:(SEL)action;
+ (instancetype)buttonWithTitle:(NSString *)title color:(UIColor *)color target:(id)target action:(SEL)action;
+ (instancetype)buttonWithImage:(UIImage *)image title:(NSString *)title color:(UIColor *)color target:(id)target action:(SEL)action;
@end

@interface WYJBarButton : WYJNavigationButton

@end
