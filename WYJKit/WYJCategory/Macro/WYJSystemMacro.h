/*******************************************************************************
 Copyright (K), 2019 - ~, ╰莪呮想好好宠Nǐつ 
 
 Author:        ╰莪呮想好好宠Nǐつ (Wang Yijing)
 E-mail:        1091676312@qq.com
 GitHub:        https://github.com/MemoryKing
 ********************************************************************************/

#ifndef WYJSystemMacro_h
#define WYJSystemMacro_h

// 系统版本
// iPhone5 iPhone5s iPhoneSE
#define IS_iPhone_55sSE ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)

// iPhone6 7 8
#define IS_iPhone_6789 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? (CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) || CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size)) : NO)

// iPhone6plus  iPhone7plus iPhone8plus
#define IS_iPhone678_Plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? (CGSizeEqualToSize(CGSizeMake(1125, 2001), [[UIScreen mainScreen] currentMode].size) || CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size)) : NO)

// iPhoneX
#define IS_iPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)

#pragma mark ---- iOS 版本 定义 --------
//操作系统版本
#define WSYSTEMVERSION   [UIDevice currentDevice].systemVersion

//大于多少版本
#define iOS7OrLater ([WSYSTEMVERSION floatValue] >= 7.0)
#define iOS8OrLater ([WSYSTEMVERSION floatValue] >= 8.0)
#define iOS9OrLater ([WSYSTEMVERSION floatValue] >= 9.0)
#define iOS10OrLater ([WSYSTEMVERSION floatValue] >= 10.0)
#define iOS11OrLater ([WSYSTEMVERSION floatValue] >= 11.0)
#define iOS12OrLater ([WSYSTEMVERSION floatValue] >= 12.0)

//和上面一样
#define WSYSTEM_VERSION_EQUAL_TO(v)                  ([WSYSTEMVERSION compare:v options:NSNumericSearch] == NSOrderedSame)
#define WSYSTEM_VERSION_GREATER_THAN(v)              ([WSYSTEMVERSION compare:v options:NSNumericSearch] == NSOrderedDescending)
#define WSYSTEM_VERSION_GREATER_THAN_OR_EQUAL(v)  ([WSYSTEMVERSION compare:v options:NSNumericSearch] != NSOrderedAscending)
#define WSYSTEM_VERSION_LESS_THAN(v)                 ([WSYSTEMVERSION compare:v options:NSNumericSearch] == NSOrderedAscending)
#define WSYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([WSYSTEMVERSION compare:v options:NSNumericSearch] != NSOrderedDescending)

//  iOS 支持
#define WSUPPORT_IPHONE_OS_VERSION(version) ( __IPHONE_OS_VERSION_MIN_REQUIRED <= version && __IPHONE_OS_VERSION_MAX_ALLOWED >= version)

// 设置Debug模式下打印log,release模式下不打印
#ifdef DEBUG
#	define NSLog(format, ...)   NSLog((@"[DEBUG] %s [第%d行] " format), __PRETTY_FUNCTION__,__LINE__, ##__VA_ARGS__);
#else
#   define NSLog(...)
#	define NSLog(...)
#endif

//获取temp
#define WPathTemp NSTemporaryDirectory()

//获取沙盒 Document
#define WPathDocument [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject]

//获取沙盒 Cache
#define WPathCache [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject]



#endif /* WYJSystemMacro_h */
