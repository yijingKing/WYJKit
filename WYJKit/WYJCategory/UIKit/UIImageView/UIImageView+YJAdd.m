/*
  Created by 祎 on 2021
  Copyright © 2021年 祎. All rights reserved.
*/


#import "UIImageView+YJAdd.h"
#import <objc/runtime.h>

typedef void(^ImageClickBlock)(void);

static const char ImageClickBlockKey;

@implementation UIImageView (YJAdd)

@dynamic yi_imageName;
- (void)addTouchUpInside:(void (^)(void))block {
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

- (void)setYi_imageName:(NSString *)imageName {
    objc_setAssociatedObject(self, &@selector(yi_imageName), imageName, OBJC_ASSOCIATION_COPY_NONATOMIC);
    self.image = [UIImage imageNamed:imageName];
}

- (NSString *)yi_imageName {
    return objc_getAssociatedObject(self, &@selector(yi_imageName));
}

- (void)setYi_base64Image:(NSString *)base64Image {
    objc_setAssociatedObject(self, @selector(yi_base64Image), base64Image, OBJC_ASSOCIATION_COPY_NONATOMIC);
    NSData * imageData =[[NSData alloc] initWithBase64EncodedString:base64Image options:NSDataBase64DecodingIgnoreUnknownCharacters];
    UIImage *photo = [UIImage imageWithData:imageData];
    self.image = photo;
}

- (NSString *)yi_base64Image {
    return objc_getAssociatedObject(self, &@selector(yi_base64Image));
}

@end
