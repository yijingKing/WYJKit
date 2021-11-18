/*
  Created by 祎 on 2021
  Copyright © 2021年 祎. All rights reserved.
  GitHub: https://github.com/MemoryKing
*/

#import "NSArray+WYJAdd.h"

@implementation NSArray (WYJAdd)

- (NSArray *)removeDuplicate {
    NSSet * set = [NSSet setWithArray:self];
    return [set allObjects];
}




@end
