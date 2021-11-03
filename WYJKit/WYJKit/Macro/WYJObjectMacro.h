/*******************************************************************************
 Copyright (K), 2019 - ~, ╰莪呮想好好宠Nǐつ 
 
 Author:        ╰莪呮想好好宠Nǐつ (Wang Yijing)
 E-mail:        1091676312@qq.com
 GitHub:        https://github.com/MemoryKing
 FileContent:   对象强弱引用
 ********************************************************************************/


#ifndef WYJObjectMacro_h
#define WYJObjectMacro_h

#pragma mark - Weak Object
// 弱引用对象
// 弱引用
#ifndef _weekSelf
    #define _weekSelf(weakSelf)               __weak __typeof(&*self)weakSelf = self;
#endif

// 将对象弱引用
#ifndef _weekObj
    #define _weekObj(weakObj,variableObj)      __weak __typeof(&*variableObj)weakObj = variableObj;
#endif

//弱引用
#ifndef kWEAKSELF
#define kWEAKSELF typeof(self) __weak weakSelf = self;
#endif

#ifndef weakify
    #if DEBUG
        #if __has_feature(objc_arc)
        #define weakify(object) autoreleasepool{} __weak __typeof__(object) weak##_##object = object;
        #else
        #define weakify(object) autoreleasepool{} __block __typeof__(object) block##_##object = object;
        #endif
    #else
        #if __has_feature(objc_arc)
        #define weakify(object) try{} @finally{} {} __weak __typeof__(object) weak##_##object = object;
        #else
        #define weakify(object) try{} @finally{} {} __block __typeof__(object) block##_##object = object;
        #endif
    #endif
#endif

//强引用
#ifndef kSTRONGSELF
    #define kSTRONGSELF typeof(weakSelf) __strong strongSelf = weakSelf;
#endif

#ifndef strongify
    #if DEBUG
        #if __has_feature(objc_arc)
        #define strongify(object) autoreleasepool{} __typeof__(object) object = weak##_##object;
        #else
        #define strongify(object) autoreleasepool{} __typeof__(object) object = block##_##object;
        #endif
    #else
        #if __has_feature(objc_arc)
        #define strongify(object) try{} @finally{} __typeof__(object) object = weak##_##object;
        #else
        #define strongify(object) try{} @finally{} __typeof__(object) object = block##_##object;
        #endif
    #endif
#endif


///卫语句
#ifndef oc_guard
#define oc_guard(__wish__) if (__wish__);
#endif

#endif /* WYJObjectMacro_h */
