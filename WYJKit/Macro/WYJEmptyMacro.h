/*
  Created by 祎 on 2021
  Copyright © 2021年 祎. All rights reserved.
  GitHub: https://github.com/MemoryKing
*/

#ifndef WYJEmptyMacro_h
#define WYJEmptyMacro_h

/**
 字符串判空
 */
#ifndef WYJStringIsEmpty
#define WYJStringIsEmpty(string) ([string isKindOfClass:[NSNull class]] || string == nil || [string length] < 1 ? YES : NO )
#endif

#ifndef WYJStringNotEmpty
#define WYJStringNotEmpty(string)       (!WYJStringIsEmpty(string))
#endif


/**
 数组判空

 @param array 数组
 @return 是否为空
 */
#define WYJArrayIsEmpty(array)      (array == nil || [array isKindOfClass:[NSNull class]] || array.count == 0? YES : NO)
#define WYJArrayNotEmpty(array)     (!WYJArrayIsEmpty(array))
/**
 字典判空

 @param dictionary 字典
 @return 是否为空
 */
#define WYJDictionaryIsEmpty(dictionary)  (dictionary == nil || [dictionary isKindOfClass:[NSNull class]] || dictionary.allKeys.count == 0? YES : NO)
#define WYJDictionaryNotEmpty(dictionary)    (!WYJDictionaryIsEmpty(dictionary))
/**
 对象判空

 @param object 对象
 @return 是否为空
 */
#define WYJObjectIsEmpty(object)  (object == nil||[object isKindOfClass:[NSNull class]]||([object respondsToSelector:@selector(length)] && [(NSData *)object length] == 0)|| ([object respondsToSelector:@selector(count)] && [(NSArray *)object count] == 0)?YES:NO)
#define WYJObjectNotEmpty(object)       (!WYJObjectIsEmpty(object))
#endif /* WYJEmptyMacro_h */
