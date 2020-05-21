/*******************************************************************************
 Copyright (K), 2019 - ~, ╰莪呮想好好宠Nǐつ 
 
 Author:        ╰莪呮想好好宠Nǐつ (kang Yijing)
 E-mail:        1091676312@qq.com
 GitHub:        https://github.com/MemoryKing
 ********************************************************************************/

#ifndef WYJHandy_h
#define WYJHandy_h


//单例宏
#define kSINGLETON_FOR_CLASS_Interface(className) \
+ (className *)shared;

#define kSINGLETON_FOR_CLASS_Implementation(className) \
\
+ (className *)shared { \
static className *shared = nil; \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
shared  = [[self alloc] init]; \
}); \
return shared; \
}

//push跳转
#define  kPushViekController(VC)        [self.navigationController pushViekController:VC animated:YES];

//pop跳转
#define kPopViekController       [self.navigationController popViekControllerAnimated:YES];





#endif /* WYJHandy_h */
