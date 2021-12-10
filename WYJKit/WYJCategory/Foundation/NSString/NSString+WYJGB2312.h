/*
 Created by King on 2021
 Copyright © 2021年 King. All rights reserved.
 */

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (WYJGB2312)
///转成utf8Data
- (NSData *)yi_UTF8WithGB2312Data:(NSData *)gb2312Data;
///转成gb2312Data
- (NSData *)yi_GB2312WithUTF8Data:(NSData *)UTF8Data;
@end

NS_ASSUME_NONNULL_END
