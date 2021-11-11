/*******************************************************************************
 Copyright (K), 2019 - ~, ╰莪呮想好好宠Nǐつ
 
 Author:        ╰莪呮想好好宠Nǐつ (Wang Yijing)
 E-mail:        1091676312@qq.com
 GitHub:        https://github.com/MemoryKing
 ********************************************************************************/

#import <UIKit/UIKit.h>
#import <IQKeyboardManager/IQKeyboardManager.h>
NS_ASSUME_NONNULL_BEGIN
@interface UIResponder (WYJConfigure)

#pragma make ------  热更新 ------
- (void)hotReload;

#pragma make ------  键盘收回管理 ------
-(void)configureBoardManager;
-(void)configureBoardManager:(void(^_Nullable)(IQKeyboardManager *_Nullable))block;

@end
NS_ASSUME_NONNULL_END
