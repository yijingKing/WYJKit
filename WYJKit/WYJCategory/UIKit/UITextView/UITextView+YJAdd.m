/*******************************************************************************
 Copyright (K), 2019 - ~, ╰莪呮想好好宠Nǐつ 
 
 Author:        ╰莪呮想好好宠Nǐつ (Wang Yijing)
 E-mail:        1091676312@qq.com
 GitHub:        https://github.com/MemoryKing
 ********************************************************************************/

#import "UITextView+YJAdd.h"
#import "NSString+YJAdd.h"

@implementation UITextView (YJAdd)

- (void)setPromptFont:(UIFont *)promptFont {
    objc_setAssociatedObject(self, &@selector(promptFont), promptFont, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIFont *)promptFont {
    return objc_getAssociatedObject(self, &@selector(promptFont));
}

- (void)setAddNoti:(BOOL)addNoti {
    
    objc_setAssociatedObject(self, &@selector(addNoti), [NSNumber numberWithBool:addNoti], OBJC_ASSOCIATION_ASSIGN);
}

- (BOOL)addNoti {
    
    BOOL obj = [objc_getAssociatedObject(self, &@selector(addNoti)) boolValue];
    return obj;
}

- (void)setPlaceholder:(NSString *)placeholder {
    
    objc_setAssociatedObject(self, &@selector(placeholder), placeholder, OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    // setNeedsDisplay会在下一个消息循环时刻，调用drawRect:
    [self addTextChangeNoti];
    [self setNeedsDisplay];
}

- (NSString *)placeholder {
    
    NSString *obj = objc_getAssociatedObject(self, &@selector(placeholder));
    return obj;
}

- (void)setPlaceholderColor:(UIColor *)placeholderColor {
    
    objc_setAssociatedObject(self, &@selector(placeholderColor), placeholderColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    [self addTextChangeNoti];
}

- (UIColor *)placeholderColor {
    
    UIColor *obj = objc_getAssociatedObject(self, &@selector(placeholderColor));
    return obj;
}

- (void)setMaximumLimit:(NSInteger)maximumLimit {
    
    objc_setAssociatedObject(self, &@selector(maximumLimit), [NSNumber numberWithInteger:maximumLimit], OBJC_ASSOCIATION_ASSIGN);
    
    //setNeedsDisplay会在下一个消息循环时刻，调用drawRect:
    [self addTextChangeNoti];
    [self setNeedsDisplay];
}

- (NSInteger)maximumLimit {
    
    id obj = objc_getAssociatedObject(self, &@selector(maximumLimit));
    return [obj integerValue];
}

- (void)setCharacterLengthPrompt:(BOOL)characterLengthPrompt {
    
    objc_setAssociatedObject(self, &@selector(characterLengthPrompt), [NSNumber numberWithBool:characterLengthPrompt], OBJC_ASSOCIATION_ASSIGN);
    
    //setNeedsDisplay会在下一个消息循环时刻，调用drawRect:
    [self addTextChangeNoti];
    [self setNeedsDisplay];
}

- (BOOL)characterLengthPrompt {
    
    id obj = objc_getAssociatedObject(self, &@selector(characterLengthPrompt));
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

- (void)setLastTextStr:(NSString *)lastTextStr {
    
    objc_setAssociatedObject(self, @selector(lastTextStr), lastTextStr, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSString *)lastTextStr {
    
    return [self wEmptyStr:objc_getAssociatedObject(self, _cmd)];
}

- (void)textDidChange:(void (^)(NSString *))handle {
    
    self.textHandle = handle;
    [self addTextChangeNoti];
}

- (void)fixMessyDisplay {
    
    if(self.maximumLimit <= 0) {self.maximumLimit = MAXFLOAT;}
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
    CGFloat textHeight = [self.placeholder wHeightWithFontConstrainedToWidth:rect.size.width font:self.promptFont?:self.font];
    //画最大字符文本,添加文本显示边界
    if((self.maximumLimit > 0) && (self.characterLengthPrompt == YES)) {
        //设置文字属性
        attributes[NSFontAttributeName] = self.promptFont ?: self.font;
        attributes[NSForegroundColorAttributeName] = self.placeholderColor ? self.placeholderColor : [UIColor lightGrayColor];
        
        [self setContentInset:UIEdgeInsetsMake(0, 0, textHeight, 0)];
        
        NSMutableParagraphStyle *paragraphStyle = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
        paragraphStyle.alignment = NSTextAlignmentRight;
        
        NSMutableDictionary *maximumLimitAttributes = [attributes mutableCopy];
        maximumLimitAttributes[NSParagraphStyleAttributeName] = paragraphStyle;
        
        NSString *limitStr = [NSString stringWithFormat:@"%lu/%ld",(unsigned long)self.text.length > (long)self.maximumLimit ? (long)self.maximumLimit : (unsigned long)self.text.length ,(long)self.maximumLimit];
        
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
    attributes[NSForegroundColorAttributeName] = self.placeholderColor ? self.placeholderColor : [UIColor lightGrayColor];
    CGFloat height = rect.size.height - 2 * y;
    CGRect placeholderRect = CGRectMake(x, y, width, height);
    [self.placeholder drawInRect:placeholderRect withAttributes:attributes];
}

- (void)characterTruncation {
    
    //字符截取
    if(self.maximumLimit > 0) {
        
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
}

- (void)addTextChangeNoti {
    
    if(self.addNoti == NO) {
        
        // 当UITextView的文字发生改变时，UITextView自己会发出一个UITextViewTextDidChangeNotification通知
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textDidChange) name:UITextViewTextDidChangeNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textDidEnd) name:UITextViewTextDidEndEditingNotification object:nil];
    }
    self.addNoti = YES;
}

- (void)dealloc {
    
    if(self.addNoti == YES) {
        [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextViewTextDidEndEditingNotification object:nil];
        [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextViewTextDidChangeNotification object:nil];
    }
}

- (NSString *)wEmptyStr:(NSString *)str {
    
    if(([str isKindOfClass:[NSNull class]]) || ([str isEqual:[NSNull null]]) || (str == nil) || (!str)) {
        str = @"";
    }
    return str;
}
@end
