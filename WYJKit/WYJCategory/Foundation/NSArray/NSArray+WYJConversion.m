/*
  Created by 祎 on 2021
  Copyright © 2021年 祎. All rights reserved.
  GitHub: https://github.com/MemoryKing
*/

#import "NSArray+WYJConversion.h"

@implementation NSArray (WYJConversion)
- (NSString *)toString {
    return [self toStringBy:@","];
}
- (NSString *)toStringBy:(NSString *)string {
    return [self componentsJoinedByString:string];
}
@end
