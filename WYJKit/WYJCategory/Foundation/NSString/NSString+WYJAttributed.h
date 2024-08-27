/*
  Created by 祎 on 2021
  Copyright © 2021年 祎. All rights reserved.
*/

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (WYJAttributed)
- (NSAttributedString *)attributedFontWithTargetString:(NSString *)targetString
                                                fontSize:(CGFloat)fontSize;
@end

NS_ASSUME_NONNULL_END
