//
//  UIImageView+sdWeb.h
//  LCProduct
//
//  Created by 王祎境 on 2024/7/12.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImageView (WYJSD)
- (void)k_setImageWithURL:(nullable NSURL *)url;
- (void)k_setImageWithURL:(nullable NSURL *)url placeholderImage:(UIImage *)placeholderImage;
@end

NS_ASSUME_NONNULL_END
