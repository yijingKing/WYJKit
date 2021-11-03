/*******************************************************************************
 Copyright (K), 2019 - ~, ╰莪呮想好好宠Nǐつ
 
 Author:        ╰莪呮想好好宠Nǐつ (Wang Yijing)
 E-mail:        1091676312@qq.com
 GitHub:        https://github.com/MemoryKing
 ********************************************************************************/

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface WYJFileManager : NSObject
+(UIImage *)yi_getDocumentImageName:(NSString *)name;
+(NSString *)yi_saveDocumentsImage:(UIImage *)image imgName:(NSString *)name;
@end

NS_ASSUME_NONNULL_END
