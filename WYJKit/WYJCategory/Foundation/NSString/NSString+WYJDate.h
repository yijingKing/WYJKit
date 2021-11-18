/*
  Created by 祎 on 2021
  Copyright © 2021年 祎. All rights reserved.
  GitHub: https://github.com/MemoryKing
*/
#import <Foundation/Foundation.h>

@interface NSString (WYJDate)
#pragma mark ---- 将时间戳转换成时间
- (nullable NSString *)dateFromTimestamp:(nullable NSString *)formatterstr;

/** 字符串转时间*/
- (nullable NSDate *)dateFromStringFormat:(nullable NSString *)format;
@end

