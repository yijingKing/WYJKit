//
//  NSString+attributed.m
//  LCProduct
//
//  Created by 王祎境 on 2024/7/12.
//

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
