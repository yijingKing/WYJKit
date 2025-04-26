/*
 Created by 祎 on 2021
 Copyright © 2021年 祎. All rights reserved.
 */

#import "UIButton+YJThen.h"
#import <objc/runtime.h>
#import "UIButton+WYJAdd.h"

@implementation UIButton (YJThen)

- (void)yi_configureWithMake:(void (^)(YJButtonMaker *make))block {
    if (block) {
        YJButtonMaker *maker = [[YJButtonMaker alloc] initWithButton:self];
        block(maker);
    }
}

+ (UIButton *)yi_configureWithMake:(void (^)(YJButtonMaker *make))block {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    if (block) {
        YJButtonMaker *maker = [[YJButtonMaker alloc] initWithButton:button];
        block(maker);
    }
    return button;
}

@end

@interface YJButtonMaker ()

@property (nonatomic, weak) UIButton *button;

@end

@implementation YJButtonMaker

- (instancetype)initWithButton:(UIButton *)button {
    if (self = [super initWithView:button]) {
        _button = button;
        [self setupBlocks];
    }
    return self;
}

- (void)setupBlocks {
    [super setupBlocks];
    __weak typeof(self) weakSelf = self;
    
    _title = ^YJButtonMaker *(NSString *title, UIControlState state) {
        [weakSelf.button setTitle:title forState:state];
        return weakSelf;
    };
    _titleColor = ^YJButtonMaker *(UIColor *color, UIControlState state) {
        [weakSelf.button setTitleColor:color forState:state];
        return weakSelf;
    };
    _image = ^YJButtonMaker *(UIImage *image, UIControlState state) {
        [weakSelf.button setImage:image forState:state];
        return weakSelf;
    };
    _contentEdgeInsets = ^YJButtonMaker *(UIEdgeInsets insets) {
        weakSelf.button.contentEdgeInsets = insets;
        return weakSelf;
    };
    _font = ^YJButtonMaker *(UIFont *font) {
        weakSelf.button.titleLabel.font = font;
        return weakSelf;
    };
    
    _normalTitle = ^YJButtonMaker *(NSString *title) {
        [weakSelf.button setTitle:title forState:UIControlStateNormal];
        return weakSelf;
    };
    _selectedTitle = ^YJButtonMaker *(NSString *title) {
        [weakSelf.button setTitle:title forState:UIControlStateSelected];
        return weakSelf;
    };
    _normalFont = ^YJButtonMaker *(UIFont *font) {
        weakSelf.button.titleLabel.font = font;
        return weakSelf;
    };
    _selectedFont = ^YJButtonMaker *(UIFont *font) {
        // 不能直接设置不同状态字体，需要 runtime 或其他方法 workaround
        // 暂时作为同一字体设置，备注此限制
        weakSelf.button.titleLabel.font = font;
        return weakSelf;
    };
    _normalImage = ^YJButtonMaker *(UIImage *image) {
        [weakSelf.button setImage:image forState:UIControlStateNormal];
        return weakSelf;
    };
    _selectedImage = ^YJButtonMaker *(UIImage *image) {
        [weakSelf.button setImage:image forState:UIControlStateSelected];
        return weakSelf;
    };
    _normalBackgroundImage = ^YJButtonMaker *(UIImage *image) {
        [weakSelf.button setBackgroundImage:image forState:UIControlStateNormal];
        weakSelf.button.layer.masksToBounds = YES;
        return weakSelf;
    };
    _selectedBackgroundImage = ^YJButtonMaker *(UIImage *image) {
        [weakSelf.button setBackgroundImage:image forState:UIControlStateSelected];
        return weakSelf;
    };
    
    _addTarget = ^YJButtonMaker *(id target, SEL selector) {
        [weakSelf.button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
        return weakSelf;
    };
    
    _normalColor = ^YJButtonMaker *(UIColor *color) {
        [weakSelf.button setTitleColor:color forState:normal];
        return weakSelf;
    };
    _selectedColor = ^YJButtonMaker *(UIColor *color) {
        [weakSelf.button setTitleColor:color forState:(UIControlStateSelected)];
        return weakSelf;
    };
}

@end
