/*
  Created by King on 2021
  Copyright © 2021年 King. All rights reserved.
*/
#import <Foundation/Foundation.h>

@interface NSDate (WYJConversion)
// 将时间转换成时间戳
- (nullable NSString *)yi_toTimestampWithFormatter:(nullable NSString *)formatterStr;
// 将时间戳转换成时间
- (NSString *)yi_timestampToString:(NSTimeInterval)timestamp withFormat:(NSString *)format;
@end


