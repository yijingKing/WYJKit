/*
  Created by 祎 on 2021
  Copyright © 2021年 祎. All rights reserved.
  GitHub: https://github.com/MemoryKing
*/


#import "NSString+WYJRegular.h"

@implementation NSString (WYJRegular)
//最终正则匹配结果
+(BOOL)regexPatternResultWithRegex:(NSString *)regex TargetString:(NSString *)targetString{
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    return [predicate evaluateWithObject:targetString];
}

- (BOOL)isNumber
{
    NSString *regex = @"^[0-9]+([.]{0,1}[0-9]+){0,1}$";
    return [NSString regexPatternResultWithRegex:regex TargetString:self];
}
/** 是否是手机号 */
- (BOOL)isTelephone
{
    NSString *regex = @"^1(3[0-9]|4[56789]|5[0-9]|6[6]|7[0-9]|8[0-9]|9[89])\\d{8}$";
    return [NSString regexPatternResultWithRegex:regex TargetString:self];
}

/** 邮箱 */
- (BOOL)isEmail
{
    NSString * regex = @"^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\\.[a-zA-Z0-9_-]+)+$";
    return [NSString regexPatternResultWithRegex:regex TargetString:self];
}

- (BOOL)isMoney {
    NSString * regex = @"^[0-9]+(\\.[0-9]{1,2})?$";
    return [NSString regexPatternResultWithRegex:regex TargetString:self];
}

- (BOOL)isTheInteger {
    NSString * regex = @"[0-9]*";
    return [NSString regexPatternResultWithRegex:regex TargetString:self];
}

- (BOOL)isChinese {
    NSString * regex = @"^[\u4E00+\u9FA5]*$";
    return [NSString regexPatternResultWithRegex:regex TargetString:self];
}

- (BOOL)isURL {
    NSString * regex = @"^[a+zA+z]+://(\\w+(+\\w+)*)(\\.(\\w+(+\\w+)*))*(\\?\\S*)?$";;
    return [NSString regexPatternResultWithRegex:regex TargetString:self];
}

@end
