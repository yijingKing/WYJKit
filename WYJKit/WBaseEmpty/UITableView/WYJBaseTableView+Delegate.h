//
//  UITableView+Delegate.h
//  YJKitDemo
//
//  Created by PZ-IMAC-1 on 2021/8/31.
//  Copyright © 2021 Eugene King. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "WYJBaseTableView.h"
#import "WYJBaseTableViewDelegate.h"
NS_ASSUME_NONNULL_BEGIN


@interface WYJBaseTableView (Delegate)
//@property (copy, nonatomic) NumberForSection numberForSection;

- (void)numberForSection:(NumberForSection)numberForSection;
- (void)cellForRowAtIndexPath:(CellForRowAtIndexPath)cellForRowAtIndexPath;
@end

NS_ASSUME_NONNULL_END
