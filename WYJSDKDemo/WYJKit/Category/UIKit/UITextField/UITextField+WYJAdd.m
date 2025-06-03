/*
  Created by 祎 on 2021
  Copyright © 2021年 祎. All rights reserved.
*/

#import "UITextField+WYJAdd.h"
#import <objc/runtime.h>
#import "WYJKitHeader.h"

@implementation UITextField (WYJAdd)

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
    return objc_getAssociatedObject(self, _cmd);
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

/**
*  处理系统输入法导致的乱码,如果调用了maximumLimit属性，内部会默认处理乱码
*/
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
- (void)setLeftViewWithWidth:(double)width {
    [self setLeftViewWithIcon:nil width:width imageSize:CGSizeZero spacing:0];
}
- (void)setLeftViewWithTitle:(NSString *)title width:(double)width leading:(double)leading {
    UIView * leftView = [UIView new];
    leftView.frame = CGRectMake(0, 0, width, self.height);
    UIImageView * imageView;
    UILabel * label;
    if (title) {
        label = [UILabel yi_createWithText:title color:self.textColor font:self.font];
        if (self.textColor) {
            label.textColor = self.textColor;
        } else {
            label.textColor = WHexColor(0x212121);
        }
        label.frame = CGRectMake(leading, 0, width - leading, leftView.height);
        label.centerY = self.centerY;
        [leftView addSubview:label];
    }
    self.leftView = leftView;
    self.leftViewMode = UITextFieldViewModeAlways;
}
- (void)setLeftViewWithTitle:(NSString *)title icon:(nullable UIImage *)image  imageSize:(CGSize)imageSize spacing:(double)spacing {
    CGFloat titleWidth =  [title yi_widthWithFontConstrainedToHeight:self.height font:self.font] + 6;
    CGFloat width = spacing + imageSize.width + titleWidth + spacing;
    UIView * leftView = [UIView new];
    leftView.frame = CGRectMake(0, 0, width, self.height);
    UIImageView * imageView;
    UILabel * label;
    if (title) {
        label = [UILabel yi_createWithText:title color:self.textColor font:self.font];
        if (self.textColor) {
            label.textColor = self.textColor;
        } else {
            label.textColor = WHexColor(0x212121);
        }
        label.frame = CGRectMake(spacing, 0, titleWidth, leftView.height);
        label.centerY = self.centerY;
        [leftView addSubview:label];
    }
    if (image) {
        imageView = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(label.frame) + spacing / 2, 0, imageSize.width, imageSize.height)];
        imageView.centerY = self.centerY;
        imageView.image = image;
        [leftView addSubview:imageView];
    }
    self.leftView = leftView;
    self.leftViewMode = UITextFieldViewModeAlways;
}
- (void)setLeftViewWithIcon:(nullable UIImage *)image title:(NSString *)title imageSize:(CGSize)imageSize spacing:(double)spacing {
    CGFloat titleWidth =  [title yi_widthWithFontConstrainedToHeight:self.height font:self.font] + 6;
    CGFloat width = spacing + imageSize.width + titleWidth + spacing;
    UIView * leftView = [UIView new];
    leftView.frame = CGRectMake(0, 0, width, self.height);
    UIImageView * imageView;
    if (image) {
        imageView = [[UIImageView alloc] initWithFrame:CGRectMake(spacing, 0, imageSize.width, imageSize.height)];
        imageView.centerY = self.centerY;
        imageView.image = image;
        [leftView addSubview:imageView];
    }
    if (title) {
        UILabel * label = [UILabel yi_createWithText:title color:self.textColor font:self.font];
        label.backgroundColor = UIColor.redColor;
        label.frame = CGRectMake(spacing + imageSize.width + spacing / 2, 0, titleWidth, leftView.height);
        if (self.textColor) {
            label.textColor = WHexColor(0x212121);
        } else {
            label.textColor = WHexColor(0x212121);
        }
        [leftView addSubview:label];
    }
    self.leftView = leftView;
    self.leftViewMode = UITextFieldViewModeAlways;
}
- (void)setLeftViewWithIcon:(nullable UIImage *)image width:(double)width imageSize:(CGSize)imageSize spacing:(double)spacing {
    UIView * leftView = [UIView new];
    leftView.frame = CGRectMake(0, 0, width, self.height);
    if (image) {
        UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectMake(spacing, 0, imageSize.width, imageSize.height)];
        imageView.centerY = self.centerY;
        imageView.image = image;
        [leftView addSubview:imageView];
    }
    self.leftView = leftView;
    self.leftViewMode = UITextFieldViewModeAlways;
}
@end
