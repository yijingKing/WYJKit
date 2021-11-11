//
//  WYJNavigationButton.m
//  iOS_WYJCodeWarehouse
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/11/14.
//  Copyright © 2018 ╰莪呮想好好宠Nǐつ. All rights reserved.
//

#import "WYJNavigationButton.h"

static CGFloat HightlightButtonHighlightedAlpha = 0.49872f;
@interface WYJNavigationButton() {
    CGFloat _originalAlpha;
}
@end
@implementation WYJNavigationButton
+ (instancetype)buttonWithTarget:(id)target action:(SEL)action {
    return [self buttonWithImage:nil title:nil color:nil target:target action:action];
}
+ (instancetype)buttonWithTitle:(NSString *)title target:(id)target action:(SEL)action {
    return [self buttonWithTitle:title color:nil target:target action:action];
}
+ (instancetype)buttonWithImage:(UIImage *)image target:(id)target action:(SEL)action {
    return [self buttonWithImage:image title:nil color:nil target:target action:action];
}
+ (instancetype)buttonWithTitle:(NSString *)title color:(UIColor *)color target:(id)target action:(SEL)action {
    return [self buttonWithImage:nil title:title color:color target:target action:action];
}
+ (instancetype)buttonWithImage:(UIImage *)image title:(NSString *)title color:(UIColor *)color target:(id)target action:(SEL)action {
    WYJNavigationButton *button = [self buttonWithType:UIButtonTypeCustom];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    if (image) {
        [button setImage:image forState:UIControlStateNormal];
    }
    if (title) {
        [button setTitle:title forState:UIControlStateNormal];
    }
    if (color) {
        [button setTitleColor:color forState:UIControlStateNormal];
    }
    [button sizeToFit];
    return button;
}
+ (instancetype)buttonWithType:(UIButtonType)buttonType {
    WYJNavigationButton *button = [super buttonWithType:buttonType];
    if (button) {
        [button setup];
    }
    return button;
}
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self setup];
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}
- (void)setup {
    if ([self autoHighligted]) {
        self.adjustsImageWhenHighlighted = NO;
        self.reversesTitleShadowWhenHighlighted = NO;
        
#define autoSetStateHighlighted(getter, setter) {\
if ([super getter:UIControlStateSelected] != [super getter:UIControlStateNormal]) {\
[super setter:[super getter:UIControlStateSelected]\
forState:UIControlStateSelected | UIControlStateHighlighted];\
}\
if ([super getter:UIControlStateDisabled] != [super getter:UIControlStateNormal]) {\
[super setter:[super getter:UIControlStateDisabled]\
forState:UIControlStateDisabled | UIControlStateHighlighted];\
}\
if ([super getter:UIControlStateSelected|UIControlStateDisabled] != [super getter:UIControlStateNormal]) {\
[super setter:[super getter:UIControlStateSelected|UIControlStateDisabled]\
forState:UIControlStateDisabled | UIControlStateHighlighted];\
}\
}
        
        autoSetStateHighlighted(imageForState, setImage)
        autoSetStateHighlighted(backgroundImageForState, setBackgroundImage)
        autoSetStateHighlighted(titleColorForState, setTitleColor)
        autoSetStateHighlighted(titleForState, setTitle)
        autoSetStateHighlighted(titleShadowColorForState, setTitleShadowColor)
    }
}

#define autoSynchronization(setter, type) \
- (void)setter:(type *)obj forState:(UIControlState)state {\
[super setter:obj forState:state];\
\
if (UIButtonTypeCustom == self.buttonType\
&& !(state & UIControlStateHighlighted)\
&& (state & (UIControlStateDisabled | UIControlStateSelected))) {\
[super setter:obj forState:state | UIControlStateHighlighted];\
}\
}
autoSynchronization(setImage, UIImage)
autoSynchronization(setBackgroundImage, UIImage)
autoSynchronization(setTitle, NSString)
autoSynchronization(setAttributedTitle, NSAttributedString)
autoSynchronization(setTitleColor, UIColor)
autoSynchronization(setTitleShadowColor, UIColor)

- (BOOL)autoHighligted {
    return (UIButtonTypeCustom == self.buttonType
            && [super imageForState:UIControlStateHighlighted] == [super imageForState:UIControlStateNormal]
            && [super backgroundImageForState:UIControlStateHighlighted] == [super backgroundImageForState:UIControlStateNormal]
            && [super titleColorForState:UIControlStateHighlighted] == [super titleColorForState:UIControlStateNormal]
            && [super titleShadowColorForState:UIControlStateHighlighted] == [super titleShadowColorForState:UIControlStateNormal]);
}

- (void)setHighlighted:(BOOL)highlighted {
    [super setHighlighted:highlighted];
    
    if ([self autoHighligted]) {
        if (HightlightButtonHighlightedAlpha != self.alpha) {
            _originalAlpha = self.alpha;
        }
        self.alpha = highlighted ? HightlightButtonHighlightedAlpha : _originalAlpha;
    }
}

@end

@implementation WYJBarButton
- (void)setup
{
    [super setup];
    if ([UIBarButtonItem appearance].tintColor) {
        [self setTintColor:[UIBarButtonItem appearance].tintColor];
    }
    NSDictionary *dic = [[UIBarButtonItem appearance] titleTextAttributesForState:UIControlStateNormal];
    if (dic[NSForegroundColorAttributeName]) {
        [self setTitleColor:dic[NSForegroundColorAttributeName] forState:UIControlStateNormal];
    }
    else {
        [self setTitleColor:[UIColor colorWithRed:(0x44/255.0f) green:(0x44/255.0f) blue:(0x44/255.0f) alpha:1.0f] forState:UIControlStateNormal];
    }
    if (dic[NSFontAttributeName]) {
        [self.titleLabel setFont:dic[NSFontAttributeName]];
    }
    else {
        [self.titleLabel setFont:[UIFont systemFontOfSize:16]];
    }
}

@end
