/*
  Created by 祎 on 2021
  Copyright © 2021年 祎. All rights reserved.
*/

#import "NSDate+WYJAdd.h"

@implementation NSDate (WYJAdd)

+ (NSDate *)yi_getPriousorLaterDateFromDate:(NSDate *)date withMonth:(NSInteger)month {
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    [comps setMonth:month];
    NSCalendar *calender = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDate *mDate = [calender dateByAddingComponents:comps toDate:date options:0];
    return mDate;
}

- (NSDate *)yi_getPriousorLaterDateWithMonth:(NSInteger)month {
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    [comps setMonth:month];
    NSCalendar *calender = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDate *mDate = [calender dateByAddingComponents:comps toDate:self options:0];
    return mDate;
}

/**
  获取当前是星期几
  @return 1、2、3、4、5、6、7(星期六是 7 ，星期日 1)
  */
+ (NSInteger)yi_getNowWeekday {
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    NSInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    NSDate *now = [NSDate date];
    // 在真机上需要设置区域，才能正确获取本地日期，中国区代码：zh_CN
    calendar.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
    comps = [calendar components:unitFlags fromDate:now];
    return [comps weekday];
}

/**
  计算星期几
  @return 1、2、3、4、5、6、7(星期六是 7 ，星期日 1)
  */
+ (NSInteger)yi_getWeekdayWithDate:(NSDate *)date {
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    NSInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    NSDate *now = date;
    // 在真机上需要设置区域，才能正确获取本地日期，中国区代码：zh_CN
    calendar.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
    comps = [calendar components:unitFlags fromDate:now];
    return [comps weekday];
}

/**
  获取当前是几月几日
  @return 07月07日
  */
+ (NSString *)yi_getTodayString {
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *components = [cal components:(NSCalendarUnitEra|NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay) fromDate:[NSDate date]];
    NSDate *today = [cal dateFromComponents:components];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"MM月dd日";
    return [formatter stringFromDate:today];
}

//是否为今天
- (BOOL)yi_isToday {
    //now: 2015-09-05 11:23:00
    //self 调用这个方法的对象本身
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    int unit = NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear ;
    
    //1.获得当前时间的 年月日
    NSDateComponents *nowCmps = [calendar components:unit fromDate:[NSDate date]];
    
    //2.获得self
    NSDateComponents *selfCmps = [calendar components:unit fromDate:self];
    
    return (selfCmps.year == nowCmps.year) && (selfCmps.month == nowCmps.month) && (selfCmps.day == nowCmps.day);
}

//是否为昨天
- (BOOL)yi_isYesterday {
    //2014-05-01
    NSDate *nowDate = [[NSDate date] yi_dateWithYMD];
    
    //2014-04-30
    NSDate *selfDate = [self yi_dateWithYMD];
    
    //获得nowDate和selfDate的差距
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *cmps = [calendar components:NSCalendarUnitDay fromDate:selfDate toDate:nowDate options:0];
    
    return cmps.day == 1;
}

//是否在同一周
- (BOOL)yi_isSameWeek {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    int unit = NSCalendarUnitWeekday | NSCalendarUnitMonth | NSCalendarUnitYear ;
    
    //1.获得当前时间的 年月日
    NSDateComponents *nowCmps = [calendar components:unit fromDate:[NSDate date]];
    
    //2.获得self
    NSDateComponents *selfCmps = [calendar components:unit fromDate:self];
    
    return (selfCmps.year == nowCmps.year) && (selfCmps.month == nowCmps.month) && (selfCmps.day == nowCmps.day);
}

/** 某天后几天 */
+ (NSDate *)yi_dateAfterDay:(NSDate *)date num:(NSInteger)num {
    return [date yi_dateByAddingDays:num];
}

/** 某天前几天 */
+ (NSDate *)yi_dateBeforeDay:(NSDate *)date num:(NSInteger)num {
    return [date yi_dateBySubtractingDays:num];
}

/** 减少dDays天 */
- (NSDate *)yi_dateBySubtractingDays:(NSInteger)dDays {
    return [self yi_dateByAddingDays:(dDays * -1)];
}

/** 增加dDays天 */
- (NSDate *)yi_dateByAddingDays:(NSUInteger)days {
    NSDateComponents *c = [[NSDateComponents alloc] init];
    c.day = days;
    NSCalendar *calender = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierChinese];
    NSDate *date = [calender dateByAddingComponents:c toDate:self options:0];
    return date;
}

/** 增加dHours小时 */
- (NSDate *)yi_dateByAddingHours:(NSInteger)dHours {
    NSTimeInterval aTimeInterval = [self timeIntervalSinceReferenceDate] + WHours() * dHours;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}

/** 当前小时前dHours个小时 */
+ (NSDate *)yi_dateWithHoursFromNow:(NSInteger)dHours {
    NSTimeInterval aTimeInterval = [[NSDate date] timeIntervalSinceReferenceDate] + WHours() * dHours;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}

//格式化
- (NSDate *)yi_dateWithYMD {
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyy-MM-dd";
    NSString *selfStr = [fmt stringFromDate:self];
    return [fmt dateFromString:selfStr];
}
- (NSDate *)yi_dateWithYMDHMS {
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    NSString *selfStr = [fmt stringFromDate:self];
    return [fmt dateFromString:selfStr];
}
//计算两时间差
+ (NSDateComponents *)yi_differenceBetweenStartDate:(NSDate *)startDate endDate:(NSDate *)endDate {
    if (startDate == nil || endDate == nil) {
        return nil;
    }
    // 创建日历实例
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    // 定义要计算的时间单位：天、小时、分钟、秒
    NSCalendarUnit units = NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    
    // 计算时间差
    NSDateComponents *components = [calendar components:units fromDate:startDate toDate:endDate options:0];
    
    return components;
}


@end

NSString * yi_stringFromDate(NSDate * date, NSString * formatter) {
    NSDateFormatter * form = NSDateFormatter.alloc.init;
    form.dateFormat = formatter;
    return [form stringFromDate:date];
}

NSTimeInterval yi_dateCalculatedTimeDifference (NSString * start, NSString * stop, NSString * formatter) {
    NSDateFormatter* formater = [[NSDateFormatter alloc] init];
    [formater setDateFormat:formatter];
    NSDate* startDate = [formater dateFromString:start];
    NSDate* endDate = [formater dateFromString:stop];
    NSTimeInterval time = [endDate timeIntervalSinceDate:startDate];
    return time;
}
