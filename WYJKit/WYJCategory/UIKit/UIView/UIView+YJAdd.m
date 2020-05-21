/*******************************************************************************
 Copyright (K), 2019 - ~, ╰莪呮想好好宠Nǐつ 
 
 Author:        ╰莪呮想好好宠Nǐつ (Wang Yijing)
 E-mail:        1091676312@qq.com
 GitHub:        https://github.com/MemoryKing
 ********************************************************************************/


#import "UIView+YJAdd.h"
#import <objc/runtime.h>

static const char ViewClickBlockKey;
typedef void(^ViewClickBlock)(void);

@implementation UIView (YJAdd)

- (void)yi_addTouchUpInside:(void(^)(void))block {
    if (block) {
        self.userInteractionEnabled = YES;
        objc_setAssociatedObject(self, &ViewClickBlockKey, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
        UITapGestureRecognizer * tap = [UITapGestureRecognizer.alloc initWithTarget:self action:@selector(yi_touchupInside)];
        [self addGestureRecognizer:tap];
    }
}

- (void)yi_touchupInside {
    ViewClickBlock block = objc_getAssociatedObject(self, &ViewClickBlockKey);
    block();
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

- (UIView *)yi_imageFromSize:(CGSize)size Colors:(NSArray*)colors byGradientType:(GradientType)gradientType {
    
    UIImage * image = [UIImage yi_imageFromSize:size Colors:colors byGradientType:gradientType];
    
    UIColor * color = [UIColor colorWithPatternImage:image];
    self.backgroundColor = color;
    return self;
}

- (void)yi_removeAllSubviews {
    //[self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    while (self.subviews.count) {
        [self.subviews.lastObject removeFromSuperview];
    }
}

@end
