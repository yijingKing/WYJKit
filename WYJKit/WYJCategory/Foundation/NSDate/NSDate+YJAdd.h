/*******************************************************************************
 Copyright (K), 2019 - ~, ╰莪呮想好好宠Nǐつ 
 
 Author:        ╰莪呮想好好宠Nǐつ (Wang Yijing)
 E-mail:        1091676312@qq.com
 GitHub:        https://github.com/MemoryKing
 ********************************************************************************/


#import <Foundation/Foundation.h>

@interface NSDate (YJAdd)
/** 当前dan时间格式转换 */
- (NSString *)stringFromDate:(NSString *)formatter;
/** 时间格式转换 */
+ (NSString *)stringFromDate:(NSDate *)date formatter:(NSString *)formatter;

/**
 获取某时间前或后几个月的时间

 @param date 计算前的时间
 @param month 正数为后几个月,负数为前几个月
 @return 计算后的时间
 */
+ (NSDate *)getPriousorLaterDateFromDate:(NSDate *)date withMonth:(int)month;

/**
 获取当前时间 前或后几个月的时间
 @param month 正数为后几个月,负数为前几个月
 @return 计算后的时间
 */
- (NSDate *)getPriousorLaterDateWithMonth:(int)month;

/**
  获取当前是星期几
  @return 1、2、3、4、5、6、7(星期六是 7 ，星期日 1)
  */
+ (NSInteger)getNowWeekday;

/**
  计算星期几
  @return 1、2、3、4、5、6、7(星期六是 7 ，星期日 1)
  */
+ (NSInteger)getWeekdayWithDate:(NSDate *)date;

/**
  获取当前是几月几日
  @return 07月07日
  */
+ (NSString *)getTodayString;

///是否为今天
- (BOOL)isToday;
///是否为昨天
- (BOOL)isYesterday;
///是否在同一周
- (BOOL)isSameWeek;

/** 某天后几天 */
+ (NSDate *)dateAfterDay:(NSDate *)date num:(int)num;
/** 某天前几天 */
+ (NSDate *)dateBeforeDay:(NSDate *)date num:(int)num;
/** 增加dDays天 */
- (NSDate *)dateByAddingDays:(NSUInteger)days;
/** 减少dDays天 */
- (NSDate *)dateBySubtractingDays:(NSInteger)dDays;
/** 当前小时前dHours个小时 */
+ (NSDate *)dateWithHoursFromNow:(NSInteger)dHours;
/** 增加dHours小时 */
- (NSDate *)dateByAddingHours:(NSInteger)dHours;
@end

static inline NSInteger WYear(void) {
    return 60 * 60 * 24 * 365;
}

static inline NSInteger WWeek(void) {
    return 60 * 60 * 24 * 7;
}

static inline NSInteger WDay(void) {
    return 60 * 60 * 24;
}

static inline NSInteger WHours(void) {
    return 60 * 60;
}

static inline NSInteger WMinutes(void) {
    return 60;
}

/** 时间转换格式 */
NSString * WStringFromDate(NSDate * date,NSString * formatter);

/**
 计算时间差

 @param start 开始时间
 @param stop 结束时间
 @param formatter 时间格式
 @return 时间差(秒)
 */
NSTimeInterval WDateCalculatedTimeDifference (NSString * start, NSString * stop, NSString * formatter);
