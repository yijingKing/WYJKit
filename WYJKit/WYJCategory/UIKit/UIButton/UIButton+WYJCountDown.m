/*******************************************************************************
 Copyright (K), 2019 - ~, ╰莪呮想好好宠Nǐつ
 
 Author:        ╰莪呮想好好宠Nǐつ (Wang Yijing)
 E-mail:        1091676312@qq.com
 GitHub:        https://github.com/MemoryKing
 ********************************************************************************/


#import "UIButton+WYJCountDown.h"

@implementation UIButton (WYJCountDown)

/// 倒计时按钮
/// @param timeout 结束时间
/// @param completion 进行中回调
/// @param stopCompletion 结束回调
-(void)startTime:(NSInteger )timeout completion:(WYJCompletion)completion stopCompletion:(WYJStopCompletion)stopCompletion {
    __block NSInteger timeOut=timeout; //倒计时时间
    //算出最后的结束时间
    NSDate *endDate = [NSDate date];
    NSTimeInterval timeSp = [endDate timeIntervalSince1970];
    NSInteger endT= ceill(timeSp)+timeout;
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    //每秒执行
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0);
    dispatch_source_set_event_handler(_timer, ^{
        //倒计时结束，关闭
        if(timeOut<=0){
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                self.userInteractionEnabled = YES;
                stopCompletion();
            });
        }else{
            int seconds = timeOut % 60;
            NSString *strTime = [NSString stringWithFormat:@"%.2d", seconds];
            dispatch_async(dispatch_get_main_queue(), ^{
                completion(strTime);
                self.userInteractionEnabled = NO;
                
            });
    
            NSTimeInterval timeSp = [[NSDate date] timeIntervalSince1970];
            NSInteger nowT= ceill(timeSp);
            timeOut=endT-nowT;
        }
    });
    dispatch_resume(_timer);
    
}

@end
