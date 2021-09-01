/*******************************************************************************
 Copyright (K), 2019 - ~, ╰莪呮想好好宠Nǐつ 
 
 Author:        ╰莪呮想好好宠Nǐつ (Wang Yijing)
 E-mail:        1091676312@qq.com
 GitHub:        https://github.com/MemoryKing
 ********************************************************************************/


#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (YJMD5)
/** 16位MD5加密--小写 */
@property (nonatomic, copy,readonly)NSString * MD5Bits16LowercaseEncryption;
/** 16位MD5加密--大写 */
@property (nonatomic, copy,readonly)NSString * MD5Bits16UppercaseEncryption;
/** 32位MD5加密--小写 */
@property (nonatomic, copy,readonly)NSString * MD5Bits32LowercaseEncryption;
/** 32位MD5加密--大写 */
@property (nonatomic, copy,readonly)NSString * MD5Bits32UppercaseEncryption;
/** base64 decryption */
@property (nonatomic, copy,readonly)NSString * base64Decryption;


+ (NSString *)MD5_16BitEncry:(NSString *)MD5String isUppercase:(BOOL)isUppercase;
+ (NSString *)MD5_NB16BitEncry:(NSString *)MD5String isUppercase:(BOOL)isUppercase;
+ (NSString *)MD5_32BitEncry:(NSString *)MD5String isUppercase:(BOOL)isUppercase;
+ (NSString *)MD5_NB32BitEncry:(NSString *)MD5String isUppercase:(BOOL)isUppercase;
//***base64加密***//
+(NSString *)base64EncodingWithData:(NSData *)sourceData;
//***base64解密***//
+(id)base64EncodingWithString:(NSString *)sourceString;
- (NSString *)yi;
@end




NS_ASSUME_NONNULL_END
