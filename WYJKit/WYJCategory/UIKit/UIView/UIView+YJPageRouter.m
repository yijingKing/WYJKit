/*******************************************************************************
 Copyright (K), 2019 - ~, ╰莪呮想好好宠Nǐつ
 
 Author:        ╰莪呮想好好宠Nǐつ (Wang Yijing)
 E-mail:        1091676312@qq.com
 GitHub:        https://github.com/MemoryKing
 ********************************************************************************/


#import "UIView+YJPageRouter.h"

@implementation UIView (YJPageRouter)

- (void)push:(UIViewController *)vc {
    UIViewController * currentC = [self currentController];
    
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

- (void)pop {
    UIViewController * currentC = [self currentController];
    if([currentC isKindOfClass:[UINavigationController class]]) {
        [((UINavigationController *)currentC) popViewControllerAnimated:YES];
    }
    else {
        [[currentC navigationController] popViewControllerAnimated:YES];
    }
}

- (void)popToRoot {
    [self popToRootWithAnimated:YES];
}

- (void)popToRootWithAnimated:(BOOL)animated {
    UIViewController * currentC = [self currentController];
    if([currentC isKindOfClass:[UINavigationController class]]) {
        [((UINavigationController *)currentC) popToRootViewControllerAnimated:YES];
    }
    else {
        [[currentC navigationController] popToRootViewControllerAnimated:YES];
    }
}

- (void)present:(UIViewController *)vc {
    [self present:vc animated:YES];
}

- (void)present:(UIViewController *)vc animated:(BOOL)animated {
    [[self currentController] presentViewController:vc animated:animated completion:nil];
}

- (void)dismiss {
    [self dismiss:nil];
}

- (void)dismiss:(void (^)(void))completion {
    [self dismissAnimated:YES completion:completion];
}

- (void)dismissAnimated:(BOOL)animated {
    [self dismissAnimated:animated completion:nil];
}

- (void)dismissAnimated:(BOOL)animated completion:(void(^)(void))completion {
    [[self currentController] dismissViewControllerAnimated:animated completion:completion];
}

- (UIViewController *)currentController {
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
