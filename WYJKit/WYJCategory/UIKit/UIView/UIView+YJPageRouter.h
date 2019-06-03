/*******************************************************************************
 Copyright (K), 2019 - ~, ╰莪呮想好好宠Nǐつ
 
 Author:        ╰莪呮想好好宠Nǐつ (Wang Yijing)
 E-mail:        1091676312@qq.com
 GitHub:        https://github.com/MemoryKing
 ********************************************************************************/


#import <UIKit/UIKit.h>

@interface UIView (YJPageRouter)

- (void)push:(UIViewController *)vc;
- (void)pop;
- (void)popToRoot;
- (void)popToRootWithAnimated:(BOOL)animated;

- (void)present:(UIViewController *)vc;
- (void)present:(UIViewController *)vc animated:(BOOL)animated;
- (void)dismiss;
- (void)dismiss:(void (^)(void))completion;
- (void)dismissAnimated:(BOOL)animated;
- (void)dismissAnimated:(BOOL)animated completion:(void(^)(void))completion;

- (UIViewController *)currentController;

@end

