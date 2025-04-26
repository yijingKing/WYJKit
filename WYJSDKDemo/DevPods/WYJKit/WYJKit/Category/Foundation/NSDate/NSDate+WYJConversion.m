/*
 Created by 祎 on 2021
 Copyright © 2021年 祎. All rights reserved.
 */
#import "NSDate+WYJConversion.h"



@implementation NSDate (WYJConversion)

#pragma mark --- 将时间转换成时间戳
- (nullable NSString *)yi_toTimestampWithFormatter:(WYJDateFormatType)formatType {
    return [self yi_toTimestampWithFormatter:formatType customFormat:nil];
}

#pragma mark --- 将时间戳转换成时间
- (NSString *)yi_timestampToString:(NSTimeInterval)timestamp format:(WYJDateFormatType)formatType {
    return [self yi_timestampToString:timestamp format:formatType customFormat:nil];
}

#pragma mark --- 日期转字符串
- (NSString *)yi_dateToStringWithFormat:(WYJDateFormatType)formatType {
    return [self yi_dateToStringWithFormat:formatType customFormat:nil];
}

#pragma mark --- 将时间转换成时间戳
- (nullable NSString *)yi_toTimestampWithCustomFormatter:(NSString *)customFormat {
    return [self yi_toTimestampWithFormatter:nil customFormat:customFormat];
}

#pragma mark --- 将时间戳转换成时间
- (NSString *)yi_timestampToString:(NSTimeInterval)timestamp customFormat:(NSString *)customFormat {
    return [self yi_timestampToString:timestamp format:nil customFormat:customFormat];
}

#pragma mark --- 日期转字符串
- (NSString *)yi_dateToStringWithCustomFormat:(NSString *)customFormat {
    return [self yi_dateToStringWithFormat:nil customFormat:customFormat];
}


#pragma mark --- 将时间转换成时间戳
- (nullable NSString *)yi_toTimestampWithFormatter:(WYJDateFormatType)formatType customFormat:(NSString *)customFormat {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    NSString *dateFormat = [self yi_dateFormatForType:formatType customFormat:customFormat];
    [formatter setDateFormat:dateFormat];
    
    NSTimeZone *timeZone = [NSTimeZone localTimeZone];
    [formatter setTimeZone:timeZone];
    
    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)[self timeIntervalSince1970]];
    return timeSp;
}

#pragma mark --- 将时间戳转换成时间
- (NSString *)yi_timestampToString:(NSTimeInterval)timestamp format:(WYJDateFormatType)formatType customFormat:(NSString *)customFormat {
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timestamp];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    NSString *dateFormat = [self yi_dateFormatForType:formatType customFormat:customFormat];
    [dateFormatter setDateFormat:dateFormat];
    
    NSString *dateString = [dateFormatter stringFromDate:date];
    return dateString;
}

#pragma mark --- 字符串转日期
+ (NSDate *)yi_stringToDate:(NSString *)dateString {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    NSString *dateFormat = [NSDate.date yi_dateFormatForType:WYJDateFormatTypeNormal customFormat:nil];
    [dateFormatter setDateFormat:dateFormat];
    NSDate *date = [dateFormatter dateFromString:dateString];
    return date;
}

#pragma mark --- 日期转字符串
- (NSString *)yi_dateToStringWithFormat:(WYJDateFormatType)formatType customFormat:(NSString *)customFormat {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    NSString *dateFormat = [self yi_dateFormatForType:formatType customFormat:customFormat];
    [dateFormatter setDateFormat:dateFormat];
    NSString *dateString = [dateFormatter stringFromDate:self];
    return dateString;
}
#pragma mark --- 根据类型获取日期格式
- (NSString *)yi_dateFormatForType:(WYJDateFormatType)formatType customFormat:(NSString *)customFormat {
    if (customFormat && customFormat.length > 0) {
        return customFormat;
    }
    
    switch (formatType) {
        case WYJDateFormatTypeISO8601:
            return @"yyyy-MM-dd'T'HH:mm:ssZ";
        case WYJDateFormatTypeNormal:
            return @"yyyy-MM-dd HH:mm:ss";
        case WYJDateFormatTypeShort:
            return @"MM/dd/yy";
        case WYJDateFormatTypeMedium:
            return @"MMM dd, yyyy";
        case WYJDateFormatTypeLong:
            return @"MMMM dd, yyyy";
        case WYJDateFormatTypeFull:
            return @"EEEE, MMMM dd, yyyy";
        case WYJDateFormatTypeTimeOnly:
            return @"HH:mm";
        case WYJDateFormatTypeDateOnly:
            return @"yyyy-MM-dd";
        case WYJDateFormatTypeYearMonthDayHourMinute:
            return @"yyyy-MM-dd HH:mm";
        case WYJDateFormatTypeYearMonthDayHour:
            return @"yyyy-MM-dd HH";
        case WYJDateFormatTypeYearMonthDay:
            return @"yyyy-MM-dd";
        case WYJDateFormatTypeMonthDayHourMinute:
            return @"MM-dd HH:mm";
        default:
            return @"yyyy-MM-dd HH:mm:ss"; // 默认格式
    }
}

@end
