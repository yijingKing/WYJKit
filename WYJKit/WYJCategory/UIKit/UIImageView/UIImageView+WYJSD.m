/*
  Created by 祎 on 2021
  Copyright © 2021年 祎. All rights reserved.
*/

#import "UIImageView+WYJSD.h"
#import <SDWebImage/SDWebImage.h>
@implementation UIImageView (WYJSD)
- (void)k_setImageWithURL:(nullable NSURL *)url {
    [self sd_setImageWithURL:url];
}
- (void)k_setImageWithURL:(nullable NSURL *)url placeholderImage:(UIImage *)placeholderImage{
    [self sd_setImageWithURL:url placeholderImage:placeholderImage options:0 progress:nil completed:nil];
}

@end
