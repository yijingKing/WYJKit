/*
  Created by 祎 on 2021
  Copyright © 2021年 祎. All rights reserved.
  GitHub: https://github.com/MemoryKing
*/

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void (^WYJCompletion)(NSString *time);
typedef void (^WYJStopCompletion)(void);
@interface UIButton (WYJCountDown)
/// 倒计时按钮
/// @param timeout 结束时间
/// @param completion 进行中回调
/// @param stopCompletion 结束回调
-(void)yi_startTime:(NSInteger )timeout completion:(WYJCompletion)completion stopCompletion:(WYJStopCompletion)stopCompletion;
@end

NS_ASSUME_NONNULL_END
