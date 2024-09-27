/*
  Created by 祎 on 2021
  Copyright © 2021年 祎. All rights reserved.
*/

#import "NSArray+WYJAdd.h"

@implementation NSArray (WYJAdd)

- (NSArray *)yi_removeDuplicate {
    NSSet * set = [NSSet setWithArray:self];
    return [set allObjects];
}




@end
