/*
  Created by 祎 on 2021
  Copyright © 2021年 祎. All rights reserved.
*/

#import "UIView+WYJXib.h"
#import <objc/runtime.h>
@implementation UIView (WYJXib)

- (void)setCornerRadius:(CGFloat)cornerRadius {
    self.layer.cornerRadius = cornerRadius;
    objc_setAssociatedObject(self, @selector(cornerRadius), @(cornerRadius), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (CGFloat)cornerRadius {
    return [objc_getAssociatedObject(self, @selector(cornerRadius)) floatValue];
}

- (void)setMasksToBounds:(BOOL)masksToBounds {
    self.layer.masksToBounds = masksToBounds;
    objc_setAssociatedObject(self, @selector(masksToBounds), @(masksToBounds), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (BOOL)masksToBounds {
    return [objc_getAssociatedObject(self, @selector(masksToBounds)) boolValue];
}



@end
