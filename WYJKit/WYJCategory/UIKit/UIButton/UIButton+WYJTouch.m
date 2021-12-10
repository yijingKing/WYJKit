//
//  UIButton+WYJTouch.m
/*
  Created by King on 2021
  Copyright © 2021年 King. All rights reserved.
*/
#import "UIButton+WYJTouch.h"
#import <objc/runtime.h>

@implementation UIButton (WYJTouch)

- (UIEdgeInsets)yi_touchAreaInsets {
    return [objc_getAssociatedObject(self, @selector(yi_touchAreaInsets)) UIEdgeInsetsValue];
}
/**
 *  @brief  设置按钮额外热区
 */
- (void)setYi_touchAreaInsets:(UIEdgeInsets)yi_touchAreaInsets {
    NSValue *value = [NSValue valueWithUIEdgeInsets:yi_touchAreaInsets];
    objc_setAssociatedObject(self, @selector(yi_touchAreaInsets), value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    UIEdgeInsets touchAreaInsets = self.yi_touchAreaInsets;
    CGRect bounds = self.bounds;
    bounds = CGRectMake(bounds.origin.x - touchAreaInsets.left,
                        bounds.origin.y - touchAreaInsets.top,
                        bounds.size.width + touchAreaInsets.left + touchAreaInsets.right,
                        bounds.size.height + touchAreaInsets.top + touchAreaInsets.bottom);
    return CGRectContainsPoint(bounds, point);
}

@end
