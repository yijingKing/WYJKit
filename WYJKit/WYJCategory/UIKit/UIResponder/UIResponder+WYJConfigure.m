/*
  Created by King on 2021
  Copyright © 2021年 King. All rights reserved.
*/
#import "UIResponder+WYJConfigure.h"
#import "WYJKitHeader.h"

@implementation UIResponder (WYJConfigure)
#pragma make ------  热更新 ------
- (void)yi_hotReload {
#if DEBUG
    [[NSBundle bundleWithPath:@"/Applications/InjectionIII.app/Contents/Resources/iOSInjection.bundle"] load];
#endif
}

#pragma make ------  键盘收回管理 ------
-(void)yi_configureBoardManager {
    [self yi_configureBoardManager:nil];
}
-(void)yi_configureBoardManager:(void(^_Nullable)(IQKeyboardManager *_Nullable))block {
    IQKeyboardManager *manager = [IQKeyboardManager sharedManager];
    manager.enable = YES;// 控制整个功能是否启用
    manager.shouldResignOnTouchOutside = YES;// 控制点击背景是否收起键盘
    manager.shouldToolbarUsesTextFieldTintColor = YES;// 控制键盘上的工具条文字颜色是否用户自定义
    manager.keyboardDistanceFromTextField = 5;// 输入框距离键盘的距离
    manager.enableAutoToolbar = NO;// 控制是否显示键盘上的工具条
    manager.shouldShowToolbarPlaceholder = YES; // 是否显示占位文字
    manager.placeholderFont = [UIFont boldSystemFontOfSize:17]; // 设置占位文字的字体
    
    BLOCK_SAFE_CALLS(block,manager);
}
@end
