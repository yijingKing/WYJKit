/*
  Created by 祎 on 2021
  Copyright © 2021年 祎. All rights reserved.
*/

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
typedef void (^ImagePickerCompletionBlock)(UIImage *image);
@interface WYJImagePickerManager : NSObject<UIImagePickerControllerDelegate, UINavigationControllerDelegate>
+ (instancetype)sharedManager;
- (void)presentImagePickerWithSourceType:(UIImagePickerControllerSourceType)sourceType
                              completion:(ImagePickerCompletionBlock)completion;

- (void)presentImagePickerOptionsWithCompletion:(ImagePickerCompletionBlock)completion;
@end

NS_ASSUME_NONNULL_END
