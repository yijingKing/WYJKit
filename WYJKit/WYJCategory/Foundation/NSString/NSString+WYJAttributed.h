//
//  NSString+attributed.h
//  LCProduct
//
//  Created by 王祎境 on 2024/7/12.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (WYJAttributed)
- (NSAttributedString *)attributedFontWithTargetString:(NSString *)targetString
                                                fontSize:(CGFloat)fontSize;
@end

NS_ASSUME_NONNULL_END
