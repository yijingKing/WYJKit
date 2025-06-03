/*
  Created by 祎 on 2021
  Copyright © 2021年 祎. All rights reserved.
*/

#import "WYJImagePickerManager.h"
#import <TZImagePickerController/TZImagePickerController.h>
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

- (void)presentImagePickerWithSourceType:(UIImagePickerControllerSourceType)sourceType maxImagesCount:(NSInteger)maxImagesCount
                              completion:(ImagePickerCompletionBlock)completion {
    _completionBlock = [completion copy];
    
    UIViewController *rootViewController = [UIApplication sharedApplication].delegate.window.rootViewController;
    if ([UIImagePickerController isSourceTypeAvailable:sourceType] && UIImagePickerControllerSourceTypeCamera == sourceType) {
        UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
        imagePicker.delegate = self;
        imagePicker.sourceType = sourceType;
        [rootViewController presentViewController:imagePicker animated:YES completion:nil];
    } else {
        TZImagePickerController *imagePickerVc = [[TZImagePickerController alloc] initWithMaxImagesCount:maxImagesCount delegate:nil];
        imagePickerVc.allowTakeVideo = NO;
        imagePickerVc.allowPickingVideo = NO;
        imagePickerVc.allowPickingGif = NO;
        imagePickerVc.naviTitleColor = UIColor.blackColor;
        imagePickerVc.oKButtonTitleColorNormal = UIColor.blackColor;
        imagePickerVc.barItemTextColor = UIColor.blackColor;
        [imagePickerVc setDidFinishPickingPhotosHandle:^(NSArray<UIImage *> *photos, NSArray *assets, BOOL isSelectOriginalPhoto) {
            if (completion) {
                completion(photos);
            }
        }];
        imagePickerVc.modalPresentationStyle = UIModalPresentationOverCurrentContext;
        [rootViewController presentViewController:imagePickerVc animated:YES completion:nil];
    }
}
- (void)presentImagePickerOptionsWithMaxImagesCount:(NSInteger)maxImagesCount completion:(ImagePickerCompletionBlock)completion  {
    
    UIViewController *rootViewController = [UIApplication sharedApplication].delegate.window.rootViewController;
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"选择图片来源"
                                                                             message:nil
                                                                      preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *cameraAction = [UIAlertAction actionWithTitle:@"相机"
                                                           style:UIAlertActionStyleDefault
                                                         handler:^(UIAlertAction * _Nonnull action) {
        [self presentImagePickerWithSourceType:UIImagePickerControllerSourceTypeCamera maxImagesCount:maxImagesCount
                                    completion:completion];
    }];
    
    UIAlertAction *photoLibraryAction = [UIAlertAction actionWithTitle:@"相册"
                                                                 style:UIAlertActionStyleDefault
                                                               handler:^(UIAlertAction * _Nonnull action) {
        [self presentImagePickerWithSourceType:UIImagePickerControllerSourceTypePhotoLibrary maxImagesCount:maxImagesCount
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
- (void)presentImagePickerOptionsWithCompletion:(ImagePickerCompletionBlock)completion {
    [self presentImagePickerOptionsWithMaxImagesCount:1 completion:completion];
}

#pragma mark - UIImagePickerControllerDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    UIImage *selectedImages = info[UIImagePickerControllerOriginalImage];
    if (_completionBlock) {
        _completionBlock(@[selectedImages]);
    }
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:nil];
}

@end
