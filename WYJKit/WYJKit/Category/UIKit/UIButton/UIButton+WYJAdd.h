/*
  Created by 祎 on 2021
  Copyright © 2021年 祎. All rights reserved.
*/


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
@property (nonatomic, assign) CGFloat yi_titleFont;
/** title font */
@property (nonatomic, assign) UIFont * yi_font;
/** title Alignement */
@property (nonatomic, assign) WYJTextAlignement yi_textAlignement;

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
- (void)yi_imagePosition:(WYJImagePosition)postitionStatus spacing:(CGFloat)spacing;

/// 文字渐变
/// @param hexColorString eg:#FFFFFF,#FFFFFF 或#FFFFFF
- (void)yi_setGradientTextColor:(NSString *)hexColorString;


@end


NS_ASSUME_NONNULL_END
