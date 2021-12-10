/*
  Created by King on 2021
  Copyright © 2021年 King. All rights reserved.
*/

#import <Foundation/Foundation.h>

@interface NSString (WYJMD5)
/** 16位MD5加密--小写 */
@property (nonatomic, copy,readonly)NSString * yi_MD5Bits16LowercaseEncryption;
/** 16位MD5加密--大写 */
@property (nonatomic, copy,readonly)NSString * yi_MD5Bits16UppercaseEncryption;
/** 32位MD5加密--小写 */
@property (nonatomic, copy,readonly)NSString * yi_MD5Bits32LowercaseEncryption;
/** 32位MD5加密--大写 */
@property (nonatomic, copy,readonly)NSString * yi_MD5Bits32UppercaseEncryption;
/** base64 decryption */
@property (nonatomic, copy,readonly)NSString * yi_base64Decryption;

+ (NSString *)yi_MD5_16BitEncry:(NSString *)MD5String isUppercase:(BOOL)isUppercase;
+ (NSString *)yi_MD5_NB16BitEncry:(NSString *)MD5String isUppercase:(BOOL)isUppercase;
+ (NSString *)yi_MD5_32BitEncry:(NSString *)MD5String isUppercase:(BOOL)isUppercase;
+ (NSString *)yi_MD5_NB32BitEncry:(NSString *)MD5String isUppercase:(BOOL)isUppercase;

@end





