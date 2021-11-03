/*******************************************************************************
 Copyright (K), 2019 - ~, ╰莪呮想好好宠Nǐつ 
 
 Author:        ╰莪呮想好好宠Nǐつ (Wang Yijing)
 E-mail:        1091676312@qq.com
 GitHub:        https://github.com/MemoryKing
 ********************************************************************************/

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (YJRegular)
/** 是否是数字 */
@property (nonatomic, assign, readonly)BOOL isNumber;
/** 是否是手机号 */
@property (nonatomic, assign, readonly)BOOL isTelephone;
/** 是否是邮箱 */
@property (nonatomic, assign, readonly)BOOL isEmail;
/** 是否是邮箱 */
@property (nonatomic, assign, readonly)BOOL isTheInteger;
/** 是否是钱(最多两位小数) */
@property (nonatomic, assign, readonly)BOOL isMoney;
/** 是否是中文 */
@property (nonatomic, assign, readonly)BOOL isChinese;
/** 是否是有效的URL */
@property (nonatomic, assign, readonly)BOOL isURL;

@end

NS_ASSUME_NONNULL_END
