/*******************************************************************************
 Copyright (K), 2019 - ~, ╰莪呮想好好宠Nǐつ
 
 Author:        ╰莪呮想好好宠Nǐつ (Wang Yijing)
 E-mail:        1091676312@qq.com
 GitHub:        https://github.com/MemoryKing
 ********************************************************************************/

#import "UIView+WYJBlock.h"
#import <objc/runtime.h>

static char WYJActionHandlerTapBlockKey;
static char WYJActionHandlerTapGestureKey;
static char WYJActionHandlerLongPressBlockKey;
static char WYJActionHandlerLongPressGestureKey;
@implementation UIView (WYJBlock)

- (void)addTapActionWithBlock:(WYJGestureActionBlock)block {
    UITapGestureRecognizer *gesture = objc_getAssociatedObject(self, &WYJActionHandlerTapGestureKey);
    if (!gesture) {
        gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleActionForTapGesture:)];
        [self addGestureRecognizer:gesture];
        objc_setAssociatedObject(self, &WYJActionHandlerTapGestureKey, gesture, OBJC_ASSOCIATION_RETAIN);
    }
    objc_setAssociatedObject(self, &WYJActionHandlerTapBlockKey, block, OBJC_ASSOCIATION_COPY);
}
- (void)handleActionForTapGesture:(UITapGestureRecognizer*)gesture {
    if (gesture.state == UIGestureRecognizerStateRecognized) {
        WYJGestureActionBlock block = objc_getAssociatedObject(self, &WYJActionHandlerTapBlockKey);
        if (block) {
            block(gesture);
        }
    }
}

- (void)addLongPressActionWithBlock:(WYJGestureActionBlock)block {
    UILongPressGestureRecognizer *gesture = objc_getAssociatedObject(self, &WYJActionHandlerLongPressGestureKey);
    if (!gesture) {
        gesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleActionForLongPressGesture:)];
        [self addGestureRecognizer:gesture];
        objc_setAssociatedObject(self, &WYJActionHandlerLongPressGestureKey, gesture, OBJC_ASSOCIATION_RETAIN);
    }
    objc_setAssociatedObject(self, &WYJActionHandlerLongPressBlockKey, block, OBJC_ASSOCIATION_COPY);
}
- (void)handleActionForLongPressGesture:(UITapGestureRecognizer*)gesture {
    if (gesture.state == UIGestureRecognizerStateRecognized) {
        WYJGestureActionBlock block = objc_getAssociatedObject(self, &WYJActionHandlerLongPressBlockKey);
        if (block) {
            block(gesture);
        }
    }
}

@end
