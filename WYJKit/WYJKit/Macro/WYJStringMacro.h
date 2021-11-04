/*******************************************************************************
 Copyright (K), 2019 - ~, ╰莪呮想好好宠Nǐつ
 
 Author:        ╰莪呮想好好宠Nǐつ (Wang Yijing)
 E-mail:        1091676312@qq.com
 GitHub:        https://github.com/MemoryKing
 ********************************************************************************/


#ifndef WYJStringMacro_h
#define WYJStringMacro_h

/**
 字符串判空
 */
#ifndef WYJStringIsEmpty
#define WYJStringIsEmpty(string) ([string isKindOfClass:[NSNull class]] || string == nil || [string length] < 1 ? YES : NO )
#endif


#endif /* WYJStringMacro_h */
