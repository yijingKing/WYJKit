/*******************************************************************************
 Copyright (K), 2019 - ~, ╰莪呮想好好宠Nǐつ
 
 Author:        ╰莪呮想好好宠Nǐつ (Wang Yijing)
 E-mail:        1091676312@qq.com
 GitHub:        https://github.com/MemoryKing
 ********************************************************************************/

#import "UIResponder+Configure.h"
#import <IQKeyboardManager/IQKeyboardManager.h>
@implementation UIResponder (Configure)
#pragma make ------  热更新 ------
- (void)hotReload {
#if DEBUG
    [[NSBundle bundleWithPath:@"/Applications/InjectionIII.app/Contents/Resources/iOSInjection.bundle"] load];
#endif
}

#pragma make ------  键盘收回管理 ------
-(void)configureBoardManager {
    IQKeyboardManager *manager = [IQKeyboardManager sharedManager];
    manager.enable = YES;// 控制整个功能是否启用
    manager.shouldResignOnTouchOutside = YES;// 控制点击背景是否收起键盘
    manager.shouldToolbarUsesTextFieldTintColor = YES;// 控制键盘上的工具条文字颜色是否用户自定义
    manager.keyboardDistanceFromTextField=60;// 输入框距离键盘的距离
    manager.enableAutoToolbar = NO;// 控制是否显示键盘上的工具条
    manager.toolbarManageBehaviour = IQAutoToolbarBySubviews; // 有多个输入框时，可以通过点击Toolbar 上的“前一个”“后一个”按钮来实现移动到不同的输入框
    manager.shouldShowToolbarPlaceholder = YES; // 是否显示占位文字
    manager.placeholderFont = [UIFont boldSystemFontOfSize:17]; // 设置占位文字的字体
}
@end
