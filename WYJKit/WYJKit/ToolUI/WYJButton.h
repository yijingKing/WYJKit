/*
  Created by 祎 on 2021
  Copyright © 2021年 祎. All rights reserved.
*/

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


typedef NS_ENUM(NSInteger, WYJButtonImagePosition) {
    WYJButtonImagePositionLeft   = 0,     // 图片在文字左侧
    WYJButtonImagePositionRight  = 1,     // 图片在文字右侧
    WYJButtonImagePositionTop    = 2,     // 图片在文字上侧
    WYJButtonImagePositionBottom = 3      // 图片在文字下侧
};

IB_DESIGNABLE
@interface WYJButton : UIButton

- (instancetype)initWithImagePosition:(WYJButtonImagePosition)imagePosition;

#if TARGET_INTERFACE_BUILDER // storyBoard/xib中设置
@property (nonatomic,assign) IBInspectable NSInteger imagePosition; // 图片位置
@property (nonatomic, assign) IBInspectable CGFloat imageTitleSpace; // 图片和文字之间的间距
#else // 纯代码设置
@property (nonatomic) WYJButtonImagePosition imagePosition; // 图片位置
@property (nonatomic, assign) CGFloat imageTitleSpace; // 图片和文字之间的间距
#endif


@end


NS_ASSUME_NONNULL_END
