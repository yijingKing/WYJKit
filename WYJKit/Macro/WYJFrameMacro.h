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
#define WSCREEN_WIDTH                        [UIScreen mainScreen].bounds.size.width
#define WSCREEN_HEIGHT                       [UIScreen mainScreen].bounds.size.height

//------ 屏幕适配 -------
//比例计算，根据设计稿修改
#define WRatioSize(w)     w * WSCREEN_WIDTH / 375.0
//屏幕高度区别手机
#define WIPhone4 (WSCREEN_HEIGHT == 480)
#define WIPhone5 (WSCREEN_HEIGHT == 568)
#define WIPhone6 (WSCREEN_HEIGHT == 667)
#define WIPhone6P (WSCREEN_HEIGHT == 736)
#define WIPhoneX (WSCREEN_HEIGHT == 812)
#define WLessIphone6 (WIPhone4 || WIPhone5)
//导航栏高度
#define WNavBarHeight (44.0)
//tabbar栏高度
#define WTabBarHeight (49.0)
//底部安全区域
#define WBottomSafeHeight ([[UIApplication sharedApplication] statusBarFrame].size.height>20.1?34.0:0.0)
//状态条占的高度
#define WStatusForHeight (CGRectGetMaxY([UIApplication sharedApplication].statusBarFrame))

/** 导航栏高度 + 状态栏高度 */
#define WStatusAndNavForHeight (WNavBarHeight + WStatusForHeight)

/** tabbar高度 + iphoneX多出来的高度 */
#define WBottomSafeAndTabBarForHeight (WTabBarHeight + WBottomSafeHeight)


#endif /* WFrameMacro_h */
