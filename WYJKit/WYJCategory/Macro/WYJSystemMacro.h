/*******************************************************************************
 Copyright (K), 2019 - ~, ╰莪呮想好好宠Nǐつ 
 
 Author:        ╰莪呮想好好宠Nǐつ (kang Yijing)
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
#define kSYSTEMVERSION   [UIDevice currentDevice].systemVersion

//大于多少版本
#define iOS7OrLater ([kSYSTEMVERSION floatValue] >= 7.0)
#define iOS8OrLater ([kSYSTEMVERSION floatValue] >= 8.0)
#define iOS9OrLater ([kSYSTEMVERSION floatValue] >= 9.0)
#define iOS10OrLater ([kSYSTEMVERSION floatValue] >= 10.0)
#define iOS11OrLater ([kSYSTEMVERSION floatValue] >= 11.0)
#define iOS12OrLater ([kSYSTEMVERSION floatValue] >= 12.0)

//和上面一样
#define kSYSTEM_VERSION_EQUAL_TO(v)                  ([kSYSTEMVERSION compare:v options:NSNumericSearch] == NSOrderedSame)
#define kSYSTEM_VERSION_GREATER_THAN(v)              ([kSYSTEMVERSION compare:v options:NSNumericSearch] == NSOrderedDescending)
#define kSYSTEM_VERSION_GREATER_THAN_OR_EQUAL(v)  ([kSYSTEMVERSION compare:v options:NSNumericSearch] != NSOrderedAscending)
#define kSYSTEM_VERSION_LESS_THAN(v)                 ([kSYSTEMVERSION compare:v options:NSNumericSearch] == NSOrderedAscending)
#define kSYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([kSYSTEMVERSION compare:v options:NSNumericSearch] != NSOrderedDescending)

//  iOS 支持
#define kSUPPORT_IPHONE_OS_VERSION(version) ( __IPHONE_OS_VERSION_MIN_REQUIRED <= version && __IPHONE_OS_VERSION_MAX_ALLOkED >= version)

// 设置Debug模式下打印log,release模式下不打印
#ifdef DEBUG
#	define NSLog(format, ...)   NSLog((@"[DEBUG] %s [第%d行] " format), __PRETTY_FUNCTION__,__LINE__, ##__VA_ARGS__);
#else
#   define NSLog(...)
#	define NSLog(...)
#endif

//获取temp
#define kPathTemp NSTemporaryDirectory()

//获取沙盒 Document
#define kPathDocument [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject]

//获取沙盒 Cache
#define kPathCache [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject]



#endif /* WYJSystemMacro_h */
