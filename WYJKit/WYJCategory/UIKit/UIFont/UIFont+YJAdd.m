/*******************************************************************************
 Copyright (K), 2019 - ~, ╰莪呮想好好宠Nǐつ 
 
 Author:        ╰莪呮想好好宠Nǐつ (Wang Yijing)
 E-mail:        1091676312@qq.com
 GitHub:        https://github.com/MemoryKing
 ********************************************************************************/

#import "UIFont+YJAdd.h"
#import <objc/runtime.h>
//屏幕高度区别手机
#define WIP4 (HEIGHT == 480)
#define WIP5 (HEIGHT == 568)
#define WIP6 (HEIGHT == 667)
#define WIP6P (HEIGHT == 736)
#define WIPX (HEIGHT == 812)
#define WLessIp6 (WIP4 || WIP5)
#define HEIGHT                       [UIScreen mainScreen].bounds.size.height

#define SizeScale   ((WLessIp6) ? - 1.5 : (WIP6 || WIPX) ? 0 : 1.5)

@implementation UIFont (YJAdd)

- (BOOL)isBold {
    if (![self respondsToSelector:@selector(fontDescriptor)]) return NO;
    return (self.fontDescriptor.symbolicTraits & UIFontDescriptorTraitBold) > 0;
}

- (BOOL)isItalic {
    if (![self respondsToSelector:@selector(fontDescriptor)]) return NO;
    return (self.fontDescriptor.symbolicTraits & UIFontDescriptorTraitItalic) > 0;
}

- (BOOL)isMonoSpace {
    if (![self respondsToSelector:@selector(fontDescriptor)]) return NO;
    return (self.fontDescriptor.symbolicTraits & UIFontDescriptorTraitMonoSpace) > 0;
}

- (BOOL)isColorGlyphs {
    if (![self respondsToSelector:@selector(fontDescriptor)]) return NO;
    return (CTFontGetSymbolicTraits((__bridge CTFontRef)self) & kCTFontTraitColorGlyphs) != 0;
}

- (CGFloat)fontWeight {
    NSDictionary *traits = [self.fontDescriptor objectForKey:UIFontDescriptorTraitsAttribute];
    return [traits[UIFontWeightTrait] floatValue];
}

+ (UIFont *)fontAdapter:(CGFloat)font {
    return [UIFont systemFontOfSize:font + SizeScale];
}



@end
