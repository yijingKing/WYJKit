//
//  WYJToast.m
//  WYJKit
//
//  Created by 祎 on 2025/5/12.
//

#import "WYJToast.h"
#import <SVProgressHUD/SVProgressHUD.h>
#import "UIFont+WYJAdd.h"
@implementation WYJToast

+ (void)setup {
    [SVProgressHUD setFont: WYJSysFontWithSizes(16)];
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
    [SVProgressHUD setMinimumDismissTimeInterval:2];
    [SVProgressHUD setMaximumDismissTimeInterval:2];
}

+ (NSTimeInterval)getTimeInterval {
    return 2.5;
}

+ (void)showLoading:(NSString *)status {
    [self setup];
    if (status.length > 0) {
        [SVProgressHUD showWithStatus:status];
    } else {
        [SVProgressHUD show];
    }
}

+ (void)showSuccess:(NSString *)status {
    [self setup];
    [SVProgressHUD showSuccessWithStatus:status];
}

+ (void)showSuccess:(NSString *)status completion:(void (^)(void))completion {
    [self setup];
    [SVProgressHUD showSuccessWithStatus:status];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)([self getTimeInterval] * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (completion) {
            completion();
        }
    });
}

+ (void)showError:(NSString *)status {
    [self setup];
    [SVProgressHUD showErrorWithStatus:status];
}

+ (void)showError:(NSString *)status completion:(void (^)(void))completion {
    [self setup];
    [SVProgressHUD showErrorWithStatus:status];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)([self getTimeInterval] * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (completion) {
            completion();
        }
    });
}

+ (void)showInfo:(NSString *)status {
    [self setup];
    [SVProgressHUD setInfoImage:nil];
    [SVProgressHUD showInfoWithStatus:status];
}

+ (void)showInfo:(NSString *)status completion:(void (^)(void))completion {
    [self setup];
    [SVProgressHUD setInfoImage:nil];
    [SVProgressHUD showInfoWithStatus:status];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)([self getTimeInterval] * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (completion) {
            completion();
        }
    });
}

+ (void)dismiss {
    [SVProgressHUD dismiss];
}

+ (BOOL)isVisible {
    return [SVProgressHUD isVisible];
}

@end
