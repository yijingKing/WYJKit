/*******************************************************************************
 Copyright (K), 2019 - ~, ╰莪呮想好好宠Nǐつ
 
 Author:        ╰莪呮想好好宠Nǐつ (Wang Yijing)
 E-mail:        1091676312@qq.com
 GitHub:        https://github.com/MemoryKing
 ********************************************************************************/


#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WYJBaseView : UIView
/// 界面布局
- (void)initSubviews;
/// 界面约束
- (void)makeContraints;
///数据
- (void)setupWithData:(id)data;
@end

NS_ASSUME_NONNULL_END
