/*******************************************************************************
 Copyright (K), 2019 - ~, ╰莪呮想好好宠Nǐつ 
 
 Author:        ╰莪呮想好好宠Nǐつ (Wang Yijing)
 E-mail:        1091676312@qq.com
 GitHub:        https://github.com/MemoryKing
 ********************************************************************************/


#import <UIKit/UIKit.h>
#import <CoreGraphics/CoreGraphics.h>
#import <CoreText/CoreText.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIFont (YJAdd)
///< Whether the font is bold.
@property (nonatomic, readonly) BOOL isBold NS_AVAILABLE_IOS(7_0);
///< Whether the font is italic.
@property (nonatomic, readonly) BOOL isItalic NS_AVAILABLE_IOS(7_0);
///< Whether the font is mono space.
@property (nonatomic, readonly) BOOL isMonoSpace NS_AVAILABLE_IOS(7_0);
///< Whether the font is color glyphs (such as Emoji).
@property (nonatomic, readonly) BOOL isColorGlyphs NS_AVAILABLE_IOS(7_0);
///< Font weight from -1.0 to 1.0. Regular weight is 0.0.
@property (nonatomic, readonly) CGFloat fontWeight NS_AVAILABLE_IOS(7_0);

/** font adaoter */
+ (UIFont *)fontAdapter:(CGFloat)font;

@end

NS_ASSUME_NONNULL_END
