/*******************************************************************************
 Copyright (K), 2019 - ~, ╰莪呮想好好宠Nǐつ 
 
 Author:        ╰莪呮想好好宠Nǐつ (Wang Yijing)
 E-mail:        1091676312@qq.com
 GitHub:        https://github.com/MemoryKing
 ********************************************************************************/


#import "NSString+YJMD5.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (YJMD5)
- (NSString *)MD5Bits16LowercaseEncryption
{
    return [NSString MD5_NB16BitEncry:self isUppercase:NO];
}
- (NSString *)MD5Bits16UppercaseEncryption
{
    return [NSString MD5_NB16BitEncry:self isUppercase:YES];
}
- (NSString *)MD5Bits32LowercaseEncryption
{
    return [NSString MD5_NB32BitEncry:self isUppercase:NO];
}
- (NSString *)MD5Bits32UppercaseEncryption
{
    return [NSString MD5_NB32BitEncry:self isUppercase:YES];
}

- (NSString *)base64Decryption {
    return [NSString base64EncodingWithString:self];
}

+ (NSString *)MD5_16BitEncry:(NSString *)MD5String isUppercase:(BOOL)isUppercase {
    //提取32位MD5散列的中间16位
    NSString *md5_32Bit_String = [self MD5_32BitEncry:MD5String isUppercase:NO];
    NSString *result = [[md5_32Bit_String substringToIndex:24] substringFromIndex:8];//即9～25位
    
    if (isUppercase) {
        return [result uppercaseString];
    }else{
        return result;
    }
}

+ (NSString *)MD5_NB16BitEncry:(NSString *)MD5String isUppercase:(BOOL)isUppercase {
    
    //提取32位MD5散列的中间16位
    NSString *md5_32Bit_String=[self MD5_NB32BitEncry:MD5String isUppercase:NO];
    NSString *result = [[md5_32Bit_String substringToIndex:24] substringFromIndex:8];//即9～25位
    
    if (isUppercase) {
        return [result uppercaseString];
    }else{
        return result;
    }
}

+ (NSString *)MD5_32BitEncry:(NSString *)MD5String isUppercase:(BOOL)isUppercase {
    
    const char *str = [MD5String UTF8String];
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5( str, (CC_LONG)MD5String.length, digest );
    //CC_MD5(str, (CC_LONG)strlen(str), digest);
    NSMutableString *result = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [result appendFormat:@"%02x", digest[i]];
    
    if (isUppercase) {
        return [result uppercaseString];
    }else{
        return result;
    }
}

+ (NSString *)MD5_NB32BitEncry:(NSString *)MD5String isUppercase:(BOOL)isUppercase {
    
    const char *cStr = [MD5String UTF8String];
    
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    
    CC_MD5(cStr, (CC_LONG)strlen(cStr), digest);
    
    NSMutableString *result = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    
    [result appendFormat:@"%02x",digest[0]];
    
    for (int i = 1; i< CC_MD5_DIGEST_LENGTH; i++) {
        
        [result appendFormat:@"%02x",digest[i]^digest[0]];
        
    }
    
    if (isUppercase) {
        return [result uppercaseString];
    }else{
        return result;
    }
}

+(NSString *)base64EncodingWithData:(NSData *)sourceData{
    if (!sourceData) { //如果sourceData则返回nil，不进行加密。
        return nil;
    }
    NSString *resultString = [sourceData base64EncodedStringWithOptions: NSDataBase64Encoding64CharacterLineLength];
    return resultString;
    
}
//***base64解密***//
+(id)base64EncodingWithString:(NSString *)sourceString{
    if (!sourceString)
    {
        return nil;//如果sourceString则返回nil，不进行解密。
    }
    NSData *resultData = [[NSData alloc]initWithBase64EncodedString:sourceString options:NSDataBase64DecodingIgnoreUnknownCharacters];
    return resultData;
    
}
@end
