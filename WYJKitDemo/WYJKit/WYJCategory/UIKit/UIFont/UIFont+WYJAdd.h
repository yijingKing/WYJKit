/*
  Created by 祎 on 2021
  Copyright © 2021年 祎. All rights reserved.
*/


#import <UIKit/UIKit.h>
#import <CoreGraphics/CoreGraphics.h>
#import <CoreText/CoreText.h>


#ifndef WYJSysFontWithSizes
#define WYJSysFontWithSizes(s)              [UIFont systemFontOfSize:(s)]
#endif
#ifndef WYJSysFontBoldWithSizes
#define WYJSysFontBoldWithSizes(s)          [UIFont boldSystemFontOfSize:(s)]
#endif
#ifndef WYJIconFontWithSizes
#define WYJIconFontWithSizes(s)             WYJIconFontNameAndSize(@"",s)
#endif
#ifndef WYJIconFontNameAndSizes
#define WYJIconFontNameAndSizes(name,s)     (name.length>0?[UIFont fontWithName:name size:(s)]:[UIFont fontWithName:@"iconfont" size:(s)])
#endif

#ifndef WYJFontNameAndSizes
#define WYJFontNameAndSizes(name,s)         [UIFont fontWithName:name size:(s)]
#endif
///PingFangSC-Regular
#ifndef PFRFontWithSizes
#define PFRFontWithSizes(s)                 ([UIFont fontWithName:@"PingFangSC-Regular" size:(s)])
#endif
///PingFangSC-Medium
#ifndef PFMFontWithSizes
#define PFMFontWithSizes(s)                 ([UIFont fontWithName:@"PingFangSC-Medium" size:(s)])
#endif
///PingFangSC-Thin
#ifndef PFTFontWithSizes
#define PFTFontWithSizes(s)                 ([UIFont fontWithName:@"PingFangSC-Thin" size:(s)])
#endif
///PingFangSC-Semibold
#ifndef PFSBFontWithSizes
#define PFSBFontWithSizes(s)                ([UIFont fontWithName:@"PingFangSC-Semibold" size:(s)])
#endif
///PingFangSC-Light
#ifndef PFLFontWithSizes
#define PFLFontWithSizes(s)                 ([UIFont fontWithName:@"PingFangSC-Light" size:(s)])
#endif
///PingFangSC
#ifndef PFSCFontWithSizes
#define PFSCFontWithSizes(s)                ([UIFont fontWithName:@"PingFangSC" size:(s)])
#endif

NS_ASSUME_NONNULL_BEGIN
@interface UIFont (WYJAdd)
/// Whether the font is bold.
@property (nonatomic, readonly) BOOL isBold NS_AVAILABLE_IOS(7_0);
/// Whether the font is italic.
@property (nonatomic, readonly) BOOL isItalic NS_AVAILABLE_IOS(7_0);
/// Whether the font is mono space.
@property (nonatomic, readonly) BOOL isMonoSpace NS_AVAILABLE_IOS(7_0);
/// Whether the font is color glyphs (such as Emoji).
@property (nonatomic, readonly) BOOL isColorGlyphs NS_AVAILABLE_IOS(7_0);
/// Font weight from -1.0 to 1.0. Regular weight is 0.0.
@property (nonatomic, readonly) CGFloat fontWeight NS_AVAILABLE_IOS(7_0);

/** font adaoter */
+ (UIFont *)fontAdapter:(CGFloat)font;
@end
NS_ASSUME_NONNULL_END

