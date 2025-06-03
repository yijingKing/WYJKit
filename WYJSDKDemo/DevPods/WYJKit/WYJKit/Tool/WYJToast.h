//
//  WYJToast.h
//  WYJKit
//
//  Created by 祎 on 2025/5/12.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WYJToast : NSObject

/// 显示加载提示，带状态信息
+ (void)showLoading:(NSString *)status;

/// 显示成功提示，带状态信息
+ (void)showSuccess:(NSString *)status;

/// 显示错误提示，带状态信息
+ (void)showError:(NSString *)status;

/// 显示普通信息提示，带状态信息
+ (void)showInfo:(NSString *)status;

/// 隐藏当前显示的提示
+ (void)dismiss;

/// 判断提示是否正在显示
+ (BOOL)isVisible;

/// 显示成功提示，带状态信息和完成回调
+ (void)showSuccess:(NSString *)status completion:(void (^)(void))completion;

/// 显示错误提示，带状态信息和完成回调
+ (void)showError:(NSString *)status completion:(void (^)(void))completion;

/// 显示普通信息提示，带状态信息和完成回调
+ (void)showInfo:(NSString *)status completion:(void (^)(void))completion;

@end

NS_ASSUME_NONNULL_END
