/*******************************************************************************
 Copyright (K), 2019 - ~, ╰莪呮想好好宠Nǐつ
 
 Author:        ╰莪呮想好好宠Nǐつ (Wang Yijing)
 E-mail:        1091676312@qq.com
 GitHub:        https://github.com/MemoryKing
 ********************************************************************************/

#import "NSString+WYJEncode.h"

@implementation NSString (WYJEncode)
//编码
- (NSString *)urlEncodeWithUTF8 {
    return [self urlEncodeWithUTF8:NSCharacterSet.URLQueryAllowedCharacterSet];
}
- (NSString *)urlEncodeWithUTF8:(NSCharacterSet *)characterSet {
    NSString *encoderStr = [self stringByAddingPercentEncodingWithAllowedCharacters:characterSet];
    return encoderStr;
}

//解码
- (NSString *)urlDecodeWithUTF8 {
    return [self stringByRemovingPercentEncoding];
}
@end
