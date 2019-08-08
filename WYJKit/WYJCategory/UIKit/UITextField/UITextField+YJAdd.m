/*******************************************************************************
 Copyright (K), 2019 - ~, ╰莪呮想好好宠Nǐつ
 
 Author:        ╰莪呮想好好宠Nǐつ (Wang Yijing)
 E-mail:        1091676312@qq.com
 GitHub:        https://github.com/MemoryKing
 ********************************************************************************/


#import "UITextField+YJAdd.h"
#import <objc/runtime.h>
#import "NSString+YJAdd.h"

@implementation UITextField (YJAdd)


- (void)setPlaceholderColor:(UIColor *)placeholderColor {
    objc_setAssociatedObject(self, &@selector(placeholderColor), placeholderColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (@available(iOS 13.0, *)) {
        NSMutableAttributedString * att = [NSMutableAttributedString.alloc initWithString:self.placeholder attributes:@{NSForegroundColorAttributeName:placeholderColor}];
        self.attributedPlaceholder = att;
    } else {
        [self setValue:placeholderColor forKeyPath:@"_placeholderLabel.textColor"];
    }
}

- (UIColor *)placeholderColor {
    return objc_getAssociatedObject(self, &@selector(placeholderColor));
}

- (void)setAddNoti:(BOOL)addNoti {
    
    objc_setAssociatedObject(self, @selector(addNoti), [NSNumber numberWithBool:addNoti], OBJC_ASSOCIATION_ASSIGN);
}

- (BOOL)addNoti {
    
    BOOL obj = [objc_getAssociatedObject(self, _cmd) boolValue];
    return obj;
}

- (void)setMaximumLimit:(NSInteger)maximumLimit {
    objc_setAssociatedObject(self, @selector(maximumLimit), @(maximumLimit), OBJC_ASSOCIATION_ASSIGN);
    [self addTextChangeNoti];
}

- (NSInteger)maximumLimit {
    return [objc_getAssociatedObject(self, _cmd) integerValue];
}

- (void)setTextHandle:(void (^)(NSString *))textHandle {
    objc_setAssociatedObject(self, @selector(textHandle), textHandle, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void (^)(NSString *))textHandle {
    return objc_getAssociatedObject(self, @selector(textHandle));
}

- (void)setLastTextStr:(NSString *)lastTextStr {
    objc_setAssociatedObject(self, @selector(lastTextStr), lastTextStr, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSString *)lastTextStr {
    return [NSString wEmptyStr:objc_getAssociatedObject(self, _cmd)];
}

/**
 *  监听文字改变
 */
- (void)textDidChange {
    [self characterTruncation];
}

- (void)textDidChange:(void (^)(NSString *))handle {
    self.textHandle = handle;
    [self addTextChangeNoti];
}

- (void)fixMessyDisplay {
    if(self.maximumLimit <= 0) {self.maximumLimit = MAXFLOAT;}
    [self addTextChangeNoti];
}

- (void)addTextChangeNoti {
    if(self.addNoti == NO) {
        // 当UITextField的文字发生改变时，UITextField自己会发出一个UITextFieldTextDidChangeNotification通知
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textDidChange) name:UITextFieldTextDidChangeNotification object:nil];
    }
    self.addNoti = YES;
}

- (NSString *)characterTruncation {
    //字符截取
    if(self.maximumLimit) {
        
        UITextRange *selectedRange = [self markedTextRange];
        //获取高亮部分
        UITextPosition *position = [self positionFromPosition:selectedRange.start offset:0];
        //没有高亮选择的字，则对已输入的文字进行字数统计和限制,如果有高亮待选择的字，则暂不对文字进行统计和限制
        if ((position == nil) && (self.text.length > self.maximumLimit)) {
            const char *res = [self.text substringToIndex:self.maximumLimit].UTF8String;
            if (res == NULL) {
                self.text = [self.text substringToIndex:self.maximumLimit - 1];
            }else{
                self.text = [self.text substringToIndex:self.maximumLimit];
            }
        }
    }
    if((self.textHandle) && (![self.text isEqualToString:self.lastTextStr])) {
        
        self.textHandle(self.text);
    }
    self.lastTextStr = self.text;
    
    return self.text;
}

- (void)dealloc {
    if(self.addNoti == YES) {
        [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextFieldTextDidChangeNotification object:nil];
    }
}


@end
