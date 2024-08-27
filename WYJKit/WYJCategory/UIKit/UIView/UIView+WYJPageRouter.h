/*
  Created by 祎 on 2021
  Copyright © 2021年 祎. All rights reserved.
*/

#import <UIKit/UIKit.h>

@interface UIView (WYJPageRouter)

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


@end

