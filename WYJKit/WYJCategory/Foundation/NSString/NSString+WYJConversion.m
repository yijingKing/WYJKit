/*
  Created by King on 2021
  Copyright © 2021年 King. All rights reserved.
*/

#import "NSString+WYJConversion.h"

@implementation NSString (WYJConversion)

/// 阿拉伯数字转换成中文
+ (NSString *)yi_digitalConversionNumber:(int)number {
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    NSLocale *locale = [[NSLocale alloc]initWithLocaleIdentifier:@"zh_Hans"];
    formatter.locale = locale;
    formatter.numberStyle = NSNumberFormatterNoStyle;
    NSString *string = [formatter stringFromNumber:[NSNumber numberWithDouble:number]];
    return string;
}
    
///汉语数字转阿拉伯数字
+(NSString *)yi_chaptersDealWithString:(NSString *)chapterStr {
    NSString *str = chapterStr;
    NSArray * chapter_numerals = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"0"];
    NSArray *chinese_numerals = @[@"一",@"二",@"三",@"四",@"五",@"六",@"七",@"八",@"九",@"零"];
    
    NSArray *digits = @[@"个",@"十",@"百",@"千",@"万",@"十",@"百",@"千",@"亿",@"十",@"百",@"千",@"兆"];
    
    NSDictionary *dictionary = [NSDictionary dictionaryWithObjects:chinese_numerals forKeys: chapter_numerals];
    NSMutableArray *sums = [NSMutableArray array];
    for (int i = 0; i < str.length; i ++) {
        NSString *substr = [str substringWithRange:NSMakeRange(i, 1)];
        NSString *a = [dictionary objectForKey:substr];
        NSString *b = digits[str.length -i-1];
        NSString *sum = [a stringByAppendingString:b];
        if ([a isEqualToString:chinese_numerals[9]])
        {
            if([b isEqualToString:digits[4]] || [b isEqualToString:digits[8]])
            {
                sum = b;
                if ([[sums lastObject] isEqualToString:chinese_numerals[9]])
                {
                    [sums removeLastObject];
                }
            }else
            {
                sum = chinese_numerals[9];
            }
            
            if ([[sums lastObject] isEqualToString:sum])
            {
                continue;
            }
        }
        
        [sums addObject:sum];
    }
    
    NSString *sumStr = [sums  componentsJoinedByString:@""];
    NSString *chinese = [sumStr substringToIndex:sumStr.length-1];
    NSLog(@"%@",str);
    NSLog(@"%@",chinese);
    return chinese;
}

- (NSArray *)yi_toArray {
    return [self componentsSeparatedByString:@","];
}
- (NSArray *)yi_toArrayByString:(NSString *)string {
    return [self componentsSeparatedByString:string];
}

- (NSData *)yi_toData {
    return [self dataUsingEncoding:NSUTF8StringEncoding];
}

- (UIImage *)yi_base64ToImage {
    NSData * imageData =[[NSData alloc] initWithBase64EncodedString:self options:NSDataBase64DecodingIgnoreUnknownCharacters];
    UIImage *photo = [UIImage imageWithData:imageData];
    return photo;
}
@end
