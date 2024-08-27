//
//  UIImageView+sdWeb.m
//  LCProduct
//
//  Created by 王祎境 on 2024/7/12.
//

#import "UIImageView+WYJSD.h"
#import <SDWebImage/SDWebImage.h>
@implementation UIImageView (WYJSD)

- (void)k_setImageWithURL:(nullable NSURL *)url placeholderImage:(UIImage *)placeholderImage{
    [self sd_setImageWithURL:url placeholderImage:placeholderImage options:0 progress:nil completed:nil];
}

@end
