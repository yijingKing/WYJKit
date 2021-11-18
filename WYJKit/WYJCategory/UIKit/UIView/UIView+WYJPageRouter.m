/*
  Created by 祎 on 2021
  Copyright © 2021年 祎. All rights reserved.
  GitHub: https://github.com/MemoryKing
*/

#import "UIView+WYJPageRouter.h"
#import "UIView+WYJAdd.h"
@implementation UIView (WYJPageRouter)

- (void)push:(UIViewController *)vc {
    UIViewController * currentC = self.yi_viewController;
    
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
    UIViewController * currentC = self.yi_viewController;
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
    UIViewController * currentC = self.yi_viewController;
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
    [self.yi_viewController presentViewController:vc animated:animated completion:nil];
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
    [self.yi_viewController dismissViewControllerAnimated:animated completion:completion];
}

-(UIWindow*)getCurrentWindow {
    if([[[UIApplication sharedApplication] delegate] window]) {
        return[[[UIApplication sharedApplication] delegate] window];
    }else{
        if(@available(iOS 13.0, *)) {
            NSArray *array =[[[UIApplication sharedApplication] connectedScenes] allObjects];
            UIWindowScene* windowScene = (UIWindowScene*)array[0];
            //如果是普通App开发，可以使用
//            SceneDelegate * delegate = (SceneDelegate *)windowScene.delegate;
//            UIWindow * mainWindow = delegate.window;
            //由于在sdk开发中，引入不了SceneDelegate的头文件，所以需要用kvc获取宿主app的window.
            UIWindow* mainWindow = [windowScene valueForKeyPath:@"delegate.window"];
            if(mainWindow) {
                return mainWindow;
            } else {
                return[UIApplication sharedApplication].windows.lastObject;
            }
        }else{
            return[UIApplication sharedApplication].keyWindow;
        }
    }
}

@end
