/*******************************************************************************
 Copyright (K), 2019 - ~, ╰莪呮想好好宠Nǐつ 
 
 Author:        ╰莪呮想好好宠Nǐつ (Wang Yijing)
 E-mail:        1091676312@qq.com
 GitHub:        https://github.com/MemoryKing
 ********************************************************************************/

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WYJSystemService : NSObject

/**
 *  直接拨打电话(拨打完电话回不到原来的应用,会停留在通讯录里,而且是直接拨打,不弹出提示)
 *
 *  @param phoneNum 电话号码
 */
+ (void)yi_PhoneCallWithPhoneNum:(NSString *)phoneNum;

/**
 *  跳到app的评论页
 *
 *  @param appId APP的id号
 */
+ (void)yi_JumpToAppReviewPageWithAppId:(NSString *)appId;

//App Store评价
+ (void)yi_JumpToAppStoreEvaluation:(NSString *)appID;

//分享给朋友
+ (void)yi_ShareToFriends:(NSString *)name imageName:(NSString *)imgName appId:(int)appId;

//意见反馈
+ (void)yi_JumpToAppFeedback:(NSString *)appid;

@end

NS_ASSUME_NONNULL_END
