/*******************************************************************************
 Copyright (K), 2019 - ~, ╰莪呮想好好宠Nǐつ
 
 Author:        ╰莪呮想好好宠Nǐつ (Wang Yijing)
 E-mail:        1091676312@qq.com
 GitHub:        https://github.com/MemoryKing
 ********************************************************************************/

#import "NSString+WYJDate.h"

@implementation NSString (WYJDate)
#pragma mark ---- 将时间戳转换成时间
- (NSString *)dateFromTimestamp:(NSString  *)formatterstr {
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

- (NSDate *)dateFromStringFormat:(NSString *)format {
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
    return [formatter dateFromString:self];
}

@end
