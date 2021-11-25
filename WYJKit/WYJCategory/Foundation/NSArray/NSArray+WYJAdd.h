/*
  Created by 祎 on 2021
  Copyright © 2021年 祎. All rights reserved.
  GitHub: https://github.com/MemoryKing
*/


#import <Foundation/Foundation.h>


typedef NS_ENUM(NSUInteger,ArraySortingType) {
    ArraySortingTypeReverse = 0,//降序
    ArraySortingTypeUsing//升序
};

@interface NSArray (WYJAdd)
///移除重复
@property (nonatomic, strong, readonly)NSArray * yi_removeDuplicate;
@end


