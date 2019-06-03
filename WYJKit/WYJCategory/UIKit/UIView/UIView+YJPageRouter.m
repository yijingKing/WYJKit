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
        [((UINavigationController *)currentC) pushViewController:vc animated:YES];
    }
    else {
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
    while (presentedVC.presentedViewController) {
        presentedVC = presentedVC.presentedViewController;
    }
    return presentedVC;
}


@end
