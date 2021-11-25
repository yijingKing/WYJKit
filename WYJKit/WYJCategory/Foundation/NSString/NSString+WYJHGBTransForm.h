/*
  Created by 祎 on 2021
  Copyright © 2021年 祎. All rights reserved.
  GitHub: https://github.com/MemoryKing
*/

#import <Foundation/Foundation.h>

@interface NSString (WYJHGBTransForm)

/**
 十六进制转换为普通字符串的
 @return 普通字符串
 */
- (NSString *)yi_stringFromHexString;
/**
 普通字符串转换为十六进制的
 
 @return 十六进制字符串
 */
- (NSString *)yi_hexString;

/**
 *  身份证号码转生日
 *
 *
 *  @return 生日
 */
-(NSString *)yi_idCardNumTransToBirthday;


@end
