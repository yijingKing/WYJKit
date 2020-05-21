/*******************************************************************************
 Copyright (K), 2019 - ~, ╰莪呮想好好宠Nǐつ 
 
 Author:        ╰莪呮想好好宠Nǐつ (Wang Yijing)
 E-mail:        1091676312@qq.com
 GitHub:        https://github.com/MemoryKing
 ********************************************************************************/


#import "UIImageView+YJAdd.h"
#import <objc/runtime.h>

typedef void(^ImageClickBlock)(void);

static const char ImageClickBlockKey;

@implementation UIImageView (YJAdd)

@dynamic yi_imageName;

- (void)yi_addTouchUpInside:(void (^)(void))block {
    if (block) {
        objc_setAssociatedObject(self, &ImageClickBlockKey, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
    }
    self.userInteractionEnabled = YES;
    UITapGestureRecognizer * tap = [UITapGestureRecognizer.alloc initWithTarget:self action:@selector(yi_touchupInside)];
    [self addGestureRecognizer:tap];
}
- (void)yi_touchupInside {
    ImageClickBlock block = objc_getAssociatedObject(self, &ImageClickBlockKey);
    block();
}

- (void)setYi_imageName:(NSString *)yi_imageName {
    objc_setAssociatedObject(self, &@selector(yi_imageName), yi_imageName, OBJC_ASSOCIATION_COPY_NONATOMIC);
    self.image = [UIImage imageNamed:yi_imageName];
}

- (NSString *)yi_imageName {
    return objc_getAssociatedObject(self, &@selector(yi_imageName));
}

- (void)setYi_base64Image:(NSString *)yi_base64Image {
    objc_setAssociatedObject(self, @selector(yi_base64Image), yi_base64Image, OBJC_ASSOCIATION_COPY_NONATOMIC);
    NSData * imageData =[[NSData alloc] initWithBase64EncodedString:yi_base64Image options:NSDataBase64DecodingIgnoreUnknownCharacters];
    UIImage *photo = [UIImage imageWithData:imageData];
    self.image = photo;
}

- (NSString *)yi_base64Image {
    return objc_getAssociatedObject(self, &@selector(yi_base64Image));
}

@end
