/*******************************************************************************
 Copyright (K), 2019 - ~, ╰莪呮想好好宠Nǐつ
 
 Author:        ╰莪呮想好好宠Nǐつ (Wang Yijing)
 E-mail:        1091676312@qq.com
 GitHub:        https://github.com/MemoryKing
 ********************************************************************************/


#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void (^WYJCompletion)(NSString *time);
typedef void (^WYJStopCompletion)();
@interface UIButton (WYJCountDown)
/// 倒计时按钮
/// @param timeout 结束时间
/// @param completion 进行中回调
/// @param stopCompletion 结束回调
-(void)startTime:(NSInteger )timeout completion:(WYJCompletion)completion stopCompletion:(WYJStopCompletion)stopCompletion;
@end

NS_ASSUME_NONNULL_END
