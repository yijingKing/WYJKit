/*******************************************************************************
 Copyright (K), 2019 - ~, ╰莪呮想好好宠Nǐつ 
 
 Author:        ╰莪呮想好好宠Nǐつ (Wang Yijing)
 E-mail:        1091676312@qq.com
 GitHub:        https://github.com/MemoryKing
 ********************************************************************************/

#import "NSArray+YJAdd.h"

@implementation NSArray (YJAdd)

- (NSArray *)wRemoveDuplicate {
    NSSet * set = [NSSet setWithArray:self];
    return [set allObjects];
}

@end
