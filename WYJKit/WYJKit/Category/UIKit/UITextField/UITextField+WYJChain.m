//
//  UITextField+WYJChain.m
//  WYJKit
//
//  Created by 祎 on 2025/6/20.
//

#import "UITextField+WYJChain.h"

@implementation UITextField (WYJChain)
- (UITextField *(^)(NSString *))yi_textChain {
    return ^id(NSString *text) {
        self.text = text;
        return self;
    };
}

- (UITextField *(^)(NSString *))yi_placeholderChain {
    return ^id(NSString *placeholder) {
        self.placeholder = placeholder;
        return self;
    };
}

- (UITextField *(^)(UIColor *))yi_textColorChain {
    return ^id(UIColor *color) {
        self.textColor = color;
        return self;
    };
}

- (UITextField *(^)(UIFont *))yi_fontChain {
    return ^id(UIFont *font) {
        self.font = font;
        return self;
    };
}

- (UITextField *(^)(NSTextAlignment))yi_textAlignmentChain {
    return ^id(NSTextAlignment alignment) {
        self.textAlignment = alignment;
        return self;
    };
}

- (UITextField *(^)(UIKeyboardType))yi_keyboardTypeChain {
    return ^id(UIKeyboardType type) {
        self.keyboardType = type;
        return self;
    };
}

- (UITextField *(^)(BOOL))yi_secureTextEntryChain {
    return ^id(BOOL secure) {
        self.secureTextEntry = secure;
        return self;
    };
}

- (UITextField *(^)(UIColor *))yi_backgroundColorChain {
    return ^id(UIColor *color) {
        self.backgroundColor = color;
        return self;
    };
}

- (UITextField *(^)(BOOL))yi_enabledChain {
    return ^id(BOOL isEnabled) {
        self.enabled = isEnabled;
        return self;
    };
}
@end
