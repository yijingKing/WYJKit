/*
  Created by King on 2021
  Copyright © 2021年 King. All rights reserved.
*/
#import <Foundation/Foundation.h>

@interface NSString (WYJDate)
#pragma mark ---- 将时间戳转换成时间
- (nullable NSString *)yi_dateFromTimestamp:(nullable NSString *)formatterstr;

/** 字符串转时间*/
- (nullable NSDate *)yi_dateFromStringFormat:(nullable NSString *)format;
@end

