/*******************************************************************************
 Copyright (K), 2019 - ~, ╰莪呮想好好宠Nǐつ 
 
 Author:        ╰莪呮想好好宠Nǐつ (Wang Yijing)
 E-mail:        1091676312@qq.com
 GitHub:        https://github.com/MemoryKing
 ********************************************************************************/


#import "NSMutableArray+YJAdd.h"

@implementation NSMutableArray (YJAdd)

- (NSMutableArray *)wRemoveDuplicates {
    NSSet * set = [NSSet setWithArray:self];
    NSMutableArray * array = [NSMutableArray arrayWithArray:set.allObjects];
    return array;
}

@end
