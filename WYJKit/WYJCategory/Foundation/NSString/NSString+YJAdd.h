/*******************************************************************************
 Copyright (K), 2019 - ~, ╰莪呮想好好宠Nǐつ 
 
 Author:        ╰莪呮想好好宠Nǐつ (Wang Yijing)
 E-mail:        1091676312@qq.com
 GitHub:        https://github.com/MemoryKing
 ********************************************************************************/


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (YJAdd)
/** HTML转成富文本 */
@property (nonatomic, copy,readonly)NSAttributedString * yi_HTMLAttributedString;
/** 首字母转换成大写 */
@property (nonatomic, copy,readonly) NSString * yi_firstCharUpper;
/** 首字母转换成小写 */
@property (nonatomic, copy,readonly) NSString * yi_firstCharLower;
/** json 转 dictionary */
@property (nonatomic, copy,readonly)NSDictionary * yi_jsonConversionDictionary;
/** base64 转 image */
@property (nonatomic, copy, readonly)UIImage * yi_base64ToImage;

/** string judge empty */
+ (BOOL)yi_judgeEmpty:(NSString *)str;

/** string conversion date */
- (NSDate *)yi_dateFromStringFormat:(NSString *)format;
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

/**
 验证非空字符串
 */
+ (NSString *)yi_emptyStr:(NSString *)str;

/** 拼接字符串判空 */
+ (instancetype)yi_stringWithFormatNoNull:(NSString *)format, ... ;
/** 用字符串中的数字的值进行比较 */
- (NSComparisonResult)yi_compareByCasesNumeric:(NSString *)anotherCom;
/** 不区分大小写 */
- (NSComparisonResult)yi_compareByCaseInsensitive:(NSString *)anotherCom;
/** 区分大小写 */
- (NSComparisonResult)yi_compareByCaseSensitive:(NSString *)anotherCom;

@end

NS_ASSUME_NONNULL_END
