/*
 Created by 祎 on 2021
 Copyright © 2021年 祎. All rights reserved.
 */


#import "UITextField+WYJBlocks.h"
#import <objc/runtime.h>
typedef BOOL (^WYJUITextFieldReturnBlock) (UITextField *textField);
typedef void (^WYJUITextFieldVoidBlock) (UITextField *textField);
typedef BOOL (^WYJUITextFieldCharacterChangeBlock) (UITextField *textField, NSRange range, NSString *replacementString);
@implementation UITextField (WYJBlocks)
static const void *WYJUITextFieldDelegateKey = &WYJUITextFieldDelegateKey;
static const void *WYJUITextFieldShouldBeginEditingKey = &WYJUITextFieldShouldBeginEditingKey;
static const void *WYJUITextFieldShouldEndEditingKey = &WYJUITextFieldShouldEndEditingKey;
static const void *WYJUITextFieldDidBeginEditingKey = &WYJUITextFieldDidBeginEditingKey;
static const void *WYJUITextFieldDidEndEditingKey = &WYJUITextFieldDidEndEditingKey;
static const void *WYJUITextFieldShouldChangeCharactersInRangeKey = &WYJUITextFieldShouldChangeCharactersInRangeKey;
static const void *WYJUITextFieldShouldClearKey = &WYJUITextFieldShouldClearKey;
static const void *WYJUITextFieldShouldReturnKey = &WYJUITextFieldShouldReturnKey;
#pragma mark UITextField Delegate methods
+ (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    WYJUITextFieldReturnBlock block = textField.yi_shouldBeginEditingBlock;
    if (block) {
        return block(textField);
    }
    id delegate = objc_getAssociatedObject(self, WYJUITextFieldDelegateKey);
    if ([delegate respondsToSelector:@selector(textFieldShouldBeginEditing:)]) {
        return [delegate textFieldShouldBeginEditing:textField];
    }
    // return default value just in case
    return YES;
}
+ (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    WYJUITextFieldReturnBlock block = textField.yi_shouldEndEditingBlock;
    if (block) {
        return block(textField);
    }
    id delegate = objc_getAssociatedObject(self, WYJUITextFieldDelegateKey);
    if ([delegate respondsToSelector:@selector(textFieldShouldEndEditing:)]) {
        return [delegate textFieldShouldEndEditing:textField];
    }
    // return default value just in case
    return YES;
}
+ (void)textFieldDidBeginEditing:(UITextField *)textField {
   WYJUITextFieldVoidBlock block = textField.yi_didBeginEditingBlock;
    if (block) {
        block(textField);
    }
    id delegate = objc_getAssociatedObject(self, WYJUITextFieldDelegateKey);
    if ([delegate respondsToSelector:@selector(textFieldDidBeginEditing:)]) {
        [delegate textFieldDidBeginEditing:textField];
    }
}
+ (void)textFieldDidEndEditing:(UITextField *)textField {
    WYJUITextFieldVoidBlock block = textField.yi_didEndEditingBlock;
    if (block) {
        block(textField);
    }
    id delegate = objc_getAssociatedObject(self, WYJUITextFieldDelegateKey);
    if ([delegate respondsToSelector:@selector(textFieldDidEndEditing:)]) {
        [delegate textFieldDidBeginEditing:textField];
    }
}
+ (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    WYJUITextFieldCharacterChangeBlock block = textField.yi_shouldChangeCharactersInRangeBlock;
    if (block) {
        return block(textField,range,string);
    }
    id delegate = objc_getAssociatedObject(self, WYJUITextFieldDelegateKey);
    if ([delegate respondsToSelector:@selector(textField:shouldChangeCharactersInRange:replacementString:)]) {
        return [delegate textField:textField shouldChangeCharactersInRange:range replacementString:string];
    }
    return YES;
}
+ (BOOL)textFieldShouldClear:(UITextField *)textField {
    WYJUITextFieldReturnBlock block = textField.yi_shouldClearBlock;
    if (block) {
        return block(textField);
    }
    id delegate = objc_getAssociatedObject(self, WYJUITextFieldDelegateKey);
    if ([delegate respondsToSelector:@selector(textFieldShouldClear:)]) {
        return [delegate textFieldShouldClear:textField];
    }
    return YES;
}
+ (BOOL)textFieldShouldReturn:(UITextField *)textField {
    WYJUITextFieldReturnBlock block = textField.yi_shouldReturnBlock;
    if (block) {
        return block(textField);
    }
    id delegate = objc_getAssociatedObject(self, WYJUITextFieldDelegateKey);
    if ([delegate respondsToSelector:@selector(textFieldShouldReturn:)]) {
        return [delegate textFieldShouldReturn:textField];
    }
    return YES;
}
#pragma mark Block setting/getting methods
- (BOOL (^)(UITextField *))yi_shouldBeginEditingBlock {
    return objc_getAssociatedObject(self, WYJUITextFieldShouldBeginEditingKey);
}
- (void)setYi_shouldBeginEditingBlock:(BOOL (^)(UITextField *))shouldBegindEditingBlock {
    [self yi_setDelegateIfNoDelegateSet];
    objc_setAssociatedObject(self, WYJUITextFieldShouldBeginEditingKey, shouldBegindEditingBlock, OBJC_ASSOCIATION_COPY);
}
- (BOOL (^)(UITextField *))yi_shouldEndEditingBlock {
    return objc_getAssociatedObject(self, WYJUITextFieldShouldEndEditingKey);
}
- (void)setYi_shouldEndEditingBlock:(BOOL (^)(UITextField *))shouldEndEditingBlock {
    [self yi_setDelegateIfNoDelegateSet];
    objc_setAssociatedObject(self, WYJUITextFieldShouldEndEditingKey, shouldEndEditingBlock, OBJC_ASSOCIATION_COPY);
}
- (void (^)(UITextField *))yi_didBeginEditingBlock {
    return objc_getAssociatedObject(self, WYJUITextFieldDidBeginEditingKey);
}
- (void)setYi_didBeginEditingBlock:(void (^)(UITextField *))didBeginEditingBlock {
    [self yi_setDelegateIfNoDelegateSet];
    objc_setAssociatedObject(self, WYJUITextFieldDidBeginEditingKey, didBeginEditingBlock, OBJC_ASSOCIATION_COPY);
}
- (void (^)(UITextField *))yi_didEndEditingBlock {
    return objc_getAssociatedObject(self, WYJUITextFieldDidEndEditingKey);
}
- (void)setYi_didEndEditingBlock:(void (^)(UITextField *))didEndEditingBlock {
    [self yi_setDelegateIfNoDelegateSet];
    objc_setAssociatedObject(self, WYJUITextFieldDidEndEditingKey, didEndEditingBlock, OBJC_ASSOCIATION_COPY);
}
- (BOOL (^)(UITextField *, NSRange, NSString *))yi_shouldChangeCharactersInRangeBlock {
    return objc_getAssociatedObject(self, WYJUITextFieldShouldChangeCharactersInRangeKey);
}
- (void)setYi_shouldChangeCharactersInRangeBlock:(BOOL (^)(UITextField *, NSRange, NSString *))shouldChangeCharactersInRangeBlock {
    [self yi_setDelegateIfNoDelegateSet];
    objc_setAssociatedObject(self, WYJUITextFieldShouldChangeCharactersInRangeKey, shouldChangeCharactersInRangeBlock, OBJC_ASSOCIATION_COPY);
}
- (BOOL (^)(UITextField *))yi_shouldReturnBlock {
    return objc_getAssociatedObject(self, WYJUITextFieldShouldReturnKey);
}
- (void)setYi_shouldReturnBlock:(BOOL (^)(UITextField *))shouldReturnBlock {
    [self yi_setDelegateIfNoDelegateSet];
    objc_setAssociatedObject(self, WYJUITextFieldShouldReturnKey, shouldReturnBlock, OBJC_ASSOCIATION_COPY);
}
- (BOOL (^)(UITextField *))yi_shouldClearBlock {
    return objc_getAssociatedObject(self, WYJUITextFieldShouldClearKey);
}
- (void)setYi_shouldClearBlock:(BOOL (^)(UITextField *textField))shouldClearBlock {
    [self yi_setDelegateIfNoDelegateSet];
    objc_setAssociatedObject(self, WYJUITextFieldShouldClearKey, shouldClearBlock, OBJC_ASSOCIATION_COPY);
}
#pragma mark control method
/*
 Setting itself as delegate if no other delegate has been set. This ensures the UITextField will use blocks if no delegate is set.
 */
- (void)yi_setDelegateIfNoDelegateSet {
    if (self.delegate != (id<UITextFieldDelegate>)[self class]) {
        objc_setAssociatedObject(self, WYJUITextFieldDelegateKey, self.delegate, OBJC_ASSOCIATION_ASSIGN);
        self.delegate = (id<UITextFieldDelegate>)[self class];
    }
}
@end
