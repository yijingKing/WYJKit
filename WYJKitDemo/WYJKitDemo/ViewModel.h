//
//  ViewModel.h
//  WYJKitDemo
//
//  Created by 祎 on 2021/12/14.
//

#import <UIKit/UIKit.h>
#import "WYJBaseTableViewDelegate.h"
NS_ASSUME_NONNULL_BEGIN

@interface ViewModel : NSObject
@property (strong, nonatomic)WYJBaseTableViewDelegate * baseDelegate;
@end

NS_ASSUME_NONNULL_END
