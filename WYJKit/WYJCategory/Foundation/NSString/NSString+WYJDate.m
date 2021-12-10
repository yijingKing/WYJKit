/*
  Created by King on 2021
  Copyright © 2021年 King. All rights reserved.
*/
#import "NSString+WYJDate.h"

@implementation NSString (WYJDate)
#pragma mark ---- 将时间戳转换成时间
- (NSString *)yi_dateFromTimestamp:(NSString  *)formatterstr {
    //将对象类型的时间转换为NSDate类型
    double time = self.doubleValue;
    NSDate * myDate=[NSDate dateWithTimeIntervalSince1970:time];
    NSDateFormatter * formatter=[[NSDateFormatter alloc]init];
    
    if (formatterstr) {
        [formatter setDateFormat: formatterstr];
    } else {
        [formatter setDateFormat: @"YYYY-MM-dd HH:mm:ss"];
    }
    NSString *timeStr=[formatter stringFromDate:myDate];
    return timeStr;
}

- (NSDate *)yi_dateFromStringFormat:(NSString *)format {
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
    return [formatter dateFromString:self];
}

@end
