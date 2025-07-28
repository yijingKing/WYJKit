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



#pragma make ------ LeftView & RightView ------
/**
 *  仅文本，默认 spacing 为 0、padding 为 0、无 labelBlock
 */
- (void)yi_setupLeftViewWithText:(NSString *)text {
    [self yi_setupLeftViewWithImage:nil imageSize:CGSizeZero text:text width:0 spacing:0 containerPadding:UIEdgeInsetsZero labelBlock:nil];
}
- (void)yi_setupLeftViewWithText:(NSString *)text width:(CGFloat)width {
    [self yi_setupLeftViewWithImage:nil imageSize:CGSizeZero text:text width:width spacing:0 containerPadding:UIEdgeInsetsZero labelBlock:nil];
}
- (void)yi_setupLeftViewWithText:(NSString *)text width:(CGFloat)width labelBlock:(void (^)(UILabel *label))labelBlock{
    [self yi_setupLeftViewWithImage:nil imageSize:CGSizeZero text:text width:width spacing:0 containerPadding:UIEdgeInsetsZero labelBlock:labelBlock];
}
/**
 *  仅文本 + spacing + padding
 */
- (void)yi_setupLeftViewWithText:(NSString *)text width:(CGFloat)width containerPadding:(UIEdgeInsets)padding {
    [self yi_setupLeftViewWithImage:nil imageSize:CGSizeZero text:text width:width spacing:0 containerPadding:padding labelBlock:nil];
}
/**
 *  仅文本 + spacing + padding + labelBlock
 */
- (void)yi_setupLeftViewWithText:(NSString *)text width:(CGFloat)width containerPadding:(UIEdgeInsets)padding labelBlock:(void (^)(UILabel *label))labelBlock {
    [self yi_setupLeftViewWithImage:nil imageSize:CGSizeZero text:text width:width spacing:0 containerPadding:padding labelBlock:labelBlock];
}
/**
 *  仅文本 + spacing + labelBlock
 */
- (void)yi_setupLeftViewWithText:(NSString *)text spacing:(CGFloat)spacing labelBlock:(void (^)(UILabel *label))labelBlock {
    [self yi_setupLeftViewWithImage:nil imageSize:CGSizeZero text:text width:0 spacing:spacing containerPadding:UIEdgeInsetsZero labelBlock:labelBlock];
}

- (void)yi_setupLeftViewWithImage:(UIImage *)image imageSize:(CGSize)imageSize {
    [self yi_setupLeftViewWithImage:image imageSize:imageSize text:nil width:0 spacing:0 containerPadding:UIEdgeInsetsZero labelBlock:nil];
}
- (void)yi_setupLeftViewWithImage:(UIImage *)image imageSize:(CGSize)imageSize width:(CGFloat)width {
    [self yi_setupLeftViewWithImage:image imageSize:imageSize text:nil width:width spacing:0 containerPadding:UIEdgeInsetsZero labelBlock:nil];
}
- (void)yi_setupLeftViewWithImage:(UIImage *)image imageSize:(CGSize)imageSize containerPadding:(UIEdgeInsets)padding {
    [self yi_setupLeftViewWithImage:image imageSize:imageSize text:nil width:0 spacing:0 containerPadding:padding labelBlock:nil];
}

- (void)yi_setupLeftViewWithImage:(UIImage *)image imageSize:(CGSize)imageSize text:(NSString *)text {
    [self yi_setupLeftViewWithImage:image imageSize:imageSize text:text width:0 spacing:0 containerPadding:UIEdgeInsetsZero labelBlock:nil];
}

- (void)yi_setupLeftViewWithImage:(UIImage *)image imageSize:(CGSize)imageSize text:(NSString *)text spacing:(CGFloat)spacing {
    [self yi_setupLeftViewWithImage:image imageSize:imageSize text:text width:0 spacing:spacing containerPadding:UIEdgeInsetsZero labelBlock:nil];
}

- (void)yi_setupLeftViewWithImage:(UIImage *)image imageSize:(CGSize)imageSize text:(NSString *)text spacing:(CGFloat)spacing containerPadding:(UIEdgeInsets)padding {
    [self yi_setupLeftViewWithImage:image imageSize:imageSize text:text width:0 spacing:spacing containerPadding:padding labelBlock:nil];
}

- (void)yi_setupLeftViewWithImage:(UIImage *)image imageSize:(CGSize)imageSize text:(NSString *)text spacing:(CGFloat)spacing containerPadding:(UIEdgeInsets)padding labelBlock:(void (^)(UILabel *label))labelBlock {
    [self yi_setupLeftViewWithImage:image imageSize:imageSize text:text width:0 spacing:spacing containerPadding:padding labelBlock:labelBlock];
}


- (void)yi_setupLeftViewWithImage:(UIImage *)image
                     imageSize:(CGSize)imageSize
                          text:(NSString *)text
                         width:(double)width
                      spacing:(CGFloat)spacing
             containerPadding:(UIEdgeInsets)containerPadding
                   labelBlock:(void (^)(UILabel *label))labelBlock{
    UIView *container = [[UIView alloc] init];

    UIImageView *imageView = nil;
    UILabel *label = nil;

    CGFloat x = 0;
    CGFloat height = 0;

    if (image) {
        imageView = [[UIImageView alloc] initWithImage:image];
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        imageView.frame = CGRectMake(containerPadding.left + x, 0 + containerPadding.top, imageSize.width, imageSize.height);
        [container addSubview:imageView];
        x += imageSize.width;
        height = MAX(height, imageSize.height);
    }

    if (text.length > 0) {
        label = [[UILabel alloc] init];
        label.text = text;
        label.font = self.font;
        label.textColor = self.textColor;
        [label sizeToFit];

        if (image) {
            x += spacing;
        }

        label.frame = CGRectMake(containerPadding.left + x, 0 + containerPadding.top, label.frame.size.width, label.frame.size.height);
        [container addSubview:label];
        x += label.frame.size.width;
        height = MAX(height, label.frame.size.height);
    }
    if (width > 0) {
        x = width;
    }
    container.frame = CGRectMake(0, 0, x + containerPadding.left + containerPadding.right, height  + containerPadding.top + containerPadding.bottom);
    !labelBlock?:labelBlock(label);
    self.leftView = container;
    self.leftViewMode = UITextFieldViewModeAlways;
}

/**
 *  设置TextField的右视图，仅包含文本
 *
 *  @param text 右视图显示的文本
 */
- (void)yi_setupRightViewWithText:(NSString *)text {
    [self yi_setupRightViewWithImage:nil imageSize:CGSizeZero text:text width:0 spacing:0 labelBlock:nil];
}

/**
 *  设置TextField的右视图，仅包含文本，并指定宽度
 *
 *  @param text 右视图显示的文本
 *  @param width 右视图的宽度
 */
- (void)yi_setupRightViewWithText:(NSString *)text width:(double)width {
    [self yi_setupRightViewWithImage:nil imageSize:CGSizeZero text:text width:width spacing:0 labelBlock:nil];
}

/**
 *  设置TextField的右视图，仅包含文本，并指定文本与其他元素的间距
 *
 *  @param text 右视图显示的文本
 *  @param spacing 文本与其他元素的间距
 */
- (void)yi_setupRightViewWithText:(NSString *)text spacing:(CGFloat)spacing {
    [self yi_setupRightViewWithImage:nil imageSize:CGSizeZero text:text width:0 spacing:spacing labelBlock:nil];
}

/**
 *  设置TextField的右视图，仅包含文本，并指定宽度和间距
 *
 *  @param text 右视图显示的文本
 *  @param width 右视图的宽度
 *  @param spacing 文本与其他元素的间距
 */
- (void)yi_setupRightViewWithText:(NSString *)text width:(double)width spacing:(CGFloat)spacing {
    [self yi_setupRightViewWithImage:nil imageSize:CGSizeZero text:text width:width spacing:spacing labelBlock:nil];
}

/**
 *  设置TextField的右视图，仅包含文本，并提供一个用于自定义标签的block
 *
 *  @param text 右视图显示的文本
 *  @param labelBlock 用于自定义标签的block
 */
- (void)yi_setupRightViewWithText:(NSString *)text labelBlock:(void (^)(UILabel *label))labelBlock {
    [self yi_setupRightViewWithImage:nil imageSize:CGSizeZero text:text width:0 spacing:0 labelBlock:labelBlock];
}

/**
 *  设置TextField的右视图，仅包含文本，指定宽度并提供一个用于自定义标签的block
 *
 *  @param text 右视图显示的文本
 *  @param width 右视图的宽度
 *  @param labelBlock 用于自定义标签的block
 */
- (void)yi_setupRightViewWithText:(NSString *)text width:(double)width labelBlock:(void (^)(UILabel *label))labelBlock {
    [self yi_setupRightViewWithImage:nil imageSize:CGSizeZero text:text width:width spacing:0 labelBlock:labelBlock];
}

/**
 *  设置TextField的右视图，仅包含文本，指定间距并提供一个用于自定义标签的block
 *
 *  @param text 右视图显示的文本
 *  @param spacing 文本与其他元素的间距
 *  @param labelBlock 用于自定义标签的block
 */
- (void)yi_setupRightViewWithText:(NSString *)text spacing:(CGFloat)spacing labelBlock:(void (^)(UILabel *label))labelBlock {
    [self yi_setupRightViewWithImage:nil imageSize:CGSizeZero text:text width:0 spacing:spacing labelBlock:labelBlock];
}

/**
 *  设置TextField的右视图，仅包含文本，指定宽度和间距并提供一个用于自定义标签的block
 *
 *  @param text 右视图显示的文本
 *  @param width 右视图的宽度
 *  @param spacing 文本与其他元素的间距
 *  @param labelBlock 用于自定义标签的block
 */
- (void)yi_setupRightViewWithText:(NSString *)text width:(double)width spacing:(CGFloat)spacing labelBlock:(void (^)(UILabel *label))labelBlock {
    [self yi_setupRightViewWithImage:nil imageSize:CGSizeZero text:text width:width spacing:spacing labelBlock:labelBlock];
}

/**
 *  设置TextField的右视图，仅包含图片
 *
 *  @param image 右视图显示的图片
 *  @param imageSize 图片的大小
 */
- (void)yi_setupRightViewWithImage:(UIImage *)image imageSize:(CGSize)imageSize {
    [self yi_setupRightViewWithImage:image imageSize:imageSize text:nil width:0 spacing:0 labelBlock:nil];
}

/**
 *  设置TextField的右视图，仅包含图片，并指定宽度
 *
 *  @param image 右视图显示的图片
 *  @param imageSize 图片的大小
 *  @param width 右视图的宽度
 */
- (void)yi_setupRightViewWithImage:(UIImage *)image imageSize:(CGSize)imageSize width:(double)width {
    [self yi_setupRightViewWithImage:image imageSize:imageSize text:nil width:width spacing:0 labelBlock:nil];
}

/**
 *  设置TextField的右视图，仅包含图片，并指定图片与其他元素的间距
 *
 *  @param image 右视图显示的图片
 *  @param imageSize 图片的大小
 *  @param spacing 图片与其他元素的间距
 */
- (void)yi_setupRightViewWithImage:(UIImage *)image imageSize:(CGSize)imageSize  spacing:(CGFloat)spacing {
    [self yi_setupRightViewWithImage:image imageSize:imageSize text:nil width:0 spacing:spacing labelBlock:nil];
}

/**
 *  设置TextField的右视图，仅包含图片，并指定宽度和间距
 *
 *  @param image 右视图显示的图片
 *  @param imageSize 图片的大小
 *  @param width 右视图的宽度
 *  @param spacing 图片与其他元素的间距
 */
- (void)yi_setupRightViewWithImage:(UIImage *)image imageSize:(CGSize)imageSize width:(double)width spacing:(CGFloat)spacing {
    [self yi_setupRightViewWithImage:image imageSize:imageSize text:nil width:width spacing:spacing labelBlock:nil];
}


- (void)yi_setupRightViewWithImage:(UIImage *)image
                     imageSize:(CGSize)imageSize
                          text:(NSString *)text
                         width:(double)width
                       spacing:(CGFloat)spacing labelBlock:(void (^)(UILabel *label))labelBlock{

    UIView *container = [[UIView alloc] init];

    UIImageView *imageView = nil;
    UILabel *label = nil;

    CGFloat x = 0;
    CGFloat height = 0;

    if (image) {
        imageView = [[UIImageView alloc] initWithImage:image];
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        imageView.frame = CGRectMake(x, 0, imageSize.width, imageSize.height);
        [container addSubview:imageView];
        x += imageSize.width;
        height = MAX(height, imageSize.height);
    }

    if (text.length > 0) {
        label = [[UILabel alloc] init];
        label.text = text;
        label.font = self.font;
        label.textColor = self.textColor;
        [label sizeToFit];

        if (image) {
            x += spacing;
        }

        label.frame = CGRectMake(x, 0, label.frame.size.width, label.frame.size.height);
        [container addSubview:label];
        x += label.frame.size.width;
        height = MAX(height, label.frame.size.height);
    }
    if (width > 0) {
        x = width;
    }
    container.frame = CGRectMake(0, 0, x, height);
    !labelBlock?:labelBlock(label);
    self.rightView = container;
    self.rightViewMode = UITextFieldViewModeAlways;
}

/**
 *  新增一个自定义rightView, 可以外部直接通过block设置
 *
 *  @param yi_setupBlock 用于设置rightView的block，传入rightView的父容器
 */
- (void)yi_setupCustomRightViewWithBlock:(void (^)(UIView *containerView))setupBlock {
    if (!setupBlock) {
        return;
    }
    UIView *container = [[UIView alloc] init];
    setupBlock(container);
    self.rightView = container;
    self.rightViewMode = UITextFieldViewModeAlways;
}
/**
 *  新增一个自定义leftView, 可以外部直接通过block设置
 *
 *  @param yi_setupBlock 用于设置rightView的block，传入leftView的父容器
 */
- (void)yi_setupCustomLeftViewWithBlock:(void (^)(UIView *containerView))setupBlock {
    if (!setupBlock) {
        return;
    }
    UIView *container = [[UIView alloc] init];
    setupBlock(container);
    self.leftView = container;
    self.leftViewMode = UITextFieldViewModeAlways;
}



@end
