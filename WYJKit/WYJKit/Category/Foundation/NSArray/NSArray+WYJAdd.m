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

- (NSArray *)yi_filterWithKey:(NSString *)key value:(id)value {
    if (!key || !value) return @[];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%K == %@", key, value];
    return [self filteredArrayUsingPredicate:predicate];
}

- (NSArray *)yi_filterWithPredicate:(NSPredicate *)predicate {
    if (!predicate) return self;
    return [self filteredArrayUsingPredicate:predicate];
}


@end
