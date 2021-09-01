//
//  sjkfaViewController.h
//  YJKitDemo
//
//  Created by Mac on 2020/7/23.
//  Copyright © 2020 Eugene King. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WYJKitHeader.h"
NS_ASSUME_NONNULL_BEGIN


@protocol sjkfa  <NSObject>

@optional
- (void)logDemo;

@end

@interface sjkfaViewController : UIViewController<sjkfa>
@property (nonatomic,weak) id <sjkfa> delegate;
@end

NS_ASSUME_NONNULL_END
