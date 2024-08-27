/*
  Created by 祎 on 2021
  Copyright © 2021年 祎. All rights reserved.
*/
#import <UIKit/UIKit.h>
#import <IQKeyboardManager/IQKeyboardManager.h>
NS_ASSUME_NONNULL_BEGIN
@interface UIResponder (WYJConfigure)

#pragma make ------  热更新 ------
- (void)yi_hotReload;

#pragma make ------  键盘收回管理 ------
-(void)yi_configureBoardManager;
-(void)yi_configureBoardManager:(void(^_Nullable)(IQKeyboardManager *_Nullable))block;

@end
NS_ASSUME_NONNULL_END
