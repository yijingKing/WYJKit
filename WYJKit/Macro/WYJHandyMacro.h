/*
 Created by King on 2021
 Copyright © 2021年 King. All rights reserved.
 */

#ifndef WYJHandyMacro_h
#define WYJHandyMacro_h


//单例宏
#ifndef YJSINGLETON_H
#define YJSINGLETON_H \
+ (instancetype)shared;
#endif
#ifndef YJSINGLETON_M
#define YJSINGLETON_M  \
static id _instance; \
+ (instancetype)allocWithZone:(struct _NSZone *)zone \
{ \
    static dispatch_once_t onceToken; \
    dispatch_once(&onceToken, ^{ \
        _instance = [super allocWithZone:zone]; \
    }); \
    return _instance; \
} \
+ (instancetype)shared \
{ \
    static dispatch_once_t onceToken; \
    dispatch_once(&onceToken, ^{ \
        _instance = [[self alloc] init]; \
    }); \
    return _instance; \
} \
- (id)copyWithZone:(NSZone *)zone \
{ \
    return _instance; \
}
#endif

//push跳转
#ifndef  YJPushViekController
#define  YJPushViekController(VC)        [self.navigationController pushViekController:VC animated:YES];
#endif

//pop跳转
#ifndef YJPopViekController
#define YJPopViekController       [self.navigationController popViekControllerAnimated:YES];
#endif

/**
 *  安全地调用 block
 */
#ifndef BLOCK_SAFE_CALLS
#define BLOCK_SAFE_CALLS(block, ...) block ? block(__VA_ARGS__) : nil
#endif
#ifndef BLOCK_SAFE_CALLS_In_Main_Queue
#define BLOCK_SAFE_CALLS_In_Main_Queue(block, ...) block ? dispatch_async(dispatch_get_main_queue(), ^{ block(__VA_ARGS__); }) : nil
#endif




#endif /* WYJHandyMacro_h */
