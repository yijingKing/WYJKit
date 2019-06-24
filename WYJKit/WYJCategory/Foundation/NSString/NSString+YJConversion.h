//
//  NSString+YJConversion.h
//  YJKitDemo
//
//  Created by 祎 on 2019/6/24.
//  Copyright © 2019 Eugene King. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (YJConversion)
/// 阿拉伯数字转换成中文
+ (NSString *)digitalConversionNumber:(int)number;
    
///汉语数字转阿拉伯数字
+(NSString *)chaptersDealWithString:(NSString *)chapterStr;
@end

NS_ASSUME_NONNULL_END
