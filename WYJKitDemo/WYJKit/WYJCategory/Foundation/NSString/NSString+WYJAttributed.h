/*
  Created by 祎 on 2021
  Copyright © 2021年 祎. All rights reserved.
*/

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface NSString (WYJAttributed)

- (NSAttributedString *)yi_attributedFontWithTargetString:(nullable NSString *)targetString
                                                 fontSize:(nullable UIFont *)fontSize;

- (NSAttributedString *)yi_attributedFontWithTargetString:(nullable NSString *)targetString
                                                 fontSize:(nullable UIFont *)fontSize
                                                    color:(nullable UIColor *)color;
@end

NS_ASSUME_NONNULL_END
