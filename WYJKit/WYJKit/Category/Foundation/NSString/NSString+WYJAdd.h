/*
  Created by 祎 on 2021
  Copyright © 2021年 祎. All rights reserved.
*/


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (WYJAdd)
/** HTML转成富文本 */
@property (nonatomic, copy,readonly)NSAttributedString * yi_HTMLAttributedString;
/** 首字母转换成大写 */
@property (nonatomic, copy,readonly) NSString * yi_firstCharUpper;
/** 首字母转换成小写 */
@property (nonatomic, copy,readonly) NSString * yi_firstCharLower;
/** json 转 dictionary */
@property (nonatomic, copy,readonly)NSDictionary * yi_jsonConversionDictionary;


/** string judge empty */
+ (BOOL)yi_judgeEmpty:(NSString *)str;

/** dateString from formatter */
- (NSString *)yi_dateStringFromFormat:(NSString *)format;

/*
 *  @brief 计算文字的宽度
 *
 *  param font   字体(默认为系统字体)
 *  param height 约束高度
 */
- (CGFloat)yi_widthWithFontConstrainedToHeight:(CGFloat)height font:(UIFont *)font;

/**
 *  @brief 计算文字的高度
 *
 *  param font  字体(默认为系统字体)
 *  param width 约束宽度
 */
- (CGFloat)yi_heightWithFontConstrainedToWidth:(CGFloat)width font:(UIFont *)font;

/**
 *  @brief 计算文字的大小
 *
 *  param font   字体(默认为系统字体)
 *  param height 约束高度
 */
- (CGSize)yi_sizeWithFontConstrainedToHeight:(CGFloat)height font:(UIFont *)font;

/**
 *  @brief 计算文字的大小
 *
 *  param font  字体(默认为系统字体)
 *  param width 约束宽度
 */
- (CGSize)yi_sizeWithFontConstrainedToWidth:(CGFloat)width font:(UIFont *)font;


/** 拼接字符串判空 */
+ (instancetype)stringWithFormatNoNull:(NSString *)format, ... ;
/** 用字符串中的数字的值进行比较 */
- (NSComparisonResult)compareByCasesNumeric:(NSString *)anotherCom;
/** 不区分大小写 */
- (NSComparisonResult)compareByCaseInsensitive:(NSString *)anotherCom;
/** 区分大小写 */
- (NSComparisonResult)compareByCaseSensitive:(NSString *)anotherCom;


/** 去除首尾空格和换行 */
- (NSString *)yi_removeTrim;

@end


