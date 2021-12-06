//
//  UIControl+WYJBlock.m
//  WYJKitDemo
//
//  Created by 祎 on 2021/12/6.
//

#import "UIControl+WYJBlock.h"
#import <objc/runtime.h>

// UIControlEventTouchDown           = 1 <<  0,      // on all touch downs
// UIControlEventTouchDownRepeat     = 1 <<  1,      // on multiple touchdowns
// (tap count > 1)
// UIControlEventTouchDragInside     = 1 <<  2,
// UIControlEventTouchDragOutside    = 1 <<  3,
// UIControlEventTouchDragEnter      = 1 <<  4,
// UIControlEventTouchDragExit       = 1 <<  5,
// UIControlEventTouchUpInside       = 1 <<  6,
// UIControlEventTouchUpOutside      = 1 <<  7,
// UIControlEventTouchCancel         = 1 <<  8,
//
// UIControlEventValueChanged        = 1 << 12,     // sliders, etc.
//
// UIControlEventEditingDidBegin     = 1 << 16,     // UITextField
// UIControlEventEditingChanged      = 1 << 17,
// UIControlEventEditingDidEnd       = 1 << 18,
// UIControlEventEditingDidEndOnExit = 1 << 19,     // 'return key' ending
// editing
//
// UIControlEventAllTouchEvents      = 0x00000FFF,  // for touch events
// UIControlEventAllEditingEvents    = 0x000F0000,  // for UITextField
// UIControlEventApplicationReserved = 0x0F000000,  // range available for
// application use
// UIControlEventSystemReserved      = 0xF0000000,  // range reserved for
// internal framework use
// UIControlEventAllEvents           = 0xFFFFFFFF

#ifndef WYJUICONTROL_EVENT
#define WYJUICONTROL_EVENT(methodName, eventName)                                \
-(void)methodName : (void(^)(void))eventBlock {                              \
    objc_setAssociatedObject(self, @selector(methodName:), eventBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);\
    [self addTarget:self                                                        \
    action:@selector(methodName##Action:)                                       \
    forControlEvents:UIControlEvent##eventName];                                \
}                                                                               \
-(void)methodName##Action:(id)sender {                                        \
    void (^block)(void) = objc_getAssociatedObject(self, @selector(methodName:));  \
    if (block) {                                                                \
        block();                                                                \
    }                                                                           \
}
#endif

@interface UIControl ()

@end

@implementation UIControl (WYJBlock)

WYJUICONTROL_EVENT(touchDown, TouchDown)
WYJUICONTROL_EVENT(touchDownRepeat, TouchDownRepeat)
WYJUICONTROL_EVENT(touchDragInside, TouchDragInside)
WYJUICONTROL_EVENT(touchDragOutside, TouchDragOutside)
WYJUICONTROL_EVENT(touchDragEnter, TouchDragEnter)
WYJUICONTROL_EVENT(touchDragExit, TouchDragExit)
WYJUICONTROL_EVENT(touchUpInside, TouchUpInside)
WYJUICONTROL_EVENT(touchUpOutside, TouchUpOutside)
WYJUICONTROL_EVENT(touchCancel, TouchCancel)
WYJUICONTROL_EVENT(valueChanged, ValueChanged)
WYJUICONTROL_EVENT(editingDidBegin, EditingDidBegin)
WYJUICONTROL_EVENT(editingChanged, EditingChanged)
WYJUICONTROL_EVENT(editingDidEnd, EditingDidEnd)
WYJUICONTROL_EVENT(editingDidEndOnExit, EditingDidEndOnExit)

//- (void)touchUpInside:(void (^)(void))eventBlock {
//   objc_setAssociatedObject(self, @selector(touchUpInside:, eventBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
//  [self addTarget:self action:@selector(touchUpInsideAction:)
//  forControlEvents:UIControlEventTouchUpInside];
//}
//- (void)touchUpInsideAction:(id)sender {
//  void (^block)() = objc_getAssociatedObject(self, @selector(touchUpInsideAction:));
//  if (block) {
//    block();
//  }
//}


@end
