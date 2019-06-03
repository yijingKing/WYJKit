/*******************************************************************************
 Copyright (K), 2019 - ~, ╰莪呮想好好宠Nǐつ 
 
 Author:        ╰莪呮想好好宠Nǐつ (Wang Yijing)
 E-mail:        1091676312@qq.com
 GitHub:        https://github.com/MemoryKing
 ********************************************************************************/


#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YJBaseViewController : UIViewController
/** Call the system album, take photos and upload pictures */
- (void)setUploadPictures:(void(^)(UIImage * img))bloack;

@end

NS_ASSUME_NONNULL_END
