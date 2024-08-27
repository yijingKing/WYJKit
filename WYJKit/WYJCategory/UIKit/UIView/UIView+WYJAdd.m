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


- (void)yi_addBorderToSide:(UIRectEdge)side color:(UIColor *)color thickness:(CGFloat)thickness cornerRadius:(CGFloat)cornerRadius corners:(UIRectCorner)corners {
    CAShapeLayer *borderLayer = [CAShapeLayer layer];
    borderLayer.strokeColor = color.CGColor;
    borderLayer.fillColor = [UIColor clearColor].CGColor;
    borderLayer.lineWidth = thickness;
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    CGFloat width = CGRectGetWidth(self.bounds);
    CGFloat height = CGRectGetHeight(self.bounds);
    
    switch (side) {
        case UIRectEdgeTop:
            [path moveToPoint:CGPointMake(0, thickness)];
            if (corners & UIRectCornerTopLeft) {
                [path addArcWithCenter:CGPointMake(cornerRadius, cornerRadius) radius:cornerRadius startAngle:M_PI endAngle:3*M_PI/2 clockwise:YES];
            } else {
                [path addLineToPoint:CGPointMake(0, 0)];
                [path addLineToPoint:CGPointMake(cornerRadius, 0)];
            }
            if (corners & UIRectCornerTopRight) {
                [path addLineToPoint:CGPointMake(width - cornerRadius, 0)];
                [path addArcWithCenter:CGPointMake(width - cornerRadius, cornerRadius) radius:cornerRadius startAngle:3*M_PI/2 endAngle:0 clockwise:YES];
            } else {
                [path addLineToPoint:CGPointMake(width, 0)];
                [path addLineToPoint:CGPointMake(width, thickness)];
            }
            [path addLineToPoint:CGPointMake(0, thickness)];
            break;
            
        case UIRectEdgeBottom:
            [path moveToPoint:CGPointMake(0, height - thickness)];
            if (corners & UIRectCornerBottomLeft) {
                [path addArcWithCenter:CGPointMake(cornerRadius, height - cornerRadius) radius:cornerRadius startAngle:M_PI/2 endAngle:M_PI clockwise:YES];
            } else {
                [path addLineToPoint:CGPointMake(0, height)];
                [path addLineToPoint:CGPointMake(cornerRadius, height)];
            }
            if (corners & UIRectCornerBottomRight) {
                [path addLineToPoint:CGPointMake(width - cornerRadius, height)];
                [path addArcWithCenter:CGPointMake(width - cornerRadius, height - cornerRadius) radius:cornerRadius startAngle:0 endAngle:M_PI/2 clockwise:YES];
            } else {
                [path addLineToPoint:CGPointMake(width, height)];
                [path addLineToPoint:CGPointMake(width, height - thickness)];
            }
            [path addLineToPoint:CGPointMake(0, height - thickness)];
            break;
            
        case UIRectEdgeLeft:
            [path moveToPoint:CGPointMake(thickness, height)];
            if (corners & UIRectCornerBottomLeft) {
                [path addArcWithCenter:CGPointMake(cornerRadius, height - cornerRadius) radius:cornerRadius startAngle:M_PI/2 endAngle:M_PI clockwise:YES];
            } else {
                [path addLineToPoint:CGPointMake(0, height)];
                [path addLineToPoint:CGPointMake(0, height - cornerRadius)];
            }
            if (corners & UIRectCornerTopLeft) {
                [path addLineToPoint:CGPointMake(0, cornerRadius)];
                [path addArcWithCenter:CGPointMake(cornerRadius, cornerRadius) radius:cornerRadius startAngle:M_PI endAngle:3*M_PI/2 clockwise:YES];
            } else {
                [path addLineToPoint:CGPointMake(0, 0)];
                [path addLineToPoint:CGPointMake(thickness, 0)];
            }
            [path addLineToPoint:CGPointMake(thickness, height)];
            break;
            
        case UIRectEdgeRight:
            [path moveToPoint:CGPointMake(width - thickness, 0)];
            if (corners & UIRectCornerTopRight) {
                [path addArcWithCenter:CGPointMake(width - cornerRadius, cornerRadius) radius:cornerRadius startAngle:3*M_PI/2 endAngle:0 clockwise:YES];
            } else {
                [path addLineToPoint:CGPointMake(width, 0)];
                [path addLineToPoint:CGPointMake(width, cornerRadius)];
            }
            if (corners & UIRectCornerBottomRight) {
                [path addLineToPoint:CGPointMake(width, height - cornerRadius)];
                [path addArcWithCenter:CGPointMake(width - cornerRadius, height - cornerRadius) radius:cornerRadius startAngle:0 endAngle:M_PI/2 clockwise:YES];
            } else {
                [path addLineToPoint:CGPointMake(width, height)];
                [path addLineToPoint:CGPointMake(width - thickness, height)];
            }
            [path addLineToPoint:CGPointMake(width - thickness, 0)];
            break;
            
        default:
            break;
    }
    
    borderLayer.path = path.CGPath;
    [self.layer addSublayer:borderLayer];
}

@end
