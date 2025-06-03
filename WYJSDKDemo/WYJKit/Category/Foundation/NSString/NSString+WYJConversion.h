/*
  Created by 祎 on 2021
  Copyright © 2021年 祎. All rights reserved.
*/

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>
@interface NSString (WYJConversion)
/** base64 转 image */
@property (nonatomic, copy, readonly)UIImage * yi_base64ToImage;
/// 阿拉伯数字转换成中文
+ (NSString *)yi_digitalConversionNumber:(int)number;
    
///汉语数字转阿拉伯数字
+(NSString *)yi_chaptersDealWithString:(NSString *)chapterStr;

///转换成数组-> ","分割
- (NSArray *)yi_toArray;
///转换成数组
- (NSArray *)yi_toArrayByString:(NSString *)string;
///转换成data
- (NSData *)yi_toData;

/// 将十六进制字符串转换为 UIColor
- (UIColor *)yi_toColor;

@end


