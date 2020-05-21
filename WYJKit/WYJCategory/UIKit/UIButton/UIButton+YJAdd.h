/*******************************************************************************
 Copyright (K), 2019 - ~, ╰莪呮想好好宠Nǐつ 
 
 Author:        ╰莪呮想好好宠Nǐつ (Wang Yijing)
 E-mail:        1091676312@qq.com
 GitHub:        https://github.com/MemoryKing
 ********************************************************************************/


#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, TextAlignement) {
    TextAlignmentLeft,
    TextAlignmentCenter,
    TextAlignmentRight
};

typedef NS_ENUM(NSUInteger, WImagePosition) {
    WImagePositionLeft = 0,              //图片在左，文字在右，默认
    WImagePositionRight = 1,             //图片在右，文字在左
    WImagePositionTop = 2,               //图片在上，文字在下
    WImagePositionBottom = 3,            //图片在下，文字在上
};

@interface UIButton (YJAdd)
/** title font */
@property (nonatomic, assign) CGFloat yi_titleFont;
/** title Alignement */
@property (nonatomic, assign) TextAlignement yi_textAlignement;

/** title normal status */
@property (nonatomic, copy) NSString * yi_titleText;
/** title color normal status */
@property (nonatomic, strong) UIColor * yi_titleColor;
/** image normal status */
@property (nonatomic, strong) UIImage * yi_image;
/** background image normal status */
@property (nonatomic, strong) UIImage * yi_backgroundImage;
/** attributed normal status */
@property (nonatomic, copy) NSAttributedString * yi_attributedText;

/** title select status */
@property (nonatomic, copy) NSString * yi_selectTitle;
/** title color select status */
@property (nonatomic, strong) UIColor * yi_selectTitleColor;
/** image select status */
@property (nonatomic, strong) UIImage * yi_selectImage;
/** background image select status */
@property (nonatomic, strong) UIImage * yi_selectBackgroundImage;
/** attributed select status */
@property (nonatomic, copy) NSAttributedString * yi_selectAttributedText;

/** touch up inside */
- (void)yi_addTargetUpInside:(nullable id)tat action:(nonnull SEL)sel;

/** image and title position */
- (void)yi_imagePosition:(WImagePosition)postitionStatus spacing:(CGFloat)spacing;

@end

NS_ASSUME_NONNULL_END
