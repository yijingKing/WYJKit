/*
  Created by King on 2021
  Copyright © 2021年 King. All rights reserved.
*/


#import "NSMutableArray+YJAdd.h"

@implementation NSMutableArray (YJAdd)

- (NSMutableArray *)yi_removeDuplicates {
    NSSet * set = [NSSet setWithArray:self];
    NSMutableArray * array = [NSMutableArray arrayWithArray:set.allObjects];
    return array;
}

@end
