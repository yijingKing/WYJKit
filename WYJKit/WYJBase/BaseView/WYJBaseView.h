/*
  Created by 祎 on 2021
  Copyright © 2021年 祎. All rights reserved.
*/

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WYJBaseView : UIView

/// 点击回调
@property (nonatomic,copy) void (^yi_tapClickBlock)(void);




/// 界面布局
- (void)initSubviews;
/// 界面约束
- (void)makeConstraint;
/// p配置数据
- (void)configurationData:(id)data;
@end

NS_ASSUME_NONNULL_END
