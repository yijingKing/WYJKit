/*******************************************************************************
 Copyright (K), 2019 - ~, ╰莪呮想好好宠Nǐつ
 
 Author:        ╰莪呮想好好宠Nǐつ (Wang Yijing)
 E-mail:        1091676312@qq.com
 
 ********************************************************************************/


#import "UIView+YJAdd.h"
#import <objc/runtime.h>

static const char ViewClickBlockKey;
typedef void(^ViewClickBlock)(void);

@implementation UIView (YJAdd)

- (void)wAddTouchUpInside:(void(^)(void))block {
    if (block) {
        self.userInteractionEnabled = YES;
        objc_setAssociatedObject(self, &ViewClickBlockKey, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
        UITapGestureRecognizer * tap = [UITapGestureRecognizer.alloc initWithTarget:self action:@selector(touchupInside)];
        [self addGestureRecognizer:tap];
    }
}

- (void)touchupInside {
    ViewClickBlock block = objc_getAssociatedObject(self, &ViewClickBlockKey);
    block();
}

- (void)roundeConrners:(UIRectCorner)rectCon cornerRadii:(CGSize)size {
    UIBezierPath* rounded = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:rectCon cornerRadii:size];
    CAShapeLayer* shape = [[CAShapeLayer alloc] init];
    [shape setPath:rounded.CGPath];
    self.layer.mask = shape;
}

- (void)shadowsColor:(UIColor *)color size:(CGSize)size radius:(CGFloat)radius opacity:(CGFloat)opacity {
    self.layer.shadowColor = color.CGColor;
    self.layer.shadowOffset = size;
    self.layer.shadowRadius = radius;
    self.layer.shadowOpacity = opacity;
}

- (UIView *)imageFromSize:(CGSize)size Colors:(NSArray*)colors byGradientType:(GradientType)gradientType {
    
    UIImage * image = [UIImage imageFromSize:size Colors:colors byGradientType:gradientType];
    
    UIColor * color = [UIColor colorWithPatternImage:image];
    self.backgroundColor = color;
    return self;
}

- (void)removeAllSubviews {
    //[self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    while (self.subviews.count) {
        [self.subviews.lastObject removeFromSuperview];
    }
}

@end
