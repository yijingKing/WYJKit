/*
  Created by King on 2021
  Copyright © 2021年 King. All rights reserved.
*/
#import "NSString+WYJEncode.h"

@implementation NSString (WYJEncode)
//编码
- (NSString *)yi_urlEncodeWithUTF8 {
    return [self yi_urlEncodeWithUTF8:NSCharacterSet.URLQueryAllowedCharacterSet];
}
- (NSString *)yi_urlEncodeWithUTF8:(NSCharacterSet *)characterSet {
    NSString *encoderStr = [self stringByAddingPercentEncodingWithAllowedCharacters:characterSet];
    return encoderStr;
}

//解码
- (NSString *)yi_urlDecodeWithUTF8 {
    return [self stringByRemovingPercentEncoding];
}
@end
