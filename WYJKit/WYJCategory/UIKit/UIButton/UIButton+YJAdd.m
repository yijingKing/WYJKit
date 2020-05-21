/*******************************************************************************
 Copyright (K), 2019 - ~, ╰莪呮想好好宠Nǐつ
 
 Author:        ╰莪呮想好好宠Nǐつ (Wang Yijing)
 E-mail:        1091676312@qq.com
 GitHub:        https://github.com/MemoryKing
 ********************************************************************************/


#import "UIButton+YJAdd.h"
#import <objc/runtime.h>
#import "UIFont+YJAdd.h"
static const char TitleFontKey;
static const char TitleKey;
static const char TitleColorKey;
static const char SelectTitleKey;
static const char SelectTitleColorKey;
static const char BackgroundImageKey;
static const char SelectBackgroundImageKey;
static const char ImageKey;
static const char SelectImageKey;
static const char AttributedTextKey;
static const char SelectAttributedTextKey;
static const char TextAlignementKey;



@implementation UIButton (YJAdd)

- (void)yi_addTargetUpInside:(id)tat action:(SEL)sel {
    [self addTarget:tat action:sel forControlEvents:UIControlEventTouchUpInside];
}

- (void)yi_imagePosition:(WImagePosition)postitionStatus spacing:(CGFloat)spacing {
    CGFloat imageWith = self.imageView.image.size.width;
    CGFloat imageHeight = self.imageView.image.size.height;
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    CGFloat labelWidth = [self.titleLabel.text sizeWithFont:self.titleLabel.font].width;
    CGFloat labelHeight = [self.titleLabel.text sizeWithFont:self.titleLabel.font].height;
#pragma clang diagnostic pop
    
    CGFloat imageOffsetX = (imageWith + labelWidth) / 2 - imageWith / 2;//image中心移动的x距离
    CGFloat imageOffsetY = imageHeight / 2 - spacing;//image中心移动的y距离
    CGFloat labelOffsetX = (imageWith + labelWidth / 2) - (imageWith + labelWidth) / 2;//label中心移动的x距离
    CGFloat labelOffsetY = labelHeight / 2 + spacing * 2;//label中心移动的y距离
    
    switch (postitionStatus) {
        case WImagePositionLeft:
            self.imageEdgeInsets = UIEdgeInsetsMake(0, -spacing/2, 0, spacing/2);
            self.titleEdgeInsets = UIEdgeInsetsMake(0, spacing/2, 0, -spacing/2);
            self.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
            break;
            
        case WImagePositionRight:
            self.imageEdgeInsets = UIEdgeInsetsMake(0, labelWidth + spacing/2, 0, -(labelWidth + spacing/2));
            self.titleEdgeInsets = UIEdgeInsetsMake(0, -(imageHeight + spacing/2), 0, imageHeight + spacing/2);
            self.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
            break;
            
        case WImagePositionTop:
            self.imageEdgeInsets = UIEdgeInsetsMake(-imageOffsetY, imageOffsetX, imageOffsetY, -imageOffsetX);
            self.titleEdgeInsets = UIEdgeInsetsMake(labelOffsetY, -labelOffsetX, -labelOffsetY, labelOffsetX);
            self.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
            break;
            
        case WImagePositionBottom:
            self.imageEdgeInsets = UIEdgeInsetsMake(imageOffsetY, imageOffsetX, -imageOffsetY, -imageOffsetX);
            self.titleEdgeInsets = UIEdgeInsetsMake(-labelOffsetY, -labelOffsetX, labelOffsetY, labelOffsetX);
            self.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
            break;
            
        default:
            break;
    }
}

#pragma make ------ runtime ------
- (void)setYi_titleFont:(CGFloat)yi_titleFont {
    objc_setAssociatedObject(self, &TitleFontKey, @(yi_titleFont), OBJC_ASSOCIATION_ASSIGN);
    self.titleLabel.font = [UIFont yi_fontAdapter:yi_titleFont];
}

- (CGFloat)yi_titleFont {
    return [objc_getAssociatedObject(self, &TitleFontKey) floatValue];
}

- (void)setYi_titleText:(NSString *)yi_titleText {
    objc_setAssociatedObject(self, &TitleKey, yi_titleText, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self setTitle:yi_titleText forState:UIControlStateNormal];
}

- (NSString *)yi_titleText {
    return objc_getAssociatedObject(self, &TitleKey);
}

- (void)setYi_titleColor:(UIColor *)yi_titleColor {
    objc_setAssociatedObject(self, &TitleColorKey, yi_titleColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self setTitleColor:yi_titleColor forState:UIControlStateNormal];
}

- (UIColor *)yi_titleColor {
    return objc_getAssociatedObject(self, &TitleColorKey);
}

- (void)setYi_selectTitle:(NSString *)yi_selectTitle {
    objc_setAssociatedObject(self, &SelectTitleKey, yi_selectTitle, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self setTitle:yi_selectTitle forState:UIControlStateSelected];
}

- (NSString *)yi_selectTitle {
    return objc_getAssociatedObject(self, &SelectTitleKey);
}

- (void)setYi_selectTitleColor:(UIColor *)yi_selectTitleColor {
    objc_setAssociatedObject(self, &SelectTitleColorKey, yi_selectTitleColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self setTitleColor:yi_selectTitleColor forState:UIControlStateSelected];
}

- (UIColor *)yi_selectTitleColor {
    return objc_getAssociatedObject(self, &SelectTitleColorKey);
}

- (void)setYi_backgroundImage:(UIImage *)yi_backgroundImage{
    objc_setAssociatedObject(self, &BackgroundImageKey, yi_backgroundImage, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self setBackgroundImage:yi_backgroundImage forState:UIControlStateNormal];
}

- (UIImage *)yi_backgroundImage {
    return objc_getAssociatedObject(self, &BackgroundImageKey);
}

- (void)setYi_selectBackgroundImage:(UIImage *)yi_selectBackgroundImage {
    objc_setAssociatedObject(self, &SelectBackgroundImageKey, yi_selectBackgroundImage, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self setBackgroundImage:yi_selectBackgroundImage forState:UIControlStateSelected];
}

- (UIImage *)yi_selectBackgroundImage {
    return objc_getAssociatedObject(self, &SelectBackgroundImageKey);
}

- (void)setYi_image:(UIImage *)yi_image {
    objc_setAssociatedObject(self, &ImageKey, yi_image, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self setImage:yi_image forState:UIControlStateNormal];
}

- (UIImage *)yi_image {
    return objc_getAssociatedObject(self, &ImageKey);
}

- (void)setYi_selectImage:(UIImage *)yi_selectImage {
    objc_setAssociatedObject(self, &SelectImageKey, yi_selectImage, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self setImage:yi_selectImage forState:UIControlStateSelected];
}

- (UIImage *)yi_selectImage {
    return objc_getAssociatedObject(self, &SelectImageKey);
}

- (void)setYi_attributedText:(NSAttributedString *)yi_attributedText {
    objc_setAssociatedObject(self, &AttributedTextKey, yi_attributedText, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self setAttributedTitle:yi_attributedText forState:UIControlStateNormal];
}

- (NSAttributedString *)yi_attributedText {
    return objc_getAssociatedObject(self, &AttributedTextKey);
}

- (void)setYi_selectAttributedText:(NSAttributedString *)yi_selectAttributedText {
    objc_setAssociatedObject(self, &SelectAttributedTextKey, yi_selectAttributedText, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self setAttributedTitle:yi_selectAttributedText forState:UIControlStateSelected];
}

- (NSAttributedString *)yi_selectAttributedText {
    return objc_getAssociatedObject(self, &SelectAttributedTextKey);
}

- (void)setYi_textAlignement:(TextAlignement)yi_textAlignement {
    objc_setAssociatedObject(self, &TextAlignementKey, @(yi_textAlignement), OBJC_ASSOCIATION_ASSIGN);
    if (yi_textAlignement == TextAlignmentLeft) {
        self.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    } else if (yi_textAlignement == TextAlignmentCenter) {
        self.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    } else {
        self.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    }
}

- (TextAlignement)yi_textAlignement {
    return [objc_getAssociatedObject(self,&TextAlignementKey) integerValue];
}


@end
