/*
  Created by 祎 on 2021
  Copyright © 2021年 祎. All rights reserved.
*/

#import <UIKit/UIKit.h>


NSString * _Nullable WAppDisplayName(void);
NSString * _Nullable WAppVersion(void);
NS_ASSUME_NONNULL_BEGIN
@interface UIApplication (WYJAdd)

/// "Documents" folder in this app's sandbox.
@property (nonatomic, readonly) NSURL * yi_documentsURL;
@property (nonatomic, readonly) NSString * yi_documentsPath;

/// "Caches" folder in this app's sandbox.
@property (nonatomic, readonly) NSURL * yi_cachesURL;
@property (nonatomic, readonly) NSString * yi_cachesPath;

/// "Library" folder in this app's sandbox.
@property (nonatomic, readonly) NSURL * yi_libraryURL;
@property (nonatomic, readonly) NSString * yi_libraryPath;

/// Application's Display Name
@property (nullable, nonatomic, readonly) NSString * yi_appDisplayName;
/// Application's Bundle Name (show in SpringBoard).
@property (nullable, nonatomic, readonly) NSString * yi_appBundleName;

/// Application's Bundle ID.  e.g. "com.ibireme.MyApp"
@property (nullable, nonatomic, readonly) NSString * yi_appBundleID;

/// Application's Version.  e.g. "1.2.0"
@property (nullable, nonatomic, readonly) NSString * yi_appVersion;

/// Application's Build number. e.g. "123"
@property (nullable, nonatomic, readonly) NSString * yi_appBuildVersion;

@end
NS_ASSUME_NONNULL_END




