/*
  Created by 祎 on 2021
  Copyright © 2021年 祎. All rights reserved.
*/


#import <Foundation/Foundation.h>


typedef NS_ENUM(NSUInteger,ArraySortingType) {
    ArraySortingTypeReverse = 0,//降序
    ArraySortingTypeUsing//升序
};

@interface NSArray (WYJAdd)
///移除重复
@property (nonatomic, strong, readonly)NSArray * yi_removeDuplicate;


/// 通用过滤方法
/// @param key 需要匹配的键（属性名）
/// @param value 需要匹配的值
- (NSArray *)yi_filterWithKey:(NSString *)key value:(id)value;

/// 使用自定义 NSPredicate 进行过滤
/// @param predicate 过滤条件
- (NSArray *)yi_filterWithPredicate:(NSPredicate *)predicate;

@end


