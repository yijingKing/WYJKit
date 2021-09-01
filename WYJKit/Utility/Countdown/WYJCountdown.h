/*******************************************************************************
 Copyright (K), 2019 - ~, ╰莪呮想好好宠Nǐつ 
 
 Author:        ╰莪呮想好好宠Nǐつ (Wang Yijing)
 E-mail:        1091676312@qq.com
 GitHub:        https://github.com/MemoryKing
 ********************************************************************************/


#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WYJCountdown : NSObject
@property (nonatomic, strong, nullable)dispatch_source_t yi_timer;
/**
 count down

 @param totalTime total time(seconds)
 @param completeBlock   return the remaining (seconds)
 */
- (void)yi_numberDownWithTime:(NSInteger)totalTime completeBlock:(void(^)(NSInteger countDown))completeBlock;

/**
 destory yi_timer
 */
- (void)yi_destoryTimer;

@end

NS_ASSUME_NONNULL_END
