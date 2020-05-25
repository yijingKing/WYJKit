/*******************************************************************************
 Copyright (K), 2019 - ~, ╰莪呮想好好宠Nǐつ 
 
 Author:        ╰莪呮想好好宠Nǐつ (Wang Yijing)
 E-mail:        1091676312@qq.com
 GitHub:        https://github.com/MemoryKing
 ********************************************************************************/


#import "YJSystemService.h"

@implementation YJSystemService
+ (void)wPhoneCallWithPhoneNum:(NSString *)phoneNum {
    NSURL * url = [NSURL URLWithString:[@"tel:" stringByAppendingString:phoneNum]];
    NSString *version= [UIDevice currentDevice].systemVersion;
    if(version.doubleValue >= 10.0) {
        if (@available(iOS 10.0, *)) {
            [UIApplication.sharedApplication openURL:url options:@{} completionHandler:nil];
        } else {
            // Fallback on earlier versions
        }
    }else{
        [UIApplication.sharedApplication openURL:url];
    }
}

+ (void)wJumpToAppReviewPageWithAppId:(NSString *)appId {
    NSURL * url = [NSURL URLWithString:[@"itms-apps://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&id=" stringByAppendingString:appId]];
    NSString *version= [UIDevice currentDevice].systemVersion;
    if(version.doubleValue >= 10.0) {
        if (@available(iOS 10.0, *)) {
            [UIApplication.sharedApplication openURL:url options:@{} completionHandler:nil];
        } else {
            // Fallback on earlier versions
        }
    } else {
        // Fallback on earlier versions
        [UIApplication.sharedApplication openURL:url];
    }
}

//App Store评价
+ (void)wJumpToAppStoreEvaluation:(NSString *)appID {
    NSURL * url = [NSURL URLWithString:@"http://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?id=%@&pageNumber=0&sortOrdering=2&type=Purple+Software&mt=8"];
    NSString *version= [UIDevice currentDevice].systemVersion;
    if(version.doubleValue >= 10.0) {
        if (@available(iOS 10.0, *)) {
            [UIApplication.sharedApplication openURL:url options:@{} completionHandler:nil];
        } else {
            // Fallback on earlier versions
        }
    } else {
        [UIApplication.sharedApplication openURL:url];
    }
}
//分享给朋友
+ (void)wShareToFriends:(NSString *)name imageName:(NSString *)imgName appId:(int)appId {
    NSString * str = name;
    UIImage * image = [UIImage imageNamed:imgName];
    NSString * appid = [NSString stringWithFormat:@"%d",appId];
    NSURL *urlToShare = [NSURL URLWithString:[NSString  stringWithFormat: @"itms-apps://itunes.apple.com/app/id%@",appid]];
    NSArray *images = @[str,image,urlToShare];
    
    UIActivityViewController *activityController=[[UIActivityViewController alloc]initWithActivityItems:images applicationActivities:nil];
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:activityController animated:YES completion:nil];
}

//意见反馈
+ (void)wJumpToAppFeedback:(NSString *)appid {
    NSURL * url = [NSURL URLWithString:[NSString stringWithFormat:@"http://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?id=%@&pageNumber=0&sortOrdering=2&type=Purple+Software&mt=8",appid]];
    NSString *version= [UIDevice currentDevice].systemVersion;
    if(version.doubleValue >= 10.0) {
        if (@available(iOS 10.0, *)) {
            [UIApplication.sharedApplication openURL:url options:@{} completionHandler:nil];
        } else {
            // Fallback on earlier versions
        }
    } else {
        // Fallback on earlier versions
        [UIApplication.sharedApplication openURL:url];
    }
}
@end
