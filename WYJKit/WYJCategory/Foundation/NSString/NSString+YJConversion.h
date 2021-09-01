/*******************************************************************************
 Copyright (K), 2019 - ~, ╰莪呮想好好宠Nǐつ
 
 Author:        ╰莪呮想好好宠Nǐつ (Wang Yijing)
 E-mail:        1091676312@qq.com
 GitHub:        https://github.com/MemoryKing
 ********************************************************************************/


#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (YJConversion)
/// 阿拉伯数字转换成中文
+ (NSString *)digitalConversionNumber:(int)number;
    
///汉语数字转阿拉伯数字
+(NSString *)chaptersDealWithString:(NSString *)chapterStr;
    
@end

NS_ASSUME_NONNULL_END
