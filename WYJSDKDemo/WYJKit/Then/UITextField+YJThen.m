/*
 Created by 祎 on 2021
 Copyright © 2021年 祎. All rights reserved.
 */

#import "UITextField+YJThen.h"

@interface YJTextFieldMaker ()



@end

@implementation YJTextFieldMaker

- (instancetype)initWithTextField:(UITextField *)textField {
    if (self = [super initWithView:textField]) {
        _textField = textField;
        [self setupBlocks];
    }
    return self;
}

- (void)setupBlocks {
    [super setupBlocks];
    __weak typeof(self) weakSelf = self;
    
    _text = ^YJTextFieldMaker *(NSString *text) {
        weakSelf.textField.text = text;
        return weakSelf;
    };
    
    _font = ^YJTextFieldMaker *(UIFont *font) {
        weakSelf.textField.font = font;
        return weakSelf;
    };
    
    _textColor = ^YJTextFieldMaker *(UIColor *color) {
        weakSelf.textField.textColor = color;
        return weakSelf;
    };
    
    _placeholder = ^YJTextFieldMaker *(NSString *placeholder) {
        weakSelf.textField.placeholder = placeholder;
        return weakSelf;
    };
}

@end

@implementation UITextField (YJThen)

- (void)yi_configureWithMake:(void (^)(YJTextFieldMaker *make))block {
    if (block) {
        YJTextFieldMaker *maker = [[YJTextFieldMaker alloc] initWithTextField:self];
        block(maker);
    }
}
+ (UILabel *)yi_configureWithMake:(void (^)(YJTextFieldMaker *make))block {
    UITextField *tf = [UITextField new];
    if (block) {
        YJTextFieldMaker *maker = [[YJTextFieldMaker alloc] initWithTextField:tf];
        block(maker);
    }
    return tf;
}
@end
