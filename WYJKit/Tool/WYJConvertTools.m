//
//  Tools.m
//  LCProduct
//
//  Created by 王祎境 on 2024/6/24.
//

#import "WYJConvertTools.h"
#import "WYJKitHeader.h"
#import <MapKit/MapKit.h>
#import "WYJToast.h"

@implementation WYJConvertTools

+ (NSString *)yi_roundUpAndFormat:(double)value toDecimalPlaces:(NSInteger)decimalPlaces {
    // 创建一个包含 double 值的 NSDecimalNumber 对象
    NSDecimalNumber *decimalNumber = [[NSDecimalNumber alloc] initWithDouble:value];
    
    // 设置保留的小数位数和舍入方式为 NSRoundUp（向上取整）
    NSDecimalNumberHandler *roundingBehavior = [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:NSRoundUp
                                                                                                     scale:(short)decimalPlaces
                                                                                          raiseOnExactness:NO
                                                                                           raiseOnOverflow:NO
                                                                                          raiseOnUnderflow:NO
                                                                                       raiseOnDivideByZero:NO];
    // 向上取整
    NSDecimalNumber *roundedNumber = [decimalNumber decimalNumberByRoundingAccordingToBehavior:roundingBehavior];
    
    // 将结果转换为字符串并返回
    return [roundedNumber stringValue];
}

+ (NSString *)convertDoubleToString:(double)value {
    // 创建 NSNumberFormatter
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    // 设置格式：整数部分不带小数点
    formatter.minimumFractionDigits = 0;
    formatter.maximumFractionDigits = 2;
    // 转换 double 为字符串
    return [formatter stringFromNumber:@(value)];
}


+ (NSString *)yi_stringWithDouble:(double)value {
    return [self yi_stringWithDouble:value decimalPlaces:2];
}
+ (NSString *)yi_stringWithDouble:(double)value decimalPlaces:(NSInteger)places{
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    formatter.numberStyle = NSNumberFormatterDecimalStyle;
    formatter.minimumIntegerDigits = 1;
    formatter.minimumFractionDigits = 0;
    formatter.maximumFractionDigits = places;
    return [formatter stringFromNumber:@(value)];
}

+ (NSString *)yi_stringWithInteger:(NSInteger)value {
    return [NSString stringWithFormat:@"%ld",value];
}

+ (NSString *)yi_moneyWithDouble:(double)value {
    return [NSString stringWithFormat:@"￥%@",[self yi_stringWithDouble:value]];
}

+ (NSString *)yi_obscurePhoneNumber:(NSString *)phoneNumber {
    if (phoneNumber.length < 7) {
        return phoneNumber;
    }
    NSString *prefix = [phoneNumber substringToIndex:3];
    NSString *suffix = [phoneNumber substringFromIndex:phoneNumber.length - 4];
    NSString *obscuredPhoneNumber = [NSString stringWithFormat:@"%@****%@", prefix, suffix];
    return obscuredPhoneNumber;
}
+ (NSAttributedString *)yi_attributedStringFromHTMLString:(NSString *)htmlString {
    if (YJStringIsEmpty(htmlString)) {
        return [[NSAttributedString alloc] initWithString:@""];
    }
    NSData *data = [htmlString dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *options = @{NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType,
                              NSCharacterEncodingDocumentAttribute: @(NSUTF8StringEncoding)};
    
    NSError *error = nil;
    NSAttributedString *attributedString = [[NSAttributedString alloc] initWithData:data
                                                                            options:options
                                                                 documentAttributes:nil
                                                                              error:&error];
    if (error) {
        return [[NSAttributedString alloc] initWithString:htmlString];
    }
    
    return attributedString;
}
+ (BOOL)yi_dictionariesAreEqual:(NSDictionary *)dict1 dic2:( NSDictionary *)dict2{
    if (dict1 == dict2) {
        return YES;
    }
    if ([dict1 count] != [dict2 count]) {
        return NO;
    }
    for (id key in dict1) {
        id value1 = dict1[key];
        id value2 = dict2[key];
        if (value2 == nil || ![value1 isEqual:value2]) {
            return NO;
        }
    }
    return YES;
}

+ (NSString *)yi_distanceWithNum:(NSInteger)num {
    if (num >= 1000) {
        return [NSString stringWithFormat:@"%.1fkm", num / 1000.0];
    }else {
        return [NSString stringWithFormat:@"%ldm", num];
    }
}
+ (BOOL)yi_isVideoURL:(NSString *)urlString {
    NSString *lowercase = [urlString lowercaseString];
    return [lowercase hasSuffix:@"mp4"] || [lowercase hasSuffix:@"mov"] || [lowercase hasSuffix:@"m4v"] || [lowercase hasSuffix:@"mp3"];
}

+ (NSString *)yi_timeFormatted:(NSInteger)totalSeconds {
    NSInteger seconds = totalSeconds % 60;
    NSInteger minutes = (totalSeconds / 60) % 60;
    NSInteger hours = totalSeconds / 3600;
    return [NSString stringWithFormat:@"%02ld:%02ld:%02ld", (long)hours, (long)minutes, (long)seconds];
}


+ (void)yi_mapNavigationWithLocation:(CLLocationCoordinate2D)location {
    NSDictionary *maps = @{
        @"谷歌地图": @"comgooglemaps://",
        @"百度地图": @"baidumap://",
        @"高德地图": @"iosamap://",
        @"腾讯地图": @"qqmap://"
    };
    NSMutableArray *availableMaps = [NSMutableArray array];

    for (NSString *mapName in maps) {
        NSString *urlScheme = maps[mapName];
        if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:urlScheme]]) {
            [availableMaps addObject:mapName];
        }
    }
    CLLocationCoordinate2D coordinate = location;
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"选择地图" message:nil preferredStyle:UIAlertControllerStyleActionSheet];

    for (NSString *mapName in availableMaps) {
        [alert addAction:[UIAlertAction actionWithTitle:mapName style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            if ([mapName isEqualToString:@"Apple Maps"]) {
                NSString *appleMapsURLString = [NSString stringWithFormat:@"http://maps.apple.com/?daddr=%f,%f", coordinate.latitude, coordinate.longitude];
                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:appleMapsURLString] options:@{} completionHandler:nil];
            } else if ([mapName isEqualToString:@"谷歌地图"]) {
                NSString *googleMapsURLString = [NSString stringWithFormat:@"comgooglemaps://?daddr=%f,%f&directionsmode=driving", coordinate.latitude, coordinate.longitude];
                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:googleMapsURLString] options:@{} completionHandler:nil];
            } else if ([mapName isEqualToString:@"百度地图"]) {
                NSString *baiduMapsURLString = [NSString stringWithFormat:@"baidumap://map/direction?destination=latlng:%f,%f&mode=driving", coordinate.latitude, coordinate.longitude];
                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:baiduMapsURLString] options:@{} completionHandler:nil];
            } else if ([mapName isEqualToString:@"高德地图"]) {
                NSString *gaodeMapsURLString = [NSString stringWithFormat:@"iosamap://path?dlat=%f&dlon=%f&dev=0&t=0", coordinate.latitude, coordinate.longitude];
                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:gaodeMapsURLString] options:@{} completionHandler:nil];
            } else if ([mapName isEqualToString:@"腾讯地图"]) {
                NSString *tencentMapsURLString = [NSString stringWithFormat:@"qqmap://map/routeplan?type=drive&tocoord=%f,%f", coordinate.latitude, coordinate.longitude];
                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:tencentMapsURLString] options:@{} completionHandler:nil];
            }
        }]];
    }
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
    [YJKeyWindow.rootViewController presentViewController:alert animated:YES completion:nil];
}

+ (void)yi_searchForPlacesInCity:(NSString *)cityName withQuery:(NSString *)query block:(void(^)(NSArray * resultArray))block{
    MKLocalSearchRequest *citySearchRequest = [[MKLocalSearchRequest alloc] init];
    citySearchRequest.naturalLanguageQuery = cityName;
    MKLocalSearch *citySearch = [[MKLocalSearch alloc] initWithRequest:citySearchRequest];
    [citySearch startWithCompletionHandler:^(MKLocalSearchResponse * _Nullable cityResponse, NSError * _Nullable error) {
        if (error) {
            NSLog(@"城市搜索失败: %@", error.localizedDescription);
            [self showLCToast:error.localizedDescription];
            return;
        }
        // 获取城市的第一个搜索结果，并获取其中心坐标
        MKMapItem *cityMapItem = cityResponse.mapItems.firstObject;
        if (cityMapItem) {
            CLLocationCoordinate2D cityCoordinate = cityMapItem.placemark.location.coordinate;

            // 第二步：围绕城市中心设置搜索区域，进行更广泛的地点搜索
            MKLocalSearchRequest *placeSearchRequest = [[MKLocalSearchRequest alloc] init];
            placeSearchRequest.naturalLanguageQuery = YJSTRING_FORMAT(@"%@",query); // 搜索条件，比如“餐馆”或“酒店”
            
            // 设置一个大的搜索区域，例如以城市中心为原点，半径为50公里
            MKCoordinateRegion cityRegion = MKCoordinateRegionMakeWithDistance(cityCoordinate, 30000, 30000); // 50公里范围
            placeSearchRequest.region = cityRegion;
            NSMutableArray * arr = [NSMutableArray array];
            MKLocalSearch *placeSearch = [[MKLocalSearch alloc] initWithRequest:placeSearchRequest];
            [placeSearch startWithCompletionHandler:^(MKLocalSearchResponse * _Nullable placeResponse, NSError * _Nullable error) {
                if (error) {
                    NSLog(@"地点搜索失败: %@", error.localizedDescription);
                    [self showLCToast:error.localizedDescription];
                    !block?:block(@[]);
                    return;
                }
                [placeResponse.mapItems enumerateObjectsUsingBlock:^(MKMapItem * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                    [arr addObject:obj];
                }];
                !block?:block(arr);
            }];
            
        } else {
            NSLog(@"未找到城市信息");
            [self showLCToast:@"未找到城市信息"];
            !block?:block(@[]);
        }
    }];
}
+ (void)showLCToast:(NSString *)tips {
    
    [WYJToast showInfo:tips];
}
+(void)showToast:(NSString*)msg andDuration:(int)duration completion:(nullable void (^) (void))completion{
    if (YJStringIsEmpty(msg)) {
        NSLog(@"弹窗消息为空！！！");
        return;
    }
    static BOOL is_show = NO;
    if (is_show) {
        return;
    }
    is_show = YES;
    [WYJToast showInfo:msg];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(duration * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        is_show = NO;
        [WYJToast dismiss];
        if (completion) {
            completion();
        }
    });
    
}

+ (void)yi_getAddressFromLatitude:(CLLocationDegrees)latitude
                     longitude:(CLLocationDegrees)longitude
                    completion:(void(^)(CLPlacemark * _Nullable placemark,NSString * _Nullable address, NSError * _Nullable error))completion {
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    CLLocation *location = [[CLLocation alloc] initWithLatitude:latitude longitude:longitude];
    [geocoder reverseGeocodeLocation:location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        if (error) {
            completion(nil,nil, error);
            return;
        }
        CLPlacemark *placemark = [placemarks firstObject];
        if (placemark) {
            NSMutableArray<NSString *> *addressComponents = [NSMutableArray array];
            if (placemark.administrativeArea) {
                [addressComponents addObject:placemark.administrativeArea];
            }
            if (placemark.locality) {
                [addressComponents addObject:placemark.locality];
            }
            if (placemark.subLocality) {
                [addressComponents addObject:placemark.subLocality];
            }
            if (placemark.thoroughfare) {
                [addressComponents addObject:placemark.thoroughfare];
            }
            if (placemark.subThoroughfare) {
                [addressComponents addObject:placemark.subThoroughfare];
            }
            
            NSString *formattedAddress = [addressComponents componentsJoinedByString:@" "];
            completion(placemark,formattedAddress, nil);
        } else {
            NSError *noPlacemarkError = [NSError errorWithDomain:@"com.locationtool.error"
                                                            code:1001
                                                        userInfo:@{NSLocalizedDescriptionKey: @"无法获取地标信息"}];
            completion(nil,nil, noPlacemarkError);
        }
    }];
}

+ (void)yi_getCoordinateFromAddress:(NSString *)address
                      completion:(void(^)(CLLocationCoordinate2D coordinate, NSError * _Nullable error))completion {
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    [geocoder geocodeAddressString:address completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        if (error) {
            completion(kCLLocationCoordinate2DInvalid, error);
            return;
        }
        CLPlacemark *placemark = [placemarks firstObject];
        CLLocationCoordinate2D coordinate = placemark.location.coordinate;
        completion(coordinate, nil);
    }];
}

///时间转 日期 时分
+ (NSString *)yi_formattedDateStringFromDate:(NSDate *)date {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:date];
    NSDateComponents *todayComponents = [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:[NSDate date]];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"HH:mm";
    NSString *timeString = [formatter stringFromDate:date];
    
    if (components.year == todayComponents.year &&
        components.month == todayComponents.month &&
        components.day == todayComponents.day) {
        return [NSString stringWithFormat:@"今日 %@", timeString];
    }
    
    // 设置简短的周几格式，如 "周一"
    formatter.locale = [NSLocale localeWithLocaleIdentifier:@"zh_CN"]; // 确保是中文格式
    formatter.dateFormat = @"ccc";
    NSString *weekString = [formatter stringFromDate:date];
    return [NSString stringWithFormat:@"%@ %@", weekString, timeString];
}

/// 将任意对象（NSString、NSNumber、NSArray、NSDictionary、NSNull、NSDate）转为字符串
#define YJSTRING_FROM_ANY(obj) [WYJConvertTools yi_stringFromAnyObject:(obj)]
/// 快速将任意对象转换为字符串
+ (NSString *)yi_stringFromAnyObject:(id)obj {
    if (!obj || obj == [NSNull null]) {
        return @"";
    }
    if ([obj isKindOfClass:[NSString class]]) {
        return (NSString *)obj;
    } else if ([obj isKindOfClass:[NSNumber class]]) {
        return [(NSNumber *)obj stringValue];
    } else if ([obj isKindOfClass:[NSDate class]]) {
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
        return [formatter stringFromDate:(NSDate *)obj];
    } else if ([obj isKindOfClass:[NSArray class]] || [obj isKindOfClass:[NSDictionary class]]) {
        NSError *error = nil;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:obj options:0 error:&error];
        if (!error && jsonData) {
            return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        }
        return @"";
    } else {
        return [obj description];
    }
}


@end
