/*
  Created by 祎 on 2021
  Copyright © 2021年 祎. All rights reserved.
*/

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSArray (WYJConversion)
///转成字符串,默认","拼接
- (NSString *)yi_toString;
- (NSString *)yi_toStringBy:(NSString *)string;
@end

NS_ASSUME_NONNULL_END
