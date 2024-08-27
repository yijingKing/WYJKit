/*
  Created by 祎 on 2021
  Copyright © 2021年 祎. All rights reserved.
*/

#import "NSString+WYJAttributed.h"
#import "WYJKitHeader.h"
@implementation NSString (WYJAttributed)
- (NSAttributedString *)attributedFontWithTargetString:(NSString *)targetString
                                              fontSize:(CGFloat)fontSize {
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:self];
    NSRange targetRange = [self rangeOfString:targetString];
    if (targetRange.location != NSNotFound) {
        NSDictionary *attributes = @{NSFontAttributeName: WYJSysFontWithSizes(fontSize)};
        [attributedString addAttributes:attributes range:targetRange];
    }
    return attributedString;
}
@end
