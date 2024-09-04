/*
  Created by 祎 on 2021
  Copyright © 2021年 祎. All rights reserved.
*/

#import "WYJImagePickerManager.h"

@implementation WYJImagePickerManager {
    ImagePickerCompletionBlock _completionBlock;
}

+ (instancetype)sharedManager {
    static WYJImagePickerManager *sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [[self alloc] init];
    });
    return sharedManager;
}

- (void)presentImagePickerWithSourceType:(UIImagePickerControllerSourceType)sourceType
                              completion:(ImagePickerCompletionBlock)completion {
    _completionBlock = [completion copy];
    
    UIViewController *rootViewController = [UIApplication sharedApplication].delegate.window.rootViewController;
    
    if ([UIImagePickerController isSourceTypeAvailable:sourceType]) {
        UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
        imagePicker.delegate = self;
        imagePicker.sourceType = sourceType;
        [rootViewController presentViewController:imagePicker animated:YES completion:nil];
    } else {
        NSLog(@"Source type not available.");
    }
}

- (void)presentImagePickerOptionsWithCompletion:(ImagePickerCompletionBlock)completion {
    _completionBlock = [completion copy];
    
    UIViewController *rootViewController = [UIApplication sharedApplication].delegate.window.rootViewController;
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"选择图片来源"
                                                                             message:nil
                                                                      preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *cameraAction = [UIAlertAction actionWithTitle:@"相机"
                                                           style:UIAlertActionStyleDefault
                                                         handler:^(UIAlertAction * _Nonnull action) {
        [self presentImagePickerWithSourceType:UIImagePickerControllerSourceTypeCamera
                                    completion:completion];
    }];
    
    UIAlertAction *photoLibraryAction = [UIAlertAction actionWithTitle:@"相册"
                                                                 style:UIAlertActionStyleDefault
                                                               handler:^(UIAlertAction * _Nonnull action) {
        [self presentImagePickerWithSourceType:UIImagePickerControllerSourceTypePhotoLibrary
                                    completion:completion];
    }];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消"
                                                           style:UIAlertActionStyleCancel
                                                         handler:nil];
    
    [alertController addAction:cameraAction];
    [alertController addAction:photoLibraryAction];
    [alertController addAction:cancelAction];
    
    [rootViewController presentViewController:alertController animated:YES completion:nil];
}

#pragma mark - UIImagePickerControllerDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    UIImage *selectedImage = info[UIImagePickerControllerOriginalImage];
    if (_completionBlock) {
        _completionBlock(selectedImage);
    }
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:nil];
}

@end
