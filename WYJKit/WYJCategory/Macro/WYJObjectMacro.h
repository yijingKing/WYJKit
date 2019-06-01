/*******************************************************************************
 Copyright (K), 2019 - ~, ╰莪呮想好好宠Nǐつ
 
 Author:        ╰莪呮想好好宠Nǐつ (Wang Yijing)
 E-mail:        1091676312@qq.com
 
 ********************************************************************************/


#ifndef WYJObjectMacro_h
#define WYJObjectMacro_h

#pragma mark - Weak Object
// 弱引用对象
// 弱引用
#define _weekSelf(weakSelf)               __weak __typeof(&*self)weakSelf = self;
// 将对象弱引用
#define _weekObj(weakObj,variableObj)      __weak __typeof(&*variableObj)weakObj = variableObj;

//弱引用/强引用
#define WEAKSELF typeof(self) __weak weakSelf = self;
#define STRONGSELF typeof(weakSelf) __strong strongSelf = weakSelf;

// 数据的有效性, 判断字符串是否有效
#define WValidity_Str(string) (((string != nil) && (string.length>0))?YES:NO)


#endif /* WYJObjectMacro_h */
