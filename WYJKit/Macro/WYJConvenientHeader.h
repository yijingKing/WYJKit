/*
 Created by 祎 on 2021
 Copyright © 2021年 祎. All rights reserved.
 */

#ifndef WYJConvenientHeader_h
#define WYJConvenientHeader_h

///url
#ifndef YJURL_WITH_STRING
#define YJURL_WITH_STRING(urlString)        [NSURL URLWithString:urlString]
#endif
///int转字符串
#ifndef YJINT_TO_STRING
#define YJINT_TO_STRING(i)                  [NSString stringWithFormat:@"%d",i]
#endif
///integer转字符串
#ifndef YJINTEGER_TO_STRING
#define YJINTEGER_TO_STRING(i)              [NSString stringWithFormat:@"%zd",i]
#endif
///longint转字符串
#ifndef YJLONGINT_TO_STRING
#define YJLONGINT_TO_STRING(i)              [NSString stringWithFormat:@"%zd",i]
#endif
///double转字符串
#ifndef YJDOUBLE_TO_STRING
#define YJDOUBLE_TO_STRING(i)               [NSString stringWithFormat:@"%f",i]
#endif
///字符串拼接
#ifndef YJSTRING_WITH_FORMAT
#define YJSTRING_WITH_FORMAT(str)           [NSString stringWithFormat:@"%@",str]
#endif

///图片
#ifndef YJIMAGENAME
#define YJIMAGENAME(name)                [UIImage imageWithNamed:name];
#endif


#endif /* WYJConvenientHeader_h */
