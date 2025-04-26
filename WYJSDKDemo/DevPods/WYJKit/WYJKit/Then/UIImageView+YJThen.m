/*
 Created by 祎 on 2021
 Copyright © 2021年 祎. All rights reserved.
 */

#import "UIImageView+YJThen.h"
#import <objc/runtime.h>

@implementation UIImageView (YJThen)

- (void)yi_configureWithMake:(void (^)(YJImageViewMaker *make))block {
    if (block) {
        YJImageViewMaker *maker = [[YJImageViewMaker alloc] initWithImageView:self];
        block(maker);
    }
}

+ (UIImageView *)yi_configureWithMake:(void (^)(YJImageViewMaker *make))block {
    UIImageView *imageView = [UIImageView new];
    if (block) {
        YJImageViewMaker *maker = [[YJImageViewMaker alloc] initWithImageView:imageView];
        block(maker);
    }
    return imageView;
}
@end

@interface YJImageViewMaker ()

@property (nonatomic, weak) UIImageView *imageView;

@end

@implementation YJImageViewMaker

- (instancetype)initWithImageView:(UIImageView *)imageView {
    if (self = [super initWithView:imageView]) {
        _imageView = imageView;
        [self setupBlocks];
    }
    return self;
}

- (void)setupBlocks {
    [super setupBlocks];
    __weak typeof(self) weakSelf = self;
    
    _image = ^YJImageViewMaker *(UIImage *image) {
        weakSelf.imageView.image = image;
        return weakSelf;
    };
    _contentMode = ^YJImageViewMaker *(UIViewContentMode mode) {
        weakSelf.imageView.contentMode = mode;
        return weakSelf;
    };
}

@end
