//
//  UIStackView+YJRemove.m
//  LCProduct
//
//  Created by 祎 on 2024/12/25.
//

#import "UIStackView+YJRemove.h"

@implementation UIStackView (YJRemove)

- (void)yi_removeAllArranged {
    for (UIView *subview in self.arrangedSubviews) {
        [self removeArrangedSubview:subview];
        [subview removeFromSuperview];
    }
}

@end
