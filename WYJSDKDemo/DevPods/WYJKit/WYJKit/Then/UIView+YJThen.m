/*
 Created by 祎 on 2021
 Copyright © 2021年 祎. All rights reserved.
 */

#import "UIView+YJThen.h"

@interface YJViewMaker ()

@property (nonatomic, weak) UIView *view;

@end

@implementation YJViewMaker

- (instancetype)initWithView:(UIView *)view {
    if (self = [super init]) {
        _view = view;
        [self setupBlocks];
    }
    return self;
}

- (void)setupBlocks {
    __weak typeof(self) weakSelf = self;
    
    _backgroundColor = ^YJViewMaker *(UIColor *color) {
        weakSelf.view.backgroundColor = color;
        return weakSelf;
    };
    
    _frame = ^YJViewMaker *(CGRect frame) {
        weakSelf.view.frame = frame;
        return weakSelf;
    };
    
    _cornerRadius = ^YJViewMaker *(CGFloat radius) {
        weakSelf.view.layer.cornerRadius = radius;
        weakSelf.view.layer.masksToBounds = YES;
        return weakSelf;
    };
    
    _borderWidth = ^YJViewMaker *(CGFloat width) {
        weakSelf.view.layer.borderWidth = width;
        return weakSelf;
    };
    
    _borderColor = ^YJViewMaker *(UIColor *color) {
        weakSelf.view.layer.borderColor = color.CGColor;
        return weakSelf;
    };
    
    _clipsToBounds = ^YJViewMaker *(BOOL clipsToBounds) {
        weakSelf.view.clipsToBounds = clipsToBounds;
        return weakSelf;
    };
    _masksToBounds = ^YJViewMaker *(BOOL masksToBounds) {
        weakSelf.view.layer.masksToBounds = masksToBounds;
        return weakSelf;
    };
    
    
    _alpha = ^YJViewMaker *(CGFloat alpha) {
        weakSelf.view.alpha = alpha;
        return weakSelf;
    };
    
    _shadowColor = ^YJViewMaker *(UIColor *color) {
        weakSelf.view.layer.shadowColor = color.CGColor;
        return weakSelf;
    };
    
    _shadowOffset = ^YJViewMaker *(CGSize offset) {
        weakSelf.view.layer.shadowOffset = offset;
        return weakSelf;
    };
    
    _shadowRadius = ^YJViewMaker *(CGFloat radius) {
        weakSelf.view.layer.shadowRadius = radius;
        return weakSelf;
    };
    
    _transform = ^YJViewMaker *(CGAffineTransform transform) {
        weakSelf.view.transform = transform;
        return weakSelf;
    };
    
    _hidden = ^YJViewMaker *(BOOL hidden) {
        weakSelf.view.hidden = hidden;
        return weakSelf;
    };
    
    _userInteractionEnabled = ^YJViewMaker *(BOOL enabled) {
        weakSelf.view.userInteractionEnabled = enabled;
        return weakSelf;
    };
}

@end

@implementation UIView (YJThen)

- (void)yi_configureWithMake:(void (^)(YJViewMaker *make))block {
    if (block) {
        YJViewMaker *maker = [[YJViewMaker alloc] initWithView:self];
        block(maker);
    }
}
+ (UILabel *)yi_configureWithMake:(void (^)(YJViewMaker *make))block {
    UIView *v = [UIView new];
    if (block) {
        YJViewMaker *maker = [[YJViewMaker alloc] initWithView:v];
        block(maker);
    }
    return v;
}
@end
