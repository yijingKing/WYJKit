/*******************************************************************************
 Copyright (K), 2019 - ~, ╰莪呮想好好宠Nǐつ 
 
 Author:        ╰莪呮想好好宠Nǐつ (Wang Yijing)
 E-mail:        1091676312@qq.com
 GitHub:        https://github.com/MemoryKing
 ********************************************************************************/


#import "WYJCountdown.h"

@implementation WYJCountdown
/**
 倒计时
 
 @param totalTime 总时间(seconds)
 @param completeBlock   剩余时间 (seconds)
 */
- (void)yi_numberDownWithTime:(NSInteger)totalTime completeBlock:(void(^)(NSInteger countDown))completeBlock {
    if (!self.yi_timer) {
        __block NSInteger timeNum = totalTime;
        
        if (totalTime != 0) {
            self.yi_timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0,0,dispatch_get_global_queue(0, 0));
            
            dispatch_source_set_timer(self.yi_timer, DISPATCH_TIME_NOW, 1 * NSEC_PER_SEC, 1 * NSEC_PER_SEC);
            dispatch_source_set_event_handler(self.yi_timer, ^{
                if (timeNum <= 0) {
                    [self yi_destoryTimer];
                    dispatch_async(dispatch_get_main_queue(), ^{
                        !completeBlock?:completeBlock(0);
                    });
                } else {
                    timeNum --;
                    dispatch_async(dispatch_get_main_queue(), ^{
                        !completeBlock?:completeBlock(timeNum);
                    });
                }
            });
            dispatch_resume(self.yi_timer);
        }
    }
}

/**
 销毁定时器
 */
- (void)yi_destoryTimer {
    dispatch_source_cancel(self.yi_timer);
    self.yi_timer = nil;
}

@end
