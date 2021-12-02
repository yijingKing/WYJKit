/*
  Created by 祎 on 2021
  Copyright © 2021年 祎. All rights reserved.
*/
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (WYJEncode)
//编码
- (NSString *)yi_urlEncodeWithUTF8;
- (NSString *)yi_urlEncodeWithUTF8:(NSCharacterSet *)characterSet;
//解码
- (NSString *)yi_urlDecodeWithUTF8;
@end

NS_ASSUME_NONNULL_END
