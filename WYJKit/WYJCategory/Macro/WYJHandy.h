/*******************************************************************************
 Copyright (K), 2019 - ~, ╰莪呮想好好宠Nǐつ 
 
 Author:        ╰莪呮想好好宠Nǐつ (Wang Yijing)
 E-mail:        1091676312@qq.com
 GitHub:        https://github.com/MemoryKing
 ********************************************************************************/

#ifndef WYJHandy_h
#define WYJHandy_h


//单例宏
#define WSINGLETON_FOR_CLASS_Interface(className) \
+ (className *)shared;

#define WSINGLETON_FOR_CLASS_Implementation(className) \
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
#define  WPushViewController(VC)        [self.navigationController pushViewController:VC animated:YES];

//pop跳转
#define WPopViewController       [self.navigationController popViewControllerAnimated:YES];





#endif /* WYJHandy_h */
