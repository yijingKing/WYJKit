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
@property (nonatomic, assign) CGFloat titleFont;
/** title Alignement */
@property (nonatomic, assign) TextAlignement textAlignement;

/** title normal status */
@property (nonatomic, copy) NSString * title;
/** title color normal status */
@property (nonatomic, strong) UIColor * titleColor;
/** image normal status */
@property (nonatomic, strong) UIImage * image;
/** background image normal status */
@property (nonatomic, strong) UIImage * backgroundImage;
/** attributed normal status */
@property (nonatomic, copy) NSAttributedString * attributedText;

/** title select status */
@property (nonatomic, copy) NSString * selectTitle;
/** title color select status */
@property (nonatomic, strong) UIColor * selectTitleColor;
/** image select status */
@property (nonatomic, strong) UIImage * selectImage;
/** background image select status */
@property (nonatomic, strong) UIImage * selectBackgroundImage;
/** attributed select status */
@property (nonatomic, copy) NSAttributedString * selectAttributedText;

/** touch up inside */
- (void)addTargetUpInside:(nullable id)tat action:(nonnull SEL)sel;

/** image and title position */
- (void)imagePosition:(WImagePosition)postitionStatus spacing:(CGFloat)spacing;

@end

NS_ASSUME_NONNULL_END
