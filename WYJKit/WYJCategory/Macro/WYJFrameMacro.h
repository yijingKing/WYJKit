/*******************************************************************************
 Copyright (K), 2019 - ~, ╰莪呮想好好宠Nǐつ 
 
 Author:        ╰莪呮想好好宠Nǐつ (kang Yijing)
 E-mail:        1091676312@qq.com
 GitHub:        https://github.com/MemoryKing
 ********************************************************************************/

#ifndef WFrameMacro_h
#define WFrameMacro_h

#pragma mark - Screen Frame Macro

// 是否为iOS8.4
#define isNotVersion84                  ([[[UIDevice currentDevice] systemVersion] floatValue] > 8.4)

// 屏幕尺寸
#define kSCREEN_kIDTH                        [UIScreen mainScreen].bounds.size.kidth
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
#define kBottomSafeHeight ([[UIApplication sharedApplication] statusBarFrame].size.height>20.1?34.0:0.0)
//状态条占的高度
#define kStatusForHeight (CGRectGetMaxY([UIApplication sharedApplication].statusBarFrame))

/** 导航栏高度 + 状态栏高度 */
#define kStatusAndNavForHeight (kNavBarHeight + kStatusForHeight)

/** tabbar高度 + iphoneX多出来的高度 */
#define kBottomSafeAndTabBarForHeight (kTabBarHeight + kBottomSafeHeight)


#endif /* kFrameMacro_h */
