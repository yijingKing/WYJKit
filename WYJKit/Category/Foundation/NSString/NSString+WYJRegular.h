/*
  Created by 祎 on 2021
  Copyright © 2021年 祎. All rights reserved.
*/

#import <Foundation/Foundation.h>

@interface NSString (WYJRegular)
/** 是否是数字 */
@property (nonatomic, assign, readonly)BOOL yi_isNumber;
/** 是否是手机号 */
@property (nonatomic, assign, readonly)BOOL yi_isTelephone;
/** 是否是邮箱 */
@property (nonatomic, assign, readonly)BOOL yi_isEmail;
/** 是否是邮箱 */
@property (nonatomic, assign, readonly)BOOL yi_isTheInteger;
/** 是否是钱(最多两位小数) */
@property (nonatomic, assign, readonly)BOOL yi_isMoney;
/** 是否是中文 */
@property (nonatomic, assign, readonly)BOOL yi_isChinese;
/** 是否是有效的URL */
@property (nonatomic, assign, readonly)BOOL yi_isURL;

@end


