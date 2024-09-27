/*
  Created by 祎 on 2021
  Copyright © 2021年 祎. All rights reserved.
*/


#import "UIView+WYJAdd.h"
#import <objc/runtime.h>
#import "NSObject+WYJWindow.h"

@implementation UIView (WYJAdd)
- (void)yi_roundeConrners:(UIRectCorner)rectCon radii:(CGFloat)radii {
    [self yi_roundeConrners:rectCon cornerRadii:CGSizeMake(radii, radii)];
}
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
- (void)yi_addBorderToSide:(UIRectEdge)side color:(UIColor *)color lineWidth:(CGFloat)lineWidth {
    CAShapeLayer *border = [CAShapeLayer layer];
        border.strokeColor = color.CGColor;
        border.fillColor = [UIColor clearColor].CGColor;
        border.lineWidth = lineWidth;

        UIBezierPath *path = [UIBezierPath bezierPath];
        CGFloat width = CGRectGetWidth(self.bounds);
        CGFloat height = CGRectGetHeight(self.bounds);

        switch (side) {
            case UIRectEdgeTop:
                [path moveToPoint:CGPointMake(0, 0)];
                [path addLineToPoint:CGPointMake(width, 0)];
                break;

            case UIRectEdgeBottom:
                [path moveToPoint:CGPointMake(0, height)];
                [path addLineToPoint:CGPointMake(width, height)];
                break;

            case UIRectEdgeLeft:
                [path moveToPoint:CGPointMake(0, 0)];
                [path addLineToPoint:CGPointMake(0, height)];
                break;

            case UIRectEdgeRight:
                [path moveToPoint:CGPointMake(width, 0)];
                [path addLineToPoint:CGPointMake(width, height)];
                break;

            default:
                break;
        }

        border.path = path.CGPath;
        [self.layer addSublayer:border];
}

- (void)yi_addMorseEffectWithAlpha:(CGFloat)alpha {
    // 检查是否已经有模糊效果，避免重复添加
    if ([self viewWithTag:9999]) {
        return;
    }
    
    // 创建模糊效果
    UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    UIVisualEffectView *blurEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
    
    // 设置模糊视图的透明度
    blurEffectView.alpha = alpha; // 设置透明度，0.0 到 1.0 范围，越小透明度越高
    
    // 设置模糊视图的尺寸与父视图一致
    blurEffectView.frame = self.bounds;
    blurEffectView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    // 给模糊视图设置唯一标识，避免重复添加
    blurEffectView.tag = 9999;
    
    // 将模糊视图添加到目标视图上
    [self addSubview:blurEffectView];
}

@end
