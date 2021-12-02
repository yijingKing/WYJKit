/*
  Created by 祎 on 2021
  Copyright © 2021年 祎. All rights reserved.
*/

#ifndef WYJEmptyMacro_h
#define WYJEmptyMacro_h

/**
 字符串判空
 */
#ifndef YJStringIsEmpty
#define YJStringIsEmpty(string) ([NSString yi_judgeEmpty:string])
#endif

#ifndef YJStringNotEmpty
#define YJStringNotEmpty(string)       (!YJStringIsEmpty(string))
#endif
/**
 数组判空
 @param array 数组
 @return 是否为空
 */
#ifndef YJArrayIsEmpty
#define YJArrayIsEmpty(array)      (array == nil || [array isKindOfClass:[NSNull class]] || array.count == 0 ? YES : NO)
#endif

#ifndef YJArrayNotEmpty
#define YJArrayNotEmpty(array)     (!YJArrayIsEmpty(array))
#endif
/**
 字典判空
 @param dictionary 字典
 @return 是否为空
 */
#ifndef YJDictionaryIsEmpty
#define YJDictionaryIsEmpty(dictionary)  (dictionary == nil || [dictionary isKindOfClass:[NSNull class]] || dictionary.allKeys.count == 0? YES : NO)
#endif
#ifndef YJDictionaryNotEmpty
#define YJDictionaryNotEmpty(dictionary)    (!YJDictionaryIsEmpty(dictionary))
#endif
/**
 对象判空

 @param object 对象
 @return 是否为空
 */
#ifndef YJObjectIsEmpty
#define YJObjectIsEmpty(object)  (object == nil||[object isKindOfClass:[NSNull class]]||([object respondsToSelector:@selector(length)] && [(NSData *)object length] == 0)|| ([object respondsToSelector:@selector(count)] && [(NSArray *)object count] == 0)?YES:NO)
#endif
#ifndef YJObjectNotEmpty
#define YJObjectNotEmpty(object)       (!YJObjectIsEmpty(object))
#endif

#endif /* WYJEmptyMacro_h */
