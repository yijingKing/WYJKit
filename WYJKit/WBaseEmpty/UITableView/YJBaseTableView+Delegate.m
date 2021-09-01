//
//  UITableView+Delegate.m
//  YJKitDemo
//
//  Created by PZ-IMAC-1 on 2021/8/31.
//  Copyright © 2021 Eugene King. All rights reserved.
//

#import "YJBaseTableView+Delegate.h"

@implementation YJBaseTableView (Delegate)
- (void)numberForSection:(NumberForSection)numberForSections {
    self.baseDelegate.numberForSectionBlock = numberForSections;
}
- (void)cellForRowAtIndexPath:(CellForRowAtIndexPath)cellForRowAtIndexPath {
    self.baseDelegate.cellForRowAtIndexPath = cellForRowAtIndexPath;
}
@end
