/*******************************************************************************
 Copyright (K), 2019 - ~, ╰莪呮想好好宠Nǐつ 
 
 Author:        ╰莪呮想好好宠Nǐつ (Wang Yijing)
 E-mail:        1091676312@qq.com
 GitHub:        https://github.com/MemoryKing
 ********************************************************************************/


#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef NS_ENUM(NSUInteger, WYJTextAlignement) {
    WYJTextAlignmentLeft,
    WYJTextAlignmentCenter,
    WYJTextAlignmentRight
};

typedef NS_ENUM(NSUInteger, WYJImagePosition) {
    WYJImagePositionLeft = 0,              //图片在左，文字在右，默认
    WYJImagePositionRight = 1,             //图片在右，文字在左
    WYJImagePositionTop = 2,               //图片在上，文字在下
    WYJImagePositionBottom = 3,            //图片在下，文字在上
};

@interface UIButton (WYJAdd)
/** title font */
@property (nonatomic, assign) CGFloat titleFont;
/** title font */
@property (nonatomic, assign) UIFont * font;
/** title Alignement */
@property (nonatomic, assign) WYJTextAlignement textAlignement;

/** title normal status */
@property (nonatomic, copy) NSString * titleText;
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
- (void)imagePosition:(WYJImagePosition)postitionStatus spacing:(CGFloat)spacing;
@end


NS_ASSUME_NONNULL_END
