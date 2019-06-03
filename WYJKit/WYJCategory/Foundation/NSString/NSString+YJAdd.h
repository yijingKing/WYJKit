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
@property (nonatomic, copy,readonly)NSAttributedString * wHTMLAttributedString;
/** 首字母转换成大写 */
@property (nonatomic, copy,readonly) NSString *wFirstCharUpper;
/** 首字母转换成小写 */
@property (nonatomic, copy,readonly) NSString *wFirstCharLower;
/** json 转 dictionary */
@property (nonatomic, copy,readonly)NSDictionary * wJsonConversionDictionary;
/** base64 转 image */
@property (nonatomic, copy, readonly)UIImage * wBase64ToImage;

/** string judge empty */
+ (BOOL)judgeEmpty:(NSString *)str;

/** string conversion date */
- (NSDate *)wDateFromStringFormat:(NSString *)format;
/** dateString from formatter */
- (NSString *)wDateStringFromFormat:(NSString *)format;

/*
 *  @brief 计算文字的宽度
 *
 *  param font   字体(默认为系统字体)
 *  param height 约束高度
 */
- (CGFloat)wWidthWithFontConstrainedToHeight:(CGFloat)height font:(UIFont *)font;

/**
 *  @brief 计算文字的高度
 *
 *  param font  字体(默认为系统字体)
 *  param width 约束宽度
 */
- (CGFloat)wHeightWithFontConstrainedToWidth:(CGFloat)width font:(UIFont *)font;

/**
 *  @brief 计算文字的大小
 *
 *  param font   字体(默认为系统字体)
 *  param height 约束高度
 */
- (CGSize)wSizeWithFontConstrainedToHeight:(CGFloat)height font:(UIFont *)font;

/**
 *  @brief 计算文字的大小
 *
 *  param font  字体(默认为系统字体)
 *  param width 约束宽度
 */
- (CGSize)wSizeWithFontConstrainedToWidth:(CGFloat)width font:(UIFont *)font;

/**
 验证非空字符串
 */
+ (NSString *)wEmptyStr:(NSString *)str;

/** 拼接字符串判空 */
+ (instancetype)wStringWithFormatNoNull:(NSString *)format, ... ;
/** 用字符串中的数字的值进行比较 */
- (NSComparisonResult)wCompareByCasesNumeric:(NSString *)anotherCom;
/** 不区分大小写 */
- (NSComparisonResult)wCompareByCaseInsensitive:(NSString *)anotherCom;
/** 区分大小写 */
- (NSComparisonResult)wCompareByCaseSensitive:(NSString *)anotherCom;

@end

NS_ASSUME_NONNULL_END
