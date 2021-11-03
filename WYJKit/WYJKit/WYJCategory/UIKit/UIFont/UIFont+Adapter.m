/*******************************************************************************
 Copyright (K), 2019 - ~, ╰莪呮想好好宠Nǐつ
 
 Author:        ╰莪呮想好好宠Nǐつ (Wang Yijing)
 E-mail:        1091676312@qq.com
 GitHub:        https://github.com/MemoryKing
 ********************************************************************************/

#import "UIFont+Adapter.h"
#import <objc/runtime.h>
#import "WYJFrameMacro.h"
@implementation UIFont (Adapter)
+(void)load {
    //获取替换后的类方法
    Method newMethod = class_getClassMethod([self class], @selector(_systemFontOfSize:));
    //获取替换前的类方法
    Method method = class_getClassMethod([self class], @selector(systemFontOfSize:));
    //然后交换类方法
    method_exchangeImplementations(newMethod, method);
    
    //获取替换后的类方法
    Method newMethod1 = class_getClassMethod([self class], @selector(_boldSystemFontOfSize:));
    //获取替换前的类方法
    Method method1 = class_getClassMethod([self class], @selector(boldSystemFontOfSize:));
    //然后交换类方法
    method_exchangeImplementations(newMethod1, method1);
    
    //获取替换后的类方法
    Method newMethod2 = class_getClassMethod([self class], @selector(_fontWithName:size:));
    //获取替换前的类方法
    Method method2 = class_getClassMethod([self class], @selector(fontWithName:size:));
    //然后交换类方法
    method_exchangeImplementations(newMethod2, method2);
    
}

+(UIFont *)_systemFontOfSize:(CGFloat)fontSize{
    UIFont *newFont = nil;
    newFont = [UIFont _systemFontOfSize:fontSize * kProportion];
    return newFont;
}

+(UIFont *)_boldSystemFontOfSize:(CGFloat)fontSize{
    UIFont *newFont = nil;
    newFont = [UIFont _boldSystemFontOfSize:fontSize * kProportion];
    return newFont;
}

+(UIFont *)_fontWithName:(NSString *)name size:(CGFloat)fontSize{
    UIFont *newFont = nil;
    newFont = [UIFont _fontWithName:name size:fontSize * kProportion];
    return newFont;
}

@end
