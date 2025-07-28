//
//  UIView+WYJChain.m
//  WYJKit
//
//  Created by 祎 on 2025/6/17.
//

#import "UIView+WYJChain.h"

@implementation UIView (WYJChain)

- (UIView *(^)(CGRect))yi_frameChain {
    return ^id(CGRect frame) {
        self.frame = frame;
        return self;
    };
}

- (UIView *(^)(UIColor *))yi_backgroundColorChain {
    return ^id(UIColor *color) {
        self.backgroundColor = color;
        return self;
    };
}

- (UIView *(^)(CGFloat))yi_cornerRadiusChain {
    return ^id(CGFloat radius) {
        self.layer.cornerRadius = radius;
        self.layer.masksToBounds = YES;
        return self;
    };
}

- (UIView *(^)(BOOL))yi_clipsToBoundsChain {
    return ^id(BOOL clips) {
        self.clipsToBounds = clips;
        return self;
    };
}

- (UIView *(^)(CGFloat))yi_borderWidthChain {
    return ^id(CGFloat width) {
        self.layer.borderWidth = width;
        return self;
    };
}

- (UIView *(^)(UIColor *))yi_borderColorChain {
    return ^id(UIColor *color) {
        self.layer.borderColor = color.CGColor;
        return self;
    };
}

- (UIView *(^)(BOOL))yi_hiddenChain {
    return ^id(BOOL hidden) {
        self.hidden = hidden;
        return self;
    };
}

- (UIView *(^)(BOOL))yi_userInteractionEnabledChain {
    return ^id(BOOL enabled) {
        self.userInteractionEnabled = enabled;
        return self;
    };
}

@end
