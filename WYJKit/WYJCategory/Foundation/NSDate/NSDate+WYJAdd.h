/*
  Created by King on 2021
  Copyright © 2021年 King. All rights reserved.
*/


#import <Foundation/Foundation.h>

@interface NSDate (WYJAdd)
/** 当前dan时间格式转换 */
- (NSString *)yi_stringFromDate:(NSString *)formatter;
/** 时间格式转换 */
+ (NSString *)yi_stringFromDate:(NSDate *)date formatter:(NSString *)formatter;

/**
 获取某时间前或后几个月的时间

 @param date 计算前的时间
 @param month 正数为后几个月,负数为前几个月
 @return 计算后的时间
 */
+ (NSDate *)yi_getPriousorLaterDateFromDate:(NSDate *)date withMonth:(int)month;

/**
 获取当前时间 前或后几个月的时间
 @param month 正数为后几个月,负数为前几个月
 @return 计算后的时间
 */
- (NSDate *)yi_getPriousorLaterDateWithMonth:(int)month;

/**
  获取当前是星期几
  @return 1、2、3、4、5、6、7(星期六是 7 ，星期日 1)
  */
+ (NSInteger)yi_getNowWeekday;

/**
  计算星期几
  @return 1、2、3、4、5、6、7(星期六是 7 ，星期日 1)
  */
+ (NSInteger)yi_getWeekdayWithDate:(NSDate *)date;

/**
  获取当前是几月几日
  @return 07月07日
  */
+ (NSString *)yi_getTodayString;

///是否为今天
- (BOOL)yi_isToday;
///是否为昨天
- (BOOL)yi_isYesterday;
///是否在同一周
- (BOOL)yi_isSameWeek;

/** 某天后几天 */
+ (NSDate *)yi_dateAfterDay:(NSDate *)date num:(int)num;
/** 某天前几天 */
+ (NSDate *)yi_dateBeforeDay:(NSDate *)date num:(int)num;
/** 增加dDays天 */
- (NSDate *)yi_dateByAddingDays:(NSUInteger)days;
/** 减少dDays天 */
- (NSDate *)yi_dateBySubtractingDays:(NSInteger)dDays;
/** 当前小时前dHours个小时 */
+ (NSDate *)yi_dateWithHoursFromNow:(NSInteger)dHours;
/** 增加dHours小时 */
- (NSDate *)yi_dateByAddingHours:(NSInteger)dHours;

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
NSString * yi_stringFromDate(NSDate * date,NSString * formatter);

/**
 计算时间差

 @param start 开始时间
 @param stop 结束时间
 @param formatter 时间格式
 @return 时间差(秒)
 */
NSTimeInterval yi_dateCalculatedTimeDifference (NSString * start, NSString * stop, NSString * formatter);
