/*
 Created by 祎 on 2021
 Copyright © 2021年 祎. All rights reserved.
 */

#import "UILabel+YJThen.h"

#import "UILabel+WYJInit.h"

NS_ASSUME_NONNULL_BEGIN

@interface YJLabelMaker ()

@property (nonatomic, strong) UILabel *label;

@end

@implementation YJLabelMaker

- (instancetype)initWithLabel:(UILabel *)label {
    if (self = [super initWithView:label]) {
        _label = label;
        [self setupBlocks];
    }
    return self;
}

- (void)setupBlocks {
    [super setupBlocks];
    __weak typeof(self) weakSelf = self;
    
    _text = ^YJLabelMaker *(NSString *text) {
        weakSelf.label.text = text;
        return weakSelf;
    };
    _font = ^YJLabelMaker *(UIFont *font) {
        weakSelf.label.font = font;
        return weakSelf;
    };
    _textColor = ^YJLabelMaker *(UIColor *color) {
        weakSelf.label.textColor = color;
        return weakSelf;
    };
    _textAlignment = ^YJLabelMaker *(NSTextAlignment alignment) {
        weakSelf.label.textAlignment = alignment;
        return weakSelf;
    };
    _lineSpacing = ^YJLabelMaker *(CGFloat lineSpacing) {
        NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
        style.lineSpacing = lineSpacing;
        NSDictionary *attributes = @{NSParagraphStyleAttributeName: style};
        weakSelf.label.attributedText = [[NSAttributedString alloc] initWithString:weakSelf.label.text attributes:attributes];
        return weakSelf;
    };
    _numberOfLines = ^YJLabelMaker *(NSInteger numberOfLines) {
        weakSelf.label.numberOfLines = numberOfLines;
        return weakSelf;
    };
    _attributedText = ^YJLabelMaker *(NSAttributedString *attributedText) {
        weakSelf.label.attributedText = attributedText;
        return weakSelf;
    };
    _gradientTextColor = ^YJLabelMaker *(NSString * colors) {
        [weakSelf.label yi_setGradientTextColor:colors];
        return weakSelf;
    };
}

@end

@implementation UILabel (YJThen)

- (void)yi_configureWithMake:(void (^)(YJLabelMaker *make))block {
    if (block) {
        YJLabelMaker *maker = [[YJLabelMaker alloc] initWithLabel:self];
        block(maker);
    }
}

+ (UILabel *)yi_configureWithMake:(void (^)(YJLabelMaker *make))block {
    UILabel *label = [UILabel new];
    if (block) {
        YJLabelMaker *maker = [[YJLabelMaker alloc] initWithLabel:label];
        block(maker);
    }
    return label;
}

@end

NS_ASSUME_NONNULL_END
