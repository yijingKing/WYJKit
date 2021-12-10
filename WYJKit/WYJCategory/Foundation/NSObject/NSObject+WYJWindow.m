/*
 Created by King on 2021
 Copyright © 2021年 King. All rights reserved.
 */

#import "NSObject+WYJWindow.h"

@implementation NSObject (WYJWindow)
//获取当前控制器
- (UIViewController*)yi_currentViewController {
    return [self currentViewControllerWithRootViewController:[self yi_getKeyWindow].rootViewController];
}
//获取KeyWindow
- (UIWindow *)yi_getKeyWindow {
    if (@available(iOS 13.0, *)) {
        for (UIWindowScene* windowScene in [UIApplication sharedApplication].connectedScenes) {
            if (windowScene.activationState == UISceneActivationStateForegroundActive) {
                for (UIWindow *window in windowScene.windows) {
                    if (window.isKeyWindow) {
                        return window;
                        break;
                    }
                }
            }
        }
    } else {
        return [UIApplication sharedApplication].keyWindow;
    }
    return nil;
}

- (UIViewController*)currentViewControllerWithRootViewController:(UIViewController*)rootViewController {
    if (rootViewController.presentedViewController) {
        UIViewController* presentedViewController = rootViewController.presentedViewController;
        return [self currentViewControllerWithRootViewController:presentedViewController];
    } else if ([rootViewController isKindOfClass:[UINavigationController class]]) {
        UINavigationController* navigationController = (UINavigationController*)rootViewController;
        return [self currentViewControllerWithRootViewController:navigationController.visibleViewController];
    } else if ([rootViewController isKindOfClass:[UITabBarController class]]) {
        UITabBarController *tabBarController = (UITabBarController *)rootViewController;
        return [self currentViewControllerWithRootViewController:tabBarController.selectedViewController];
    } else {
        return rootViewController;
    }
}

@end
