/*
  Created by 祎 on 2021
  Copyright © 2021年 祎. All rights reserved.
*/


#import "NSString+WYJAdd.h"

@implementation NSString (WYJAdd)

+ (BOOL)judgeEmpty:(NSString *)str {
    if (!str) {
        return YES;
    }
    if ([str isKindOfClass:[NSNull class]]
        || str == nil
        || str == NULL) {
        return YES;
    }
    NSCharacterSet *set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    NSString *trimmedStr = [str stringByTrimmingCharactersInSet:set];
    if (!trimmedStr.length) {
        return YES;
    }
    return NO;
}



- (NSString * )yi_dateStringFromFormat:(NSString *)format {
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
    NSDate * date = [formatter dateFromString:self];
    return [formatter stringFromDate:date];
}

/**
 *  @brief 计算文字的高度
 *
 *  param font  字体(默认为系统字体)
 *  param width 约束宽度
 */
- (CGFloat)yi_heightWithFontConstrainedToWidth:(CGFloat)width font:(UIFont *)font {
    UIFont * textFont = font;
    CGSize textSize;
#if __IPHONE_OS_VERSION_MIN_REQUIRED < 70000
    if ([self respondsToSelector:@selector(boundingRectWithSize:options:attributes:context:)]) {
        NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];
        paragraph.lineBreakMode = NSLineBreakByWordWrapping;
        NSDictionary *attributes = @{NSFontAttributeName: textFont,
                                     NSParagraphStyleAttributeName: paragraph};
        textSize = [self boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX)
                                      options:(NSStringDrawingUsesLineFragmentOrigin |
                                               NSStringDrawingTruncatesLastVisibleLine)
                                   attributes:attributes
                                      context:nil].size;
    } else {
        textSize = [self sizeWithFont:textFont
                    constrainedToSize:CGSizeMake(width, CGFLOAT_MAX)
                        lineBreakMode:NSLineBreakByWordWrapping];
    }
#else
    NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];
    paragraph.lineBreakMode = NSLineBreakByWordWrapping;
    NSDictionary *attributes = @{NSFontAttributeName: textFont,
                                 NSParagraphStyleAttributeName: paragraph};
    textSize = [self boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX)
                                  options:(NSStringDrawingUsesLineFragmentOrigin |
                                           NSStringDrawingTruncatesLastVisibleLine)
                               attributes:attributes
                                  context:nil].size;
#endif
    return ceil(textSize.height);
}


/**
 *  @brief 计算文字的宽度
 *
 *  param font   字体(默认为系统字体)
 *  param height 约束高度
 */
- (CGFloat)yi_widthWithFontConstrainedToHeight:(CGFloat)height font:(UIFont *)font  {
    UIFont *textFont = font;
    CGSize textSize;
#if __IPHONE_OS_VERSION_MIN_REQUIRED < 70000
    if ([self respondsToSelector:@selector(boundingRectWithSize:options:attributes:context:)]) {
        NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];
        paragraph.lineBreakMode = NSLineBreakByWordWrapping;
        NSDictionary *attributes = @{NSFontAttributeName: textFont,
                                     NSParagraphStyleAttributeName: paragraph};
        textSize = [self boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, height)
                                      options:(NSStringDrawingUsesLineFragmentOrigin |
                                               NSStringDrawingTruncatesLastVisibleLine)
                                   attributes:attributes
                                      context:nil].size;
    } else {
        textSize = [self sizeWithFont:textFont
                    constrainedToSize:CGSizeMake(CGFLOAT_MAX, height)
                        lineBreakMode:NSLineBreakByWordWrapping];
    }
#else
    NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];
    paragraph.lineBreakMode = NSLineBreakByWordWrapping;
    NSDictionary *attributes = @{NSFontAttributeName: textFont,
                                 NSParagraphStyleAttributeName: paragraph};
    textSize = [self boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, height)
                                  options:(NSStringDrawingUsesLineFragmentOrigin |
                                           NSStringDrawingTruncatesLastVisibleLine)
                               attributes:attributes
                                  context:nil].size;
#endif
    return ceil(textSize.width);
}

/**
 *  @brief 计算文字的大小
 *
 *  param font  字体(默认为系统字体)
 *  param width 约束宽度
 */
- (CGSize)yi_sizeWithFontConstrainedToWidth:(CGFloat)width font:(UIFont *)font {
    UIFont *textFont = font;
    CGSize textSize;
#if __IPHONE_OS_VERSION_MIN_REQUIRED < 70000
    if ([self respondsToSelector:@selector(boundingRectWithSize:options:attributes:context:)]) {
        NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];
        paragraph.lineBreakMode = NSLineBreakByWordWrapping;
        NSDictionary *attributes = @{NSFontAttributeName: textFont,
                                     NSParagraphStyleAttributeName: paragraph};
        textSize = [self boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX)
                                      options:(NSStringDrawingUsesLineFragmentOrigin |
                                               NSStringDrawingTruncatesLastVisibleLine)
                                   attributes:attributes
                                      context:nil].size;
    } else {
        textSize = [self sizeWithFont:textFont
                    constrainedToSize:CGSizeMake(width, CGFLOAT_MAX)
                        lineBreakMode:NSLineBreakByWordWrapping];
    }
#else
    NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];
    paragraph.lineBreakMode = NSLineBreakByWordWrapping;
    NSDictionary *attributes = @{NSFontAttributeName: textFont,
                                 NSParagraphStyleAttributeName: paragraph};
    textSize = [self boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX)
                                  options:(NSStringDrawingUsesLineFragmentOrigin |
                                           NSStringDrawingTruncatesLastVisibleLine)
                               attributes:attributes
                                  context:nil].size;
#endif
    return CGSizeMake(ceil(textSize.width), ceil(textSize.height));
}

/**
 *  @brief 计算文字的大小
 *
 *  param font   字体(默认为系统字体)
 *  param height 约束高度
 */
- (CGSize)yi_sizeWithFontConstrainedToHeight:(CGFloat)height font:(UIFont *)font {
    UIFont *textFont = font ? font : [UIFont systemFontOfSize:[UIFont systemFontSize]];
    CGSize textSize;
#if __IPHONE_OS_VERSION_MIN_REQUIRED < 70000
    if ([self respondsToSelector:@selector(boundingRectWithSize:options:attributes:context:)]) {
        NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];
        paragraph.lineBreakMode = NSLineBreakByWordWrapping;
        NSDictionary *attributes = @{NSFontAttributeName: textFont,
                                     NSParagraphStyleAttributeName: paragraph};
        textSize = [self boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, height)
                                      options:(NSStringDrawingUsesLineFragmentOrigin |
                                               NSStringDrawingTruncatesLastVisibleLine)
                                   attributes:attributes
                                      context:nil].size;
    } else {
        textSize = [self sizeWithFont:textFont
                    constrainedToSize:CGSizeMake(CGFLOAT_MAX, height)
                        lineBreakMode:NSLineBreakByWordWrapping];
    }
#else
    NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];
    paragraph.lineBreakMode = NSLineBreakByWordWrapping;
    NSDictionary *attributes = @{NSFontAttributeName: textFont,
                                 NSParagraphStyleAttributeName: paragraph};
    textSize = [self boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, height)
                                  options:(NSStringDrawingUsesLineFragmentOrigin |
                                           NSStringDrawingTruncatesLastVisibleLine)
                               attributes:attributes
                                  context:nil].size;
#endif
    return CGSizeMake(ceil(textSize.width), ceil(textSize.height));
}

/** 拼接字符串判空 */
+ (instancetype)stringWithFormatNoNull:(NSString *)format, ... {
    va_list arg;
    va_start (arg, format);
    NSString *hasNullStr = [[NSString alloc] initWithFormat:format arguments:arg];
    va_end (arg);
    
    hasNullStr = [hasNullStr stringByReplacingOccurrencesOfString:@"(null)" withString:@""];
    return hasNullStr;
}

/**
 enum: NSStringCompareOptions
 NSCaseInsensitiveSearch = 1, 不区分大小写的搜索
 NSLiteralSearch = 2,         区分大小写比较
 NSBackwardsSearch = 4,       从字符串末尾开始搜索
 NSAnchoredSearch = 8,        搜索仅限于开始（或结束，如果是从末尾开始的搜索)
 NSNumericSearch = 64,        用字符串中的数字的值进行比较
 */
//options:NSCaseInsensitiveSearch
- (NSComparisonResult)compareByCasesNumeric:(NSString *)anotherCom {
    return [self compare:anotherCom options:NSNumericSearch];
}
- (NSComparisonResult)compareByCaseInsensitive:(NSString *)anotherCom {
    return [self compare:anotherCom options:NSCaseInsensitiveSearch];
}
- (NSComparisonResult)compareByCaseSensitive:(NSString *)anotherCom {
    return [self compare:anotherCom options:NSLiteralSearch];
}

#pragma make ------ 属性 ------
- (NSAttributedString *)yi_HTMLAttributedString {
    NSAttributedString *attributedString = [[NSAttributedString alloc] initWithData:[self dataUsingEncoding:NSUnicodeStringEncoding] options:@{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType } documentAttributes:nil error:nil];
    return attributedString;
}

/** 首字母转换成小写 */
- (NSString *)yi_firstCharLower
{
    if (self.length == 0) return self;
    NSMutableString *string = [NSMutableString string];
    [string appendString:[NSString stringWithFormat:@"%c", [self characterAtIndex:0]].lowercaseString];
    if (self.length >= 2) [string appendString:[self substringFromIndex:1]];
    return string;
}

/** 首字母转换成大写 */
- (NSString *)yi_firstCharUpper
{
    if (self.length == 0) return self;
    NSMutableString *string = [NSMutableString string];
    [string appendString:[NSString stringWithFormat:@"%c", [self characterAtIndex:0]].uppercaseString];
    if (self.length >= 2) [string appendString:[self substringFromIndex:1]];
    return string;
}

- (NSDictionary * )yi_jsonConversionDictionary {
    if (self == nil) {
        return nil;
    }
    NSData *jsonData = [self dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err) {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}



@end
