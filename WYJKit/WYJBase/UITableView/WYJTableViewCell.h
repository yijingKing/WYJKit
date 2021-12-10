/*
  Created by King on 2021
  Copyright © 2021年 King. All rights reserved.
*/


#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WYJTableViewCell : UITableViewCell

/** the devider (default NO)  */
///分割线--默认不显示
@property (nonatomic, strong)UIView * dividerView;
/// 类标识
+ (NSString *)yi_reuseIdentifier;
/// 界面布局
- (void)initSubviews;
/// 界面约束
- (void)makeContraints;
/// 配置数据
- (void)configurationData:(id)data;
@end

NS_ASSUME_NONNULL_END
