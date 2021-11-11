/*******************************************************************************
 Copyright (K), 2019 - ~, ╰莪呮想好好宠Nǐつ
 
 Author:        ╰莪呮想好好宠Nǐつ (Wang Yijing)
 E-mail:        1091676312@qq.com
 GitHub:        https://github.com/MemoryKing
 ********************************************************************************/


#import <Foundation/Foundation.h>

@interface NSString (WYJHGBTransForm)

/**
 十六进制转换为普通字符串的
 @return 普通字符串
 */
- (NSString *)stringFromHexString;
/**
 普通字符串转换为十六进制的
 
 @return 十六进制字符串
 */
- (NSString *)hexString;

/**
 *  身份证号码转生日
 *
 *
 *  @return 生日
 */
-(NSString *)idCardNumTransToBirthday;


@end
