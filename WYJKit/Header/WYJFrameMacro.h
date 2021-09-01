/*******************************************************************************
 Copyright (K), 2019 - ~, ╰莪呮想好好宠Nǐつ
 
 Author:        ╰莪呮想好好宠Nǐつ (Wang Yijing)
 E-mail:        1091676312@qq.com
 GitHub:        https://github.com/MemoryKing
 ********************************************************************************/

#ifndef WFrameMacro_h
#define WFrameMacro_h

#pragma mark - Screen Frame Macro

// 是否为iOS8.4
#define isNotVersion84                  ([[[UIDevice currentDevice] systemVersion] floatValue] > 8.4)

// 屏幕尺寸
#define kSCREEN_WIDTH                        [UIScreen mainScreen].bounds.size.width
#define kSCREEN_HEIGHT                       [UIScreen mainScreen].bounds.size.height

//------ 屏幕适配 -------
//比例计算，根据设计稿修改
#define kRatioSize(k)     k * kSCREEN_kIDTH / 375.0
//屏幕高度区别手机
#define kIPhone4 (kSCREEN_HEIGHT == 480)
#define kIPhone5 (kSCREEN_HEIGHT == 568)
#define kIPhone6 (kSCREEN_HEIGHT == 667)
#define kIPhone6P (kSCREEN_HEIGHT == 736)
#define kIPhoneX (kSCREEN_HEIGHT == 812)
#define kLessIphone6 (kIPhone4 || kIPhone5)
//导航栏高度
#define kNavBarHeight (44.0)
//tabbar栏高度
#define kTabBarHeight (49.0)
//底部安全区域
#define kBottomHeight ([[UIApplication sharedApplication] statusBarFrame].size.height>20.1?34.0:0.0)
//状态条占的高度
#define kStatusHeight \
^(){\
if (@available(iOS 13.0, *)) {\
    UIStatusBarManager *statusBarManager = [UIApplication sharedApplication].windows.firstObject.windowScene.statusBarManager;\
    return statusBarManager.statusBarFrame.size.height;\
} else {\
    return [UIApplication sharedApplication].statusBarFrame.size.height;\
}\
}()

//底部指示条
#define INDICATOR_HEIGHT \
^(){\
if (@available(iOS 11.0, *)) {\
    UIEdgeInsets safeAreaInsets = [[UIApplication sharedApplication] delegate].window.safeAreaInsets;\
    return safeAreaInsets.bottom;\
} else {\
    return UIEdgeInsetsMake(0, 0, 0, 0).bottom;\
}\
}()


/** 导航栏高度 + 状态栏高度 */
#define kStatusAndNavHeight (kNavBarHeight + kStatusHeight)

/** tabbar高度 + iphoneX多出来的高度 */
#define kBottomAndTabBarHeight (kTabBarHeight + kBottomHeight)


#endif /* kFrameMacro_h */
