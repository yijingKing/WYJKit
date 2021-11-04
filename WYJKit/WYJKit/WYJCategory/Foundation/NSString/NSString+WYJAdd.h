/*******************************************************************************
 Copyright (K), 2019 - ~, ╰莪呮想好好宠Nǐつ 
 
 Author:        ╰莪呮想好好宠Nǐつ (Wang Yijing)
 E-mail:        1091676312@qq.com
 GitHub:        https://github.com/MemoryKing
 ********************************************************************************/


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (WYJAdd)
/** HTML转成富文本 */
@property (nonatomic, copy,readonly)NSAttributedString * HTMLAttributedString;
/** 首字母转换成大写 */
@property (nonatomic, copy,readonly) NSString * firstCharUpper;
/** 首字母转换成小写 */
@property (nonatomic, copy,readonly) NSString * firstCharLower;
/** json 转 dictionary */
@property (nonatomic, copy,readonly)NSDictionary * jsonConversionDictionary;
/** base64 转 image */
@property (nonatomic, copy, readonly)UIImage * base64ToImage;

/** string judge empty */
+ (BOOL)judgeEmpty:(NSString *)str;

/** string conversion date */
- (NSDate *)dateFromStringFormat:(NSString *)format;
/** dateString from formatter */
- (NSString *)dateStringFromFormat:(NSString *)format;

/*
 *  @brief 计算文字的宽度
 *
 *  param font   字体(默认为系统字体)
 *  param height 约束高度
 */
- (CGFloat)widthWithFontConstrainedToHeight:(CGFloat)height font:(UIFont *)font;

/**
 *  @brief 计算文字的高度
 *
 *  param font  字体(默认为系统字体)
 *  param width 约束宽度
 */
- (CGFloat)heightWithFontConstrainedToWidth:(CGFloat)width font:(UIFont *)font;

/**
 *  @brief 计算文字的大小
 *
 *  param font   字体(默认为系统字体)
 *  param height 约束高度
 */
- (CGSize)sizeWithFontConstrainedToHeight:(CGFloat)height font:(UIFont *)font;

/**
 *  @brief 计算文字的大小
 *
 *  param font  字体(默认为系统字体)
 *  param width 约束宽度
 */
- (CGSize)sizeWithFontConstrainedToWidth:(CGFloat)width font:(UIFont *)font;

/**
 验证非空字符串
 */
+ (NSString *)emptyStr:(NSString *)str;

/** 拼接字符串判空 */
+ (instancetype)stringWithFormatNoNull:(NSString *)format, ... ;
/** 用字符串中的数字的值进行比较 */
- (NSComparisonResult)compareByCasesNumeric:(NSString *)anotherCom;
/** 不区分大小写 */
- (NSComparisonResult)compareByCaseInsensitive:(NSString *)anotherCom;
/** 区分大小写 */
- (NSComparisonResult)compareByCaseSensitive:(NSString *)anotherCom;
@end


