/*
  Created by King on 2021
  Copyright © 2021年 King. All rights reserved.
*/

#import "UITextView+WYJAdd.h"
#import "WYJKitHeader.h"
@implementation UITextView (WYJAdd)
- (void)setYi_promptFont:(UIFont *)promptFont {
    objc_setAssociatedObject(self, &@selector(yi_promptFont), promptFont, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIFont *)yi_promptFont {
    return objc_getAssociatedObject(self, &@selector(yi_promptFont));
}

- (void)setYi_addNoti:(BOOL)yi_addNoti {
    
    objc_setAssociatedObject(self, &@selector(yi_addNoti), [NSNumber numberWithBool:yi_addNoti], OBJC_ASSOCIATION_ASSIGN);
}

- (BOOL)yi_addNoti {
    
    BOOL obj = [objc_getAssociatedObject(self, &@selector(yi_addNoti)) boolValue];
    return obj;
}

- (void)setYi_placeholder:(NSString *)placeholder {
    
    objc_setAssociatedObject(self, &@selector(yi_placeholder), placeholder, OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    // setNeedsDisplay会在下一个消息循环时刻，调用drawRect:
    [self addTextChangeNoti];
    [self setNeedsDisplay];
}

- (NSString *)yi_placeholder {
    
    NSString *obj = objc_getAssociatedObject(self, &@selector(yi_placeholder));
    return obj;
}

- (void)setYi_placeholderColor:(UIColor *)placeholderColor {
    
    objc_setAssociatedObject(self, &@selector(yi_placeholderColor), placeholderColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    [self addTextChangeNoti];
}

- (UIColor *)yi_placeholderColor {
    
    UIColor *obj = objc_getAssociatedObject(self, &@selector(yi_placeholderColor));
    return obj;
}

- (void)setYi_maximumLimit:(NSInteger)maximumLimit{
    
    objc_setAssociatedObject(self, &@selector(yi_maximumLimit), [NSNumber numberWithInteger:maximumLimit], OBJC_ASSOCIATION_ASSIGN);
    
    //setNeedsDisplay会在下一个消息循环时刻，调用drawRect:
    [self addTextChangeNoti];
    [self setNeedsDisplay];
}

- (NSInteger)yi_maximumLimit {
    
    id obj = objc_getAssociatedObject(self, &@selector(yi_maximumLimit));
    return [obj integerValue];
}

- (void)setYi_characterLengthPrompt:(BOOL)characterLengthPrompt {
    
    objc_setAssociatedObject(self, &@selector(yi_characterLengthPrompt), [NSNumber numberWithBool:characterLengthPrompt], OBJC_ASSOCIATION_ASSIGN);
    
    //setNeedsDisplay会在下一个消息循环时刻，调用drawRect:
    [self addTextChangeNoti];
    [self setNeedsDisplay];
}

- (BOOL)yi_characterLengthPrompt {
    
    id obj = objc_getAssociatedObject(self, &@selector(yi_characterLengthPrompt));
    return [obj boolValue];
}

- (void)setTextHandle:(void (^)(NSString *))textHandle {
    
    objc_setAssociatedObject(self, &@selector(textHandle), textHandle, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void (^)(NSString *))textHandle {
    
    id handle = objc_getAssociatedObject(self, &@selector(textHandle));
    if (handle) {
        
        return (void(^)(NSString *textStr))handle;
    }
    return nil;
}

- (void)setYi_lastTextStr:(NSString *)lastTextStr {
    
    objc_setAssociatedObject(self, @selector(yi_lastTextStr), lastTextStr, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSString *)yi_lastTextStr {
    
    return [self emptyStr:objc_getAssociatedObject(self, _cmd)];
}

- (void)textDidChange:(void (^)(NSString *))handle {
    
    self.textHandle = handle;
    [self addTextChangeNoti];
}

- (void)fixMessyDisplay {
    
    if(self.yi_maximumLimit <= 0) {self.yi_maximumLimit = MAXFLOAT;}
    [self addTextChangeNoti];
}

/**
 *  监听文字改变
 */
- (void)textDidChange {
    //重绘
    [self characterTruncation];
    [self setNeedsDisplay];
}

- (void)textDidEnd {
    if (self.text.length == 0 || self.text == nil) {
        [self characterTruncation];
        [self setNeedsDisplay];
    }
}

- (void)drawRect:(CGRect)rect {
    
    NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
    CGFloat x = 5;
    CGFloat y = 8;
    CGFloat width = rect.size.width - 2 * x;
    if (!self.font) {
        self.font = [UIFont systemFontOfSize:16];
    }
    CGFloat textHeight = [self.yi_placeholder yi_heightWithFontConstrainedToWidth:rect.size.width font:self.yi_promptFont?:self.font];
    //画最大字符文本,添加文本显示边界
    if((self.yi_maximumLimit > 0) && (self.yi_characterLengthPrompt == YES)) {
        //设置文字属性
        attributes[NSFontAttributeName] = self.yi_promptFont ?: self.font;
        attributes[NSForegroundColorAttributeName] = self.yi_placeholderColor ? self.yi_placeholderColor : [UIColor lightGrayColor];
        
        [self setContentInset:UIEdgeInsetsMake(0, 0, textHeight, 0)];
        
        NSMutableParagraphStyle *paragraphStyle = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
        paragraphStyle.alignment = NSTextAlignmentRight;
        
        NSMutableDictionary *maximumLimitAttributes = [attributes mutableCopy];
        maximumLimitAttributes[NSParagraphStyleAttributeName] = paragraphStyle;
        
        NSString *limitStr = [NSString stringWithFormat:@"%lu/%ld",(unsigned long)self.text.length > (long)self.yi_maximumLimit ? (long)self.yi_maximumLimit : (unsigned long)self.text.length ,(long)self.yi_maximumLimit];
        
        [limitStr drawInRect:CGRectMake(x, rect.size.height - textHeight + self.contentOffset.y, width, textHeight) withAttributes:maximumLimitAttributes];
    }
    //如果不需要显示最大字符限制文本，则把边界置为默认
    else {
        //设置文字属性
        [self setContentInset:UIEdgeInsetsZero];
    }
    
    // 如果有输入文字，就直接返回，不画占位文字
    if (self.hasText) return;
    //画文字
    attributes[NSFontAttributeName] = self.font;
    attributes[NSForegroundColorAttributeName] = self.yi_placeholderColor ? self.yi_placeholderColor : [UIColor lightGrayColor];
    CGFloat height = rect.size.height - 2 * y;
    CGRect placeholderRect = CGRectMake(x, y, width, height);
    [self.yi_placeholder drawInRect:placeholderRect withAttributes:attributes];
}

- (void)characterTruncation {
    
    //字符截取
    if(self.yi_maximumLimit > 0) {
        
        UITextRange *selectedRange = [self markedTextRange];
        //获取高亮部分
        UITextPosition *position = [self positionFromPosition:selectedRange.start offset:0];
        //没有高亮选择的字，则对已输入的文字进行字数统计和限制,如果有高亮待选择的字，则暂不对文字进行统计和限制
        if ((position == nil) && (self.text.length > self.yi_maximumLimit)) {
            
            const char *res = [self.text substringToIndex:self.yi_maximumLimit].UTF8String;
            if (res == NULL) {
                self.text = [self.text substringToIndex:self.yi_maximumLimit - 1];
            }else{
                self.text = [self.text substringToIndex:self.yi_maximumLimit];
            }
        }
    }
    
    if((self.textHandle) && (![self.text isEqualToString:self.yi_lastTextStr])) {
        
        self.textHandle(self.text);
    }
    self.yi_lastTextStr = self.text;
}

- (void)addTextChangeNoti {
    
    if(self.yi_addNoti == NO) {
        
        // 当UITextView的文字发生改变时，UITextView自己会发出一个UITextViewTextDidChangeNotification通知
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textDidChange) name:UITextViewTextDidChangeNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textDidEnd) name:UITextViewTextDidEndEditingNotification object:nil];
    }
    self.yi_addNoti = YES;
}

- (void)dealloc {
    
    if(self.yi_addNoti == YES) {
        [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextViewTextDidEndEditingNotification object:nil];
        [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextViewTextDidChangeNotification object:nil];
    }
}

- (NSString *)emptyStr:(NSString *)str {
    
    if(([str isKindOfClass:[NSNull class]]) || ([str isEqual:[NSNull null]]) || (str == nil) || (!str)) {
        str = @"";
    }
    return str;
}
@end
