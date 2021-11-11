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
#ifndef kSCREEN_WIDTH
#define kSCREEN_WIDTH               [UIScreen mainScreen].bounds.size.width
#endif
#ifndef kSCREEN_WIDTH
#define kSCREEN_HEIGHT              [UIScreen mainScreen].bounds.size.height
#endif

//------ 屏幕适配 -------
//比例计算，根据设计稿修改
#ifndef Proportion
#define Proportion(wid)             kSCREEN_WIDTH / wid
#endif
#ifndef kProportion
#define kProportion                 kSCREEN_WIDTH / WYJUIManager.shared.width
#endif
#ifndef kRatioSize
#define kRatioSize(k)               k * kProportion
#endif
#ifndef RatioSize
#define RatioSize(k,size)           k * Proportion(size)
#endif

//屏幕高度区别手机
#ifndef kIPhone4
#define kIPhone4    CGSizeEqualToSize([[UIScreen mainScreen] preferredMode].size, CGSizeMake(640, 960))
#endif
#ifndef kIPhone5
#define kIPhone5    CGSizeEqualToSize([[UIScreen mainScreen] preferredMode].size, CGSizeMake(640, 1136))
#endif
#ifndef kIPhone6
#define kIPhone6    CGSizeEqualToSize([[UIScreen mainScreen] preferredMode].size, CGSizeMake(750, 1334))
#endif
#ifndef kIPhone6P
#define kIPhone6P   CGSizeEqualToSize([[UIScreen mainScreen] preferredMode].size, CGSizeMake(1242, 2208)
#endif
#ifndef kIPhoneX
#define kIPhoneX                    (kSCREEN_HEIGHT == 812)
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
#ifndef kNavBarHeight
#define kNavBarHeight       (44.0)
#endif

//tabbar栏高度
#ifndef kTabBarHeight
#define kTabBarHeight       (49.0)
#endif
//底部安全区域
#ifndef kBottomHeight
#define kBottomHeight       ([[UIApplication sharedApplication] statusBarFrame].size.height>20.1?34.0:0.0)
#endif
//状态条占的高度
#ifndef kStatusHeight
#define kStatusHeight \
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
#ifndef kStatusAndNavHeight
#define kStatusAndNavHeight (kNavBarHeight + kStatusHeight)
#endif

/** tabbar高度 + iphoneX多出来的高度 */
#ifndef kBottomAndTabBarHeight
#define kBottomAndTabBarHeight (kTabBarHeight + kBottomHeight)
#endif


#endif /* WYJFrameMacro_h */
