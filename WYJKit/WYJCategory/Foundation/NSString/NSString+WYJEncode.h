/*
  Created by 祎 on 2021
  Copyright © 2021年 祎. All rights reserved.
  GitHub: https://github.com/MemoryKing
*/
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
