/*
  Created by King on 2021
  Copyright © 2021年 King. All rights reserved.
*/
#import "UIFont+WYJAdapter.h"
#import <objc/runtime.h>
#import "WYJKitHeader.h"
@implementation UIFont (WYJAdapter)
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
    newFont = [UIFont _systemFontOfSize:fontSize * YJProportion];
    return newFont;
}

+(UIFont *)_boldSystemFontOfSize:(CGFloat)fontSize{
    UIFont *newFont = nil;
    newFont = [UIFont _boldSystemFontOfSize:fontSize * YJProportion];
    return newFont;
}

+(UIFont *)_fontWithName:(NSString *)name size:(CGFloat)fontSize{
    UIFont *newFont = nil;
    newFont = [UIFont _fontWithName:name size:fontSize * YJProportion];
    return newFont;
}

@end
