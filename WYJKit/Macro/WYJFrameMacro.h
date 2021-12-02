/*******************************************************************************
 Copyright (K), 2019 - ~, ╰莪呮想好好宠Nǐつ
 
 Author:        ╰莪呮想好好宠Nǐつ (Wang Yijing)
 E-mail:        1091676312@qq.com
 GitHub:        https://github.com/MemoryKing
 FileContent:   适配尺寸
 ********************************************************************************/

#ifndef WYJFrameMacro_h
#define WYJFrameMacro_h

#import "WYJUIManager.h"

#pragma mark - Screen Frame Macro
// 屏幕尺寸
#ifndef YJSCREEN_WIDTH
#define YJSCREEN_WIDTH               [UIScreen mainScreen].bounds.size.width
#endif
#ifndef YJSCREEN_HEIGHT
#define YJSCREEN_HEIGHT              [UIScreen mainScreen].bounds.size.height
#endif

//------ 屏幕适配 -------
//比例计算，根据设计稿修改
#ifndef Proportion
#define Proportion(wid)             YJSCREEN_WIDTH / wid
#endif
#ifndef YJProportion
#define YJProportion                 YJSCREEN_WIDTH / WYJUIManager.shared.width
#endif
#ifndef YJRatio
#define YJRatio(k)               k * YJProportion
#endif
#ifndef RatioSize
#define RatioSize(k,size)           k * Proportion(size)
#endif

//屏幕高度区别手机
#ifndef YJIPhone4
#define YJIPhone4    CGSizeEqualToSize([[UIScreen mainScreen] preferredMode].size, CGSizeMake(640, 960))
#endif
#ifndef YJIPhone5
#define YJIPhone5    CGSizeEqualToSize([[UIScreen mainScreen] preferredMode].size, CGSizeMake(640, 1136))
#endif
#ifndef YJIPhone6
#define YJIPhone6    CGSizeEqualToSize([[UIScreen mainScreen] preferredMode].size, CGSizeMake(750, 1334))
#endif
#ifndef YJIPhone6P
#define YJIPhone6P   CGSizeEqualToSize([[UIScreen mainScreen] preferredMode].size, CGSizeMake(1242, 2208)
#endif
#ifndef YJIPhoneX
#define YJIPhoneX                    (YJSCREEN_HEIGHT == 812)
#endif
//判断iphone6 放大模式(iphone7、iphone8) 放大模式下 [UIScreen mainScreen].nativeScale == 2.343750
#ifndef ISiPhone6_Magnify
#define ISiPhone6_Magnify           (ISiPhone5 && [UIScreen mainScreen].nativeScale > 2.3)
#endif
//判断iphone6+ 放大模式(iphone7+、iphone8+) 放大模式下 [UIScreen mainScreen].nativeScale == 2.880000
#ifndef ISiPhone6P_Magnify
#define ISiPhone6P_Magnify          ([UIScreen mainScreen].nativeScale > 2.8)
#endif
//导航栏高度
#ifndef YJNavBarHeight
#define YJNavBarHeight       (44.0)
#endif

//tabbar栏高度
#ifndef YJTabBarHeight
#define YJTabBarHeight       (49.0)
#endif
//底部安全区域
#ifndef YJBottomHeight
#define YJBottomHeight       ([[UIApplication sharedApplication] statusBarFrame].size.height>20.1?34.0:0.0)
#endif
//状态条占的高度
#ifndef YJStatusHeight
#define YJStatusHeight \
^(){\
if (@available(iOS 13.0, *)) {\
UIStatusBarManager *statusBarManager = [UIApplication sharedApplication].windows.firstObject.windowScene.statusBarManager;\
return statusBarManager.statusBarFrame.size.height;\
} else {\
return [UIApplication sharedApplication].statusBarFrame.size.height;\
}\
}()
#endif

//底部指示条
#ifndef INDICATOR_HEIGHT
#define INDICATOR_HEIGHT \
^(){\
if (@available(iOS 11.0, *)) {\
UIEdgeInsets safeAreaInsets = [[UIApplication sharedApplication] delegate].window.safeAreaInsets;\
return safeAreaInsets.bottom;\
} else {\
return UIEdgeInsetsMake(0, 0, 0, 0).bottom;\
}\
}()
#endif


/** 导航栏高度 + 状态栏高度 */
#ifndef YJStatusAndNavHeight
#define YJStatusAndNavHeight (YJNavBarHeight + YJStatusHeight)
#endif

/** tabbar高度 + iphoneX多出来的高度 */
#ifndef YJBottomAndTabBarHeight
#define YJBottomAndTabBarHeight (YJTabBarHeight + YJBottomHeight)
#endif


#endif /* WYJFrameMacro_h */
