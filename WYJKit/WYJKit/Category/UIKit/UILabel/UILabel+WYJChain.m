//
//  UILabel+WYJChain.m
//  WYJKit
//
//  Created by 祎 on 2025/6/17.
//

#import "UILabel+WYJChain.h"

@implementation UILabel (WYJChain)

- (UILabel *(^)(NSString *))yi_textChain {
    return ^id(NSString *text) {
        self.text = text;
        return self;
    };
}

- (UILabel *(^)(UIColor *))yi_textColorChain {
    return ^id(UIColor *color) {
        self.textColor = color;
        return self;
    };
}

- (UILabel *(^)(UIFont *))yi_fontChain {
    return ^id(UIFont *font) {
        self.font = font;
        return self;
    };
}

- (UILabel *(^)(NSTextAlignment))yi_textAlignmentChain {
    return ^id(NSTextAlignment alignment) {
        self.textAlignment = alignment;
        return self;
    };
}

- (UILabel *(^)(NSInteger))yi_numberOfLinesChain {
    return ^id(NSInteger lines) {
        self.numberOfLines = lines;
        return self;
    };
}

- (UILabel *(^)(NSAttributedString *))yi_attributedTextChain {
    return ^id(NSAttributedString *attr) {
        self.attributedText = attr;
        return self;
    };
}


@end
