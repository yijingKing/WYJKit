/*
  Created by King on 2021
  Copyright © 2021年 King. All rights reserved.
*/


#import "UIView+WYJAdd.h"
#import <objc/runtime.h>
#import "NSObject+WYJWindow.h"

@implementation UIView (WYJAdd)

- (void)yi_roundeConrners:(UIRectCorner)rectCon cornerRadii:(CGSize)size {
    UIBezierPath* rounded = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:rectCon cornerRadii:size];
    CAShapeLayer* shape = [[CAShapeLayer alloc] init];
    [shape setPath:rounded.CGPath];
    self.layer.mask = shape;
}

- (void)yi_shadowsColor:(UIColor *)color size:(CGSize)size radius:(CGFloat)radius opacity:(CGFloat)opacity {
    self.layer.shadowColor = color.CGColor;
    self.layer.shadowOffset = size;
    self.layer.shadowRadius = radius;
    self.layer.shadowOpacity = opacity;
}

- (nullable UIView *)yi_imageFromSize:(CGSize)size Colors:(NSArray*)colors byGradientType:(WYJGradientType)gradientType {
    
    UIImage * image = [UIImage yi_imageFromSize:size Colors:colors byGradientType:gradientType];
    
    UIColor * color = [UIColor colorWithPatternImage:image];
    self.backgroundColor = color;
    return self;
}

- (void)yi_removeAllSubviews {
    while (self.subviews.count) {
        [self.subviews.lastObject removeFromSuperview];
    }
}

- (nullable UIViewController *)yi_viewController {
    return [self yi_currentViewController];
}




@end
