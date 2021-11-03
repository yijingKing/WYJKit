/*******************************************************************************
 Copyright (K), 2019 - ~, ╰莪呮想好好宠Nǐつ 
 
 Author:        ╰莪呮想好好宠Nǐつ (Wang Yijing)
 E-mail:        1091676312@qq.com
 GitHub:        https://github.com/MemoryKing
 ********************************************************************************/


#import "WYJSystemService.h"

@implementation WYJSystemService
+ (void)yi_PhoneCallWithPhoneNum:(NSString *)phoneNum {
    NSURL * url = [NSURL URLWithString:[@"tel:" stringByAppendingString:phoneNum]];
    if (@available(iOS 10.0, *)) {
        [UIApplication.sharedApplication openURL:url options:@{} completionHandler:nil];
    } else {
        // Fallback on earlier versions
    }
}

+ (void)yi_JumpToAppReviewPageWithAppId:(NSString *)appId {
    NSURL * url = [NSURL URLWithString:[@"itms-apps://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&id=" stringByAppendingString:appId]];
    if (@available(iOS 10.0, *)) {
        [UIApplication.sharedApplication openURL:url options:@{} completionHandler:nil];
    } else {
        // Fallback on earlier versions
    }
}

//App Store评价
+ (void)yi_JumpToAppStoreEvaluation:(NSString *)appID {
    NSURL * url = [NSURL URLWithString:@"http://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?id=%@&pageNumber=0&sortOrdering=2&type=Purple+Software&mt=8"];
    if (@available(iOS 10.0, *)) {
        [UIApplication.sharedApplication openURL:url options:@{} completionHandler:nil];
    } else {
        // Fallback on earlier versions
    }
}
//分享给朋友
+ (void)yi_ShareToFriends:(NSString *)name imageName:(NSString *)imgName appId:(int)appId {
    NSString * str = name;
    UIImage * image = [UIImage imageNamed:imgName];
    NSString * appid = [NSString stringWithFormat:@"%d",appId];
    NSURL *urlToShare = [NSURL URLWithString:[NSString  stringWithFormat: @"itms-apps://itunes.apple.com/app/id%@",appid]];
    NSArray *images = @[str,image,urlToShare];
    
    UIActivityViewController *activityController=[[UIActivityViewController alloc]initWithActivityItems:images applicationActivities:nil];
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:activityController animated:YES completion:nil];
}

//意见反馈
+ (void)yi_JumpToAppFeedback:(NSString *)appid {
    NSURL * url = [NSURL URLWithString:[NSString stringWithFormat:@"http://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?id=%@&pageNumber=0&sortOrdering=2&type=Purple+Software&mt=8",appid]];
    if (@available(iOS 10.0, *)) {
        [UIApplication.sharedApplication openURL:url options:@{} completionHandler:nil];
    } else {
        // Fallback on earlier versions
    }
}
@end
