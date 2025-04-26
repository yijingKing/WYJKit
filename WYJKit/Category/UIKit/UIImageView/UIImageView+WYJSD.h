/*
  Created by 祎 on 2021
  Copyright © 2021年 祎. All rights reserved.
*/

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

#define kImageNamed(imageName)      [UIImage imageNamed:@#imageName]

#define SDImageView(img, path)      [img sd_setImageWithURL:[NSURL URLWithString:([path hasPrefix:@"http"] ? path : [LCRequest imageUrlString:path])]];


#define kSDImageView(img, path) \
[img sd_setImageWithURL:[NSURL URLWithString:([path hasPrefix:@"http"] ? path : [LCRequest imageUrlString:path])] \
placeholderImage:[UIImage imageNamed:@"goods_place_holder"]];

#define kSDLevelImageView(img, path) \
[img sd_setImageWithURL:[NSURL URLWithString:([path hasPrefix:@"http"] ? path : [LCRequest imageUrlString:path])] \
placeholderImage:[UIImage imageNamed:@"banner_place_holder"]];

#define kAvatarSDImageView(img, path) \
[img sd_setImageWithURL:[NSURL URLWithString:([path hasPrefix:@"http"] ? path : [LCRequest imageUrlString:path])] \
placeholderImage:user_place_holder_image];

@interface UIImageView (WYJSD)
- (void)k_setImageWithURL:(nullable NSURL *)url;
- (void)k_setImageWithURL:(nullable NSURL *)url placeholderImage:(UIImage *)placeholderImage;
@end

NS_ASSUME_NONNULL_END
