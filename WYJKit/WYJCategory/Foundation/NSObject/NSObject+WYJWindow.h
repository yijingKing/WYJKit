/*
 Created by 祎 on 2021
 Copyright © 2021年 祎. All rights reserved.
 */

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (WYJWindow)

//获取当前控制器
- (UIViewController*)yi_currentViewController;
//获取KeyWindow
- (UIWindow *)yi_getKeyWindow;
@end

NS_ASSUME_NONNULL_END
