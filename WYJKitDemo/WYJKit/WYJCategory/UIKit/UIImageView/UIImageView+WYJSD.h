/*
  Created by 祎 on 2021
  Copyright © 2021年 祎. All rights reserved.
*/

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

#define kImageNamed(imageName)      [UIImage imageNamed:@#imageName]
#define kSDImageView(img,path)      [img sd_setImageWithURL:[NSURL URLWithString:[LCRequest imageUrlString:path]] placeholderImage:[UIImage imageNamed:@"goods_place_holder"]];

@interface UIImageView (WYJSD)
- (void)k_setImageWithURL:(nullable NSURL *)url;
- (void)k_setImageWithURL:(nullable NSURL *)url placeholderImage:(UIImage *)placeholderImage;
@end

NS_ASSUME_NONNULL_END
