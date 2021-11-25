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
#define WYJStringIsEmpty(string) ([NSString yi_judgeEmpty:string])
#endif

#ifndef WYJStringNotEmpty
#define WYJStringNotEmpty(string)       (!WYJStringIsEmpty(string))
#endif
/**
 数组判空
 @param array 数组
 @return 是否为空
 */
#ifndef WYJArrayIsEmpty
#define WYJArrayIsEmpty(array)      (array == nil || [array isKindOfClass:[NSNull class]] || array.count == 0 ? YES : NO)
#endif

#ifndef WYJArrayNotEmpty
#define WYJArrayNotEmpty(array)     (!WYJArrayIsEmpty(array))
#endif
/**
 字典判空
 @param dictionary 字典
 @return 是否为空
 */
#ifndef WYJDictionaryIsEmpty
#define WYJDictionaryIsEmpty(dictionary)  (dictionary == nil || [dictionary isKindOfClass:[NSNull class]] || dictionary.allKeys.count == 0? YES : NO)
#endif
#ifndef WYJDictionaryNotEmpty
#define WYJDictionaryNotEmpty(dictionary)    (!WYJDictionaryIsEmpty(dictionary))
#endif
/**
 对象判空

 @param object 对象
 @return 是否为空
 */
#ifndef WYJObjectIsEmpty
#define WYJObjectIsEmpty(object)  (object == nil||[object isKindOfClass:[NSNull class]]||([object respondsToSelector:@selector(length)] && [(NSData *)object length] == 0)|| ([object respondsToSelector:@selector(count)] && [(NSArray *)object count] == 0)?YES:NO)
#endif
#ifndef WYJObjectNotEmpty
#define WYJObjectNotEmpty(object)       (!WYJObjectIsEmpty(object))
#endif
#endif /* WYJEmptyMacro_h */
