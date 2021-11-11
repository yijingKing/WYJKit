/*******************************************************************************
 Copyright (K), 2019 - ~, ╰莪呮想好好宠Nǐつ
 
 Author:        ╰莪呮想好好宠Nǐつ (Wang Yijing)
 E-mail:        1091676312@qq.com
 GitHub:        https://github.com/MemoryKing
 ********************************************************************************/

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (WYJEncode)
//编码
- (NSString *)urlEncodeWithUTF8;
- (NSString *)urlEncodeWithUTF8:(NSCharacterSet *)characterSet;
//解码
- (NSString *)urlDecodeWithUTF8;
@end

NS_ASSUME_NONNULL_END
