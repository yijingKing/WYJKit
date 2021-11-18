/*
  Created by 祎 on 2021
  Copyright © 2021年 祎. All rights reserved.
  GitHub: https://github.com/MemoryKing
*/

#import <Foundation/Foundation.h>


@interface NSString (WYJConversion)
/// 阿拉伯数字转换成中文
+ (NSString *)digitalConversionNumber:(int)number;
    
///汉语数字转阿拉伯数字
+(NSString *)chaptersDealWithString:(NSString *)chapterStr;

///转换成数组-> ","分割
- (NSArray *)toArray;
///转换成数组
- (NSArray *)toArrayByString:(NSString *)string;
@end


