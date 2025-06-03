//
//  Tools.h
//  LCProduct
//
//  Created by 王祎境 on 2024/6/24.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, WYJConvertType) {
    WYJConvertTypeInt,
    WYJConvertTypeFloat,
    WYJConvertTypeDouble,
    WYJConvertTypeBool,
    WYJConvertTypeNumber,
    WYJConvertTypeDate,
    WYJConvertTypeData,
    WYJConvertTypeArray,
    WYJConvertTypeDictionary
};

@interface WYJConvertTools : NSObject

/// 将任意对象（NSString、NSNumber、NSArray、NSDictionary、NSNull、NSDate）转为字符串
#define YJSTRING_FROM_ANY(obj) [WYJConvertTools yi_stringFromAnyObject:(obj)]
/// 快速将任意对象转换为字符串
+ (NSString *)yi_stringFromAnyObject:(id)obj;

/// 四舍五入并格式化数字
/// @param value 需要格式化的数值
/// @param decimalPlaces 保留的小数位数
/// @return 格式化后的字符串
+ (NSString *)yi_roundUpAndFormat:(double)value toDecimalPlaces:(NSInteger)decimalPlaces;

/// 将 double 转换为字符串
/// @param value 需要转换的 double 值
/// @return 转换后的字符串
+ (NSString *)yi_stringWithDouble:(double)value;

/// 将 double 转换为字符串，并指定小数位数
/// @param value 需要转换的 double 值
/// @param places 小数位数
/// @return 格式化后的字符串
+ (NSString *)yi_stringWithDouble:(double)value decimalPlaces:(NSInteger)places;

/// 将 NSInteger 转换为字符串
/// @param value 需要转换的整数
/// @return 转换后的字符串
+ (NSString *)yi_stringWithInteger:(NSInteger)value;

/// 将 double 转换为货币格式的字符串
/// @param value 需要转换的金额
/// @return 货币格式的字符串
+ (NSString *)yi_moneyWithDouble:(double)value;

/// 隐藏手机号码的中间几位
/// @param phoneNumber 需要处理的手机号码
/// @return 处理后的手机号码字符串
+ (NSString *)yi_obscurePhoneNumber:(NSString *)phoneNumber;

/// 将 HTML 字符串转换为 NSAttributedString
/// @param htmlString HTML 格式的字符串
/// @return 转换后的富文本字符串
+ (NSAttributedString *)yi_attributedStringFromHTMLString:(NSString *)htmlString;

/// 判断两个字典是否相等
/// @param dict1 第一个字典
/// @param dict2 第二个字典
/// @return 如果相等返回 YES，否则返回 NO
+ (BOOL)yi_dictionariesAreEqual:(NSDictionary *)dict1 dic2:( NSDictionary *)dict2;

/// 根据数值返回距离的字符串表示
/// @param num 距离数值
/// @return 格式化后的距离字符串
+ (NSString *)yi_distanceWithNum:(NSInteger)num;

/// 判断 URL 是否为视频链接
/// @param urlString 需要判断的 URL 字符串
/// @return 如果是视频 URL 返回 YES，否则返回 NO
+ (BOOL)yi_isVideoURL:(NSString *)urlString;

/// 将秒数转换为时间格式（hh:mm:ss）
/// @param totalSeconds 需要转换的总秒数
/// @return 格式化后的时间字符串
+ (NSString *)yi_timeFormatted:(NSInteger)totalSeconds;

/// 进行地图导航
/// @param location 目标位置的经纬度
+ (void)yi_mapNavigationWithLocation:(CLLocationCoordinate2D)location;

/// 在指定城市搜索地点
/// @param cityName 城市名称
/// @param query 搜索关键字
/// @param block 结果回调，返回地点数组
+ (void)yi_searchForPlacesInCity:(NSString *)cityName withQuery:(NSString *)query block:(void(^)(NSArray * resultArray))block;

/// 根据经纬度获取地址
/// @param latitude 纬度
/// @param longitude 经度
/// @param completion 完成回调，包含地址字符串或错误信息
+ (void)yi_getAddressFromLatitude:(CLLocationDegrees)latitude
                        longitude:(CLLocationDegrees)longitude
                       completion:(void(^)(CLPlacemark * _Nullable placemark,NSString * _Nullable address, NSError * _Nullable error))completion;

/// 根据地址获取经纬度
/// @param address 地址字符串
/// @param completion 完成回调，包含经纬度或错误信息
+ (void)yi_getCoordinateFromAddress:(NSString *)address
                         completion:(void(^)(CLLocationCoordinate2D coordinate, NSError * _Nullable error))completion;

/// 时间转 日期 时分
/// @param date 时间
+ (NSString *)yi_formattedDateStringFromDate:(NSDate *)date;

@end

NS_ASSUME_NONNULL_END
