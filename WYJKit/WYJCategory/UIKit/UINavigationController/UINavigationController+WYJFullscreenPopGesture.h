/*
  Created by King on 2021
  Copyright © 2021年 King. All rights reserved.
*/

#import <UIKit/UIKit.h>

@interface UINavigationController (WYJFullscreenPopGesture)

@property (nonatomic, strong, readonly) UIPanGestureRecognizer *yi_fullscreenPopGestureRecognizer;

@property (nonatomic, assign) BOOL yi_viewControllerBasedNavigationBarAppearanceEnabled;

@end

@interface UIViewController (WYJFullscreenPopGesture)

@property (nonatomic, assign) BOOL yi_interactivePopDisabled;

@property (nonatomic, assign) BOOL yi_prefersNavigationBarHidden;

@property (nonatomic, assign) CGFloat yi_interactivePopMaxAllowedInitialDistanceToLeftEdge;

@end
