/*
  Created by 祎 on 2021
  Copyright © 2021年 祎. All rights reserved.
  GitHub: https://github.com/MemoryKing
*/

#import "NSArray+WYJConversion.h"

@implementation NSArray (WYJConversion)
- (NSString *)yi_toString {
    return [self yi_toStringBy:@","];
}
- (NSString *)yi_toStringBy:(NSString *)string {
    return [self componentsJoinedByString:string];
}
@end
