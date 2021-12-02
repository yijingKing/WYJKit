/*
 Created by 祎 on 2021
 Copyright © 2021年 祎. All rights reserved.
 */

#import "NSData+WYJConversion.h"

@implementation NSData (WYJConversion)
///转成字符串
- (NSString *)yi_toString {
    return [[NSString alloc]initWithData:self encoding:NSUTF8StringEncoding];
}
@end
