/*******************************************************************************
 Copyright (K), 2019 - ~, ╰莪呮想好好宠Nǐつ
 
 Author:        ╰莪呮想好好宠Nǐつ (Wang Yijing)
 E-mail:        1091676312@qq.com
 GitHub:        https://github.com/MemoryKing
 ********************************************************************************/


#import "UIView+YJPageRouter.h"

@implementation UIView (YJPageRouter)

- (void)yi_push:(UIViewController *)vc {
    UIViewController * currentC = [self yi_currentController];
    
    if([currentC isKindOfClass:[UINavigationController class]]) {
        UINavigationController * nav = (UINavigationController *)currentC;
        if (nav.viewControllers.count > 0 ) {
            vc.hidesBottomBarWhenPushed = YES;
        }
        [nav pushViewController:vc animated:YES];
    }
    else {
        UINavigationController * nav = [currentC navigationController];
        if (nav.viewControllers.count > 0 ) {
            vc.hidesBottomBarWhenPushed = YES;
        }
        [[currentC navigationController] pushViewController:vc animated:YES];
    }
}

- (void)yi_pop {
    UIViewController * currentC = [self yi_currentController];
    if([currentC isKindOfClass:[UINavigationController class]]) {
        [((UINavigationController *)currentC) popViewControllerAnimated:YES];
    }
    else {
        [[currentC navigationController] popViewControllerAnimated:YES];
    }
}

- (void)yi_popToRoot {
    [self yi_popToRootWithAnimated:YES];
}

- (void)yi_popToRootWithAnimated:(BOOL)animated {
    UIViewController * currentC = [self yi_currentController];
    if([currentC isKindOfClass:[UINavigationController class]]) {
        [((UINavigationController *)currentC) popToRootViewControllerAnimated:YES];
    }
    else {
        [[currentC navigationController] popToRootViewControllerAnimated:YES];
    }
}

- (void)yi_present:(UIViewController *)vc {
    [self yi_present:vc animated:YES];
}

- (void)yi_present:(UIViewController *)vc animated:(BOOL)animated {
    [[self yi_currentController] presentViewController:vc animated:animated completion:nil];
}

- (void)yi_dismiss {
    [self yi_dismiss:nil];
}

- (void)yi_dismiss:(void (^)(void))completion {
    [self yi_dismissAnimated:YES completion:completion];
}

- (void)yi_dismissAnimated:(BOOL)animated {
    [self yi_dismissAnimated:animated completion:nil];
}

- (void)yi_dismissAnimated:(BOOL)animated completion:(void(^)(void))completion {
    [[self yi_currentController] dismissViewControllerAnimated:animated completion:completion];
}

- (UIViewController *)yi_currentController {
    UIViewController * presentedVC = [[UIApplication sharedApplication].delegate window].rootViewController;
    if ([presentedVC isKindOfClass:[UINavigationController class]]) {
        presentedVC = presentedVC.presentedViewController;
    }
    else if ([presentedVC isKindOfClass:[UITabBarController class]]) {
        UITabBarController* tabBarController = (UITabBarController* )presentedVC;
        presentedVC = tabBarController.selectedViewController;
    }
    else {
        NSUInteger childViewControllerCount = presentedVC.childViewControllers.count;
        if (childViewControllerCount > 0) {
            presentedVC = presentedVC.childViewControllers.lastObject;
            return presentedVC;
        } else {
            return presentedVC;
        }
    }
    return presentedVC;
}


@end
