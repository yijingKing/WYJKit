//
//  NSMutableAttributedString+YJAdd.h
//  AFNetworking
//
//  Created by 祎 on 2024/8/27.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSMutableAttributedString (YJAdd)
- (void)k_setHighlightForTexts:(NSArray<NSString *> *)texts
                       color:(UIColor *)color
            backgroundColor:(UIColor *)backgroundColor
                  tapHandler:(void (^)(NSString *text, NSRange range))tapHandler;
@end

NS_ASSUME_NONNULL_END
