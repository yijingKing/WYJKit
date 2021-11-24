/*
  Created by 祎 on 2021
  Copyright © 2021年 祎. All rights reserved.
  GitHub: https://github.com/MemoryKing
*/

#import "UIButton+WYJInterval.h"
#import <objc/runtime.h>
static char *const kEventIntervalKey = "kEventIntervalKey"; // 时间间隔
static char *const kEventInvalidKey = "kEventInvalidKey";   // 是否失效

@interface UIControl()

/** 是否失效 - 即不可以点击 */
@property(nonatomic, assign)BOOL yi_eventInvalid;

@end

@implementation UIButton (WYJInterval)

+ (void)load {
    // 交换方法
    Method clickMethod = class_getInstanceMethod(self, @selector(sendAction:to:forEvent:));
    Method yi_clickMethod = class_getInstanceMethod(self, @selector(yi_sendAction:to:forEvent:));
    method_exchangeImplementations(clickMethod, yi_clickMethod);
}

#pragma mark - click

- (void)yi_sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event {
    if (!self.yi_eventInvalid) {
        self.yi_eventInvalid = YES;
        [self yi_sendAction:action to:target forEvent:event];
        [self performSelector:@selector(setyi_eventInvalid:) withObject:@(NO) afterDelay:self.yi_eventInterval];
    }
}

#pragma mark - set | get

- (NSTimeInterval)yi_eventInterval {
    return [objc_getAssociatedObject(self, kEventIntervalKey) doubleValue];
}

- (void)setyi_eventInterval:(NSTimeInterval)yi_eventInterval {
    objc_setAssociatedObject(self, kEventIntervalKey, @(yi_eventInterval), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)yi_eventInvalid {
    return [objc_getAssociatedObject(self, kEventInvalidKey) boolValue];
}

- (void)setyi_eventInvalid:(BOOL)yi_eventInvalid {
    objc_setAssociatedObject(self, kEventInvalidKey, @(yi_eventInvalid), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
