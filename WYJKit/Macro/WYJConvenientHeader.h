/*
 Created by 祎 on 2021
 Copyright © 2021年 祎. All rights reserved.
 GitHub: https://github.com/MemoryKing
 */

#ifndef WYJConvenientHeader_h
#define WYJConvenientHeader_h

///url
#ifndef URL_WITH_STRING
#define URL_WITH_STRING(urlString)        [NSURL URLWithString:urlString]
#endif
///int转字符串
#ifndef INT_TO_STRING
#define INT_TO_STRING(i)                  [NSString stringWithFormat:@"%d",i]
#endif
///integer转字符串
#ifndef INTEGER_TO_STRING
#define INTEGER_TO_STRING(i)              [NSString stringWithFormat:@"%zd",i]
#endif
///longint转字符串
#ifndef LONGINT_TO_STRING
#define LONGINT_TO_STRING(i)              [NSString stringWithFormat:@"%zd",i]
#endif
///double转字符串
#ifndef DOUBLE_TO_STRING
#define DOUBLE_TO_STRING(i)               [NSString stringWithFormat:@"%f",i]
#endif
///字符串拼接
#ifndef STRING_WITH_FORMAT
#define STRING_WITH_FORMAT(str)           [NSString stringWithFormat:@"%@",str]
#endif

///图片
#ifndef IMAGENAME
#define IMAGENAME(name)                [UIImage imageWithNamed:name];
#endif


#endif /* WYJConvenientHeader_h */
