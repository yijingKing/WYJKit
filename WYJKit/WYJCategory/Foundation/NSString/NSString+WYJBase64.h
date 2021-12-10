/*
  Created by King on 2021
  Copyright © 2021年 King. All rights reserved.
*/

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (WYJBase64)
///base64加密
+(NSString *)yi_base64EncodingWithData:(NSData *)sourceData;
///base64解密
+(NSData *)yi_base64EncodingWithString:(NSString *)sourceString;
@end

NS_ASSUME_NONNULL_END
