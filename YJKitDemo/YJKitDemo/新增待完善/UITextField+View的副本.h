//
//  UITextField+View.h
//  Zeus
//
//  Created by PZ-IMAC-1 on 2021/9/2.
//  Copyright © 2021 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITextField (View)
- (void)addLeftView:(NSString *)text color:(UIColor *)color image:(UIImage *)image size:(CGSize)size;
@end

NS_ASSUME_NONNULL_END
