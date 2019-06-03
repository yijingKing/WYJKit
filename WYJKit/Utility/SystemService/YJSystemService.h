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

@interface YJSystemService : NSObject

/**
 *  直接拨打电话(拨打完电话回不到原来的应用,会停留在通讯录里,而且是直接拨打,不弹出提示)
 *
 *  @param phoneNum 电话号码
 */
+ (void)wPhoneCallWithPhoneNum:(NSString *)phoneNum;

/**
 *  弹出对话框并询问是否拨打电话(打完电话后还会回到原来的程序,也会弹出提示,推荐这种)
 *
 *  @param phoneNum 电话号码
 *  @param view     contentView
 */
+ (void)wPhoneCallWithPhoneNum:(NSString *)phoneNum contentView:(UIView *)view;

/**
 *  跳到app的评论页
 *
 *  @param appId APP的id号
 */
+ (void)wJumpToAppReviewPageWithAppId:(NSString *)appId;

//App Store评价
+ (void)wJumpToAppStoreEvaluation:(NSString *)appID;

//分享给朋友
+ (void)wShareToFriends:(NSString *)name imageName:(NSString *)imgName appId:(int)appId;

//意见反馈
+ (void)wJumpToAppFeedback:(NSString *)appid;

@end

NS_ASSUME_NONNULL_END
