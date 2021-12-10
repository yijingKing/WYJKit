/*
  Created by King on 2021
  Copyright © 2021年 King. All rights reserved.
*/

#import "NSString+WYJBase64.h"

@implementation NSString (WYJBase64)
///base64加密
+(NSString *)yi_base64EncodingWithData:(NSData *)sourceData {
    if (!sourceData) { //如果sourceData则返回nil，不进行加密。
        return nil;
    }
    NSString *resultString = [sourceData base64EncodedStringWithOptions: NSDataBase64Encoding64CharacterLineLength];
    return resultString;
    
}

///base64解密
+(NSData *)yi_base64EncodingWithString:(NSString *)sourceString {
    if (!sourceString) {
        return nil;//如果sourceString则返回nil，不进行解密。
    }
    NSData *resultData = [[NSData alloc]initWithBase64EncodedString:sourceString options:NSDataBase64DecodingIgnoreUnknownCharacters];
    return resultData;
    
}
@end
