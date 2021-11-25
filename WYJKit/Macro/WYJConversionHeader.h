/*
 Created by 祎 on 2021
 Copyright © 2021年 祎. All rights reserved.
 GitHub: https://github.com/MemoryKing
 */

#ifndef WYJConversionHeader_h
#define WYJConversionHeader_h

#ifndef URL_WITH_STRING
#define URL_WITH_STRING(urlString)        [NSURL URLWithString:urlString]
#endif

#ifndef INT_TO_STRING
#define INT_TO_STRING(i)                  [NSString stringWithFormat:@"%d",i]
#endif

#ifndef INTEGER_TO_STRING
#define INTEGER_TO_STRING(i)              [NSString stringWithFormat:@"%zd",i]
#endif

#ifndef LONGINT_TO_STRING
#define LONGINT_TO_STRING(i)              [NSString stringWithFormat:@"%zd",i]
#endif

#ifndef DOUBLE_TO_STRING
#define DOUBLE_TO_STRING(i)               [NSString stringWithFormat:@"%f",i]
#endif

#ifndef STRING_TO_STRING
#define STRING_TO_STRING(str)             [NSString stringWithFormat:@"%@",str]
#endif



#endif /* WYJConversionHeader_h */
