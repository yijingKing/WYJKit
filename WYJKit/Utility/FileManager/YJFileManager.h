//
//  YJFileManager.h
//  YJKitDemo
//
//  Created by 祎 on 2019/8/28.
//  Copyright © 2019 Eugene King. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface YJFileManager : NSObject
+(UIImage *)getDocumentImageName:(NSString *)name;
+(NSString *)saveDocumentsImage:(UIImage *)image imgName:(NSString *)name;
@end

NS_ASSUME_NONNULL_END
