//
//  WYJBasePopView.h
//  LCProduct
//
//  Created by 祎 on 2025/3/18.
//

#import "LSTPopView.h"
NS_ASSUME_NONNULL_BEGIN

@interface WYJBasePopView : UIView
@property (nonatomic, strong, readonly) LSTPopView *popView;

@property (nonatomic, strong) id data;

/// 显示弹窗
- (void)pop;

/// 关闭弹窗
- (void)dismiss;

/// 子类实现 UI 布局
- (UIView *)setupUI;
///权重
- (NSInteger)priority;
@end

NS_ASSUME_NONNULL_END
