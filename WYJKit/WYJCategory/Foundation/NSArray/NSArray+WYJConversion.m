/*
  Created by King on 2021
  Copyright © 2021年 King. All rights reserved.
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
