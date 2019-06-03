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

@dynamic imageName;

- (void)wAddTouchUpInside:(void(^)(void))block {
    if (block) {
        objc_setAssociatedObject(self, &ImageClickBlockKey, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
    }
    self.userInteractionEnabled = YES;
    UITapGestureRecognizer * tap = [UITapGestureRecognizer.alloc initWithTarget:self action:@selector(touchupInside)];
    [self addGestureRecognizer:tap];
}
- (void)touchupInside {
    ImageClickBlock block = objc_getAssociatedObject(self, &ImageClickBlockKey);
    block();
}

- (void)setImageName:(NSString *)imageName {
    objc_setAssociatedObject(self, &@selector(imageName), imageName, OBJC_ASSOCIATION_COPY_NONATOMIC);
    self.image = [UIImage imageNamed:imageName];
}

- (NSString *)imageName {
    return objc_getAssociatedObject(self, &@selector(imageName));
}

- (void)setBase64Image:(NSString *)base64Image {
    objc_setAssociatedObject(self, @selector(base64Image), base64Image, OBJC_ASSOCIATION_COPY_NONATOMIC);
    NSData * imageData =[[NSData alloc] initWithBase64EncodedString:base64Image options:NSDataBase64DecodingIgnoreUnknownCharacters];
    UIImage *photo = [UIImage imageWithData:imageData];
    self.image = photo;
}

- (NSString *)base64Image {
    return objc_getAssociatedObject(self, &@selector(base64Image));
}

@end
