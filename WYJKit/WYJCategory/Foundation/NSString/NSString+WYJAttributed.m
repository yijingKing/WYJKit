/*
  Created by 祎 on 2021
  Copyright © 2021年 祎. All rights reserved.
*/

#import "NSString+WYJAttributed.h"
#import "WYJKitHeader.h"
@implementation NSString (WYJAttributed)
- (NSAttributedString *)yi_attributedFontWithTargetString:(nullable NSString *)targetString
                                                 fontSize:(nullable UIFont *)fontSize {
    [self yi_attributedFontWithTargetString:targetString fontSize:fontSize color:nil];
}
- (NSAttributedString *)yi_attributedFontWithTargetString:(nullable NSString *)targetString
                                                 fontSize:(nullable UIFont *)fontSize
                                                    color:(nullable UIColor *)color {
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:self];
    NSRange targetRange = [self rangeOfString:targetString];
    if (targetRange.location != NSNotFound) {
        if (fontSize) {
            NSDictionary *attributes = @{NSFontAttributeName: fontSize};
            [attributedString addAttributes:attributes range:targetRange];
        }
        if (color) {
            NSDictionary *attributes = @{NSForegroundColorAttributeName: color};
            [attributedString addAttributes:attributes range:targetRange];
        }
    }
    return attributedString;
}
@end
