/*******************************************************************************
 Copyright (K), 2019 - ~, ╰莪呮想好好宠Nǐつ 
 
 Author:        ╰莪呮想好好宠Nǐつ (Wang Yijing)
 E-mail:        1091676312@qq.com
 GitHub:        https://github.com/MemoryKing
 ********************************************************************************/


#import <Foundation/Foundation.h>


typedef NS_ENUM(NSUInteger,ArraySortingType) {
    ArraySortingTypeReverse = 0,//降序
    ArraySortingTypeUsing//升序
};

@interface NSArray (WYJAdd)
///移除重复
@property (nonatomic, strong, readonly)NSArray * removeDuplicate;
@end


