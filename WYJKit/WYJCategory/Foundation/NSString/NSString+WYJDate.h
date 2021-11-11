/*******************************************************************************
 Copyright (K), 2019 - ~, ╰莪呮想好好宠Nǐつ
 
 Author:        ╰莪呮想好好宠Nǐつ (Wang Yijing)
 E-mail:        1091676312@qq.com
 GitHub:        https://github.com/MemoryKing
 ********************************************************************************/

#import <Foundation/Foundation.h>

@interface NSString (WYJDate)
#pragma mark ---- 将时间戳转换成时间
- (nullable NSString *)dateFromTimestamp:(nullable NSString *)formatterstr;

/** 字符串转时间*/
- (nullable NSDate *)dateFromStringFormat:(nullable NSString *)format;
@end
