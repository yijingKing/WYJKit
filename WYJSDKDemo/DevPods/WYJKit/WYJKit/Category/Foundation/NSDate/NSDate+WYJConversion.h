/*
 Created by 祎 on 2021
 Copyright © 2021年 祎. All rights reserved.
 */

#import <Foundation/Foundation.h>

// 定义日期格式类型
typedef NS_ENUM(NSUInteger, WYJDateFormatType) {
    WYJDateFormatTypeISO8601,       // ISO8601 标准日期格式
    WYJDateFormatTypeNormal,        // 正常日期格式
    WYJDateFormatTypeShort,         // 短日期格式
    WYJDateFormatTypeMedium,        // 中等日期格式
    WYJDateFormatTypeLong,          // 长日期格式
    WYJDateFormatTypeFull,          // 完整日期格式
    WYJDateFormatTypeTimeOnly,      // 仅时间格式
    WYJDateFormatTypeDateOnly,      // 仅日期格式
    WYJDateFormatTypeYearMonthDayHourMinute, // 年月日时分格式
    WYJDateFormatTypeYearMonthDayHour,       // 年月日时格式
    WYJDateFormatTypeYearMonthDay,           // 年月日格式
    WYJDateFormatTypeMonthDayHourMinute     // 月日时分格式
};

@interface NSDate (WYJConversion)

/// 将时间转换成时间戳，使用指定的日期格式
/// @param formatType 日期格式类型
/// @return 转换后的时间戳字符串
- (nullable NSString *)yi_toTimestampWithFormatter:(WYJDateFormatType)formatType;

/// 将时间戳转换成时间，使用指定的日期格式
/// @param timestamp 时间戳
/// @param formatType 日期格式类型
/// @return 格式化后的时间字符串
- (NSString *)yi_timestampToString:(NSTimeInterval)timestamp format:(WYJDateFormatType)formatType;

/// 将日期转换成字符串，使用指定的日期格式
/// @param formatType 日期格式类型
/// @return 格式化后的日期字符串
- (NSString *)yi_dateToStringWithFormat:(WYJDateFormatType)formatType;


/// 将时间转换成时间戳，使用自定义日期格式
/// @param customFormat 自定义日期格式
/// @return 转换后的时间戳字符串
- (nullable NSString *)yi_toTimestampWithCustomFormatter:(NSString *)customFormat;

/// 将时间戳转换成时间，使用自定义日期格式
/// @param timestamp 时间戳
/// @param customFormat 自定义日期格式
/// @return 格式化后的时间字符串
- (NSString *)yi_timestampToString:(NSTimeInterval)timestamp customFormat:(NSString *)customFormat;

/// 将字符串转换成日期
/// @param dateString 日期字符串
/// @return 转换后的日期对象
+ (NSDate *)yi_stringToDate:(NSString *)dateString;

/// 将日期转换成字符串，使用自定义日期格式
/// @param customFormat 自定义日期格式
/// @return 格式化后的日期字符串
- (NSString *)yi_dateToStringWithCustomFormat:(NSString *)customFormat;

@end
