/*
 Created by 祎 on 2021
 Copyright © 2021年 祎. All rights reserved.
 GitHub: https://github.com/MemoryKing
 */

#import "UIControl+WYJEventInterval.h"
#import <objc/runtime.h>

static char * const yi_eventIntervalKey = "yi_eventIntervalKey";
static char * const eventUnavailableKey = "eventUnavailableKey";

@interface UIControl ()

@property (nonatomic, assign) BOOL eventUnavailable;

@end

@implementation UIControl (WYJEventInterval)

+ (void)load {
    
    Method method = class_getInstanceMethod(self, @selector(sendAction:to:forEvent:));
    Method yi_method = class_getInstanceMethod(self, @selector(yi_sendAction:to:forEvent:));
    method_exchangeImplementations(method, yi_method);
}


#pragma mark - Action functions

- (void)yi_sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event {
    if ([self isKindOfClass:UIButton.class]) {
        if (self.userInteractionEnabled == YES) {
            self.userInteractionEnabled = NO;
            [self yi_sendAction:action to:target forEvent:event];
            [self performSelector:@selector(setUserInteractionEnabled:) withObject:@(YES) afterDelay:self.yi_eventInterval];
        }
    } else {
        [self yi_sendAction:action to:target forEvent:event];
    }
}


#pragma mark - Setter & Getter functions

- (NSTimeInterval)yi_eventInterval {
    
    return [objc_getAssociatedObject(self, yi_eventIntervalKey) doubleValue];
}

- (void)setYi_eventInterval:(NSTimeInterval)yi_eventInterval {
    
    objc_setAssociatedObject(self, yi_eventIntervalKey, @(yi_eventInterval), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)eventUnavailable {
    
    return [objc_getAssociatedObject(self, eventUnavailableKey) boolValue];
}

- (void)setEventUnavailable:(BOOL)eventUnavailable {
    
    objc_setAssociatedObject(self, eventUnavailableKey, @(eventUnavailable), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
