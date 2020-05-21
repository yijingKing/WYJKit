/*******************************************************************************
 Copyright (K), 2019 - ~, ╰莪呮想好好宠Nǐつ
 
 Author:        ╰莪呮想好好宠Nǐつ (Wang Yijing)
 E-mail:        1091676312@qq.com
 GitHub:        https://github.com/MemoryKing
 ********************************************************************************/


#import <UIKit/UIKit.h>

@interface UIView (YJPageRouter)

- (void)yi_push:(UIViewController *)vc;
- (void)yi_pop;
- (void)yi_popToRoot;
- (void)yi_popToRootWithAnimated:(BOOL)animated;

- (void)yi_present:(UIViewController *)vc;
- (void)yi_present:(UIViewController *)vc animated:(BOOL)animated;
- (void)yi_dismiss;
- (void)yi_dismiss:(void (^)(void))completion;
- (void)yi_dismissAnimated:(BOOL)animated;
- (void)yi_dismissAnimated:(BOOL)animated completion:(void(^)(void))completion;

- (UIViewController *)yi_currentController;

@end

