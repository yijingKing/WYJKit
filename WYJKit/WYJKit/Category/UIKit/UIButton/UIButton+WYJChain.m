//
//  UIButton+Chain.m
//  WYJKit
//
//  Created by 祎 on 2025/6/17.
//

#import "UIButton+WYJChain.h"

@implementation UIButton (WYJChain)

- (UIButton *(^)(CGFloat))yi_titleFontChain {
    return ^id(CGFloat fontSize) {
        self.titleLabel.font = [UIFont systemFontOfSize:fontSize];
        return self;
    };
}

- (UIButton *(^)(UIFont *))yi_fontChain {
    return ^id(UIFont *font) {
        self.titleLabel.font = font;
        return self;
    };
}

- (UIButton *(^)(NSTextAlignment))yi_textAlignmentChain {
    return ^id(NSTextAlignment alignment) {
        self.titleLabel.textAlignment = alignment;
        return self;
    };
}

- (UIButton *(^)(NSString *))yi_titleTextChain {
    return ^id(NSString *title) {
        [self setTitle:title forState:UIControlStateNormal];
        return self;
    };
}

- (UIButton *(^)(UIColor *))yi_titleColorChain {
    return ^id(UIColor *color) {
        [self setTitleColor:color forState:UIControlStateNormal];
        return self;
    };
}

- (UIButton *(^)(UIImage *))yi_imageChain {
    return ^id(UIImage *image) {
        [self setImage:image forState:UIControlStateNormal];
        return self;
    };
}

- (UIButton *(^)(UIImage *))yi_backgroundImageChain {
    return ^id(UIImage *image) {
        [self setBackgroundImage:image forState:UIControlStateNormal];
        return self;
    };
}

- (UIButton *(^)(NSAttributedString *))yi_attributedTextChain {
    return ^id(NSAttributedString *attrText) {
        [self setAttributedTitle:attrText forState:UIControlStateNormal];
        return self;
    };
}

- (UIButton *(^)(NSString *))yi_selectTitleChain {
    return ^id(NSString *title) {
        [self setTitle:title forState:UIControlStateSelected];
        return self;
    };
}

- (UIButton *(^)(UIColor *))yi_selectTitleColorChain {
    return ^id(UIColor *color) {
        [self setTitleColor:color forState:UIControlStateSelected];
        return self;
    };
}

- (UIButton *(^)(UIImage *))yi_selectImageChain {
    return ^id(UIImage *image) {
        [self setImage:image forState:UIControlStateSelected];
        return self;
    };
}

- (UIButton *(^)(UIImage *))yi_selectBackgroundImageChain {
    return ^id(UIImage *image) {
        [self setBackgroundImage:image forState:UIControlStateSelected];
        return self;
    };
}

- (UIButton *(^)(NSAttributedString *))yi_selectAttributedTextChain {
    return ^id(NSAttributedString *attrText) {
        [self setAttributedTitle:attrText forState:UIControlStateSelected];
        return self;
    };
}
@end
