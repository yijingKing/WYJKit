/*
  Created by 祎 on 2021
  Copyright © 2021年 祎. All rights reserved.
*/

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
typedef void (^ImagePickerCompletionBlock)(NSArray<UIImage *> * images);
@interface WYJImagePickerManager : NSObject<UIImagePickerControllerDelegate, UINavigationControllerDelegate>
+ (instancetype)sharedManager;

/// 单独功能
/// - Parameters:
///   - sourceType: 类型
- (void)presentImagePickerWithSourceType:(UIImagePickerControllerSourceType)sourceType maxImagesCount:(NSInteger)maxImagesCount
                              completion:(ImagePickerCompletionBlock)completion;

/// 附带选择弹窗
- (void)presentImagePickerOptionsWithCompletion:(ImagePickerCompletionBlock)completion;
- (void)presentImagePickerOptionsWithMaxImagesCount:(NSInteger)maxImagesCount completion:(ImagePickerCompletionBlock)completion;
@end

NS_ASSUME_NONNULL_END
