/*
  Created by King on 2021
  Copyright © 2021年 King. All rights reserved.
*/

#import "NSArray+WYJAdd.h"

@implementation NSArray (WYJAdd)

- (NSArray *)yi_removeDuplicate {
    NSSet * set = [NSSet setWithArray:self];
    return [set allObjects];
}




@end
