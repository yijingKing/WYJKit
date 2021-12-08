/*
  Created by 祎 on 2021
  Copyright © 2021年 祎. All rights reserved.
*/
#import "NSDate+WYJConversion.h"
@implementation NSDate (WYJConversion)

#pragma mark --- 将时间转换成时间戳
- (nullable NSString *)yi_toTimestampWithFormatter:(nullable NSString *)formatterStr{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    if (formatterStr) {
        [formatter setDateFormat: formatterStr];
    } else {
        [formatter setDateFormat: @"YYYY-MM-dd HH:mm:ss"];
    }
    
    NSTimeZone* timeZone = [NSTimeZone localTimeZone];
    [formatter setTimeZone:timeZone];
    
    NSDate *datenow = [NSDate date];//现在时间,你可以输出来看下是什么格式
    // 时间转时间戳的方法:
    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)[datenow timeIntervalSince1970]];
    return timeSp;
}


@end
