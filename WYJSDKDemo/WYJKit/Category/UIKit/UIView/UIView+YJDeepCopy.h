//
//  UIView+YJDeepCopy.h
//  LCProduct
//
//  Created by 祎 on 2025/2/11.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (YJDeepCopy)
/// 深拷贝任意 UIView 子类，并自动适配控件类型
/// @param originalView 要拷贝的视图
- (id)yi_deepCopyView;
@end

NS_ASSUME_NONNULL_END
