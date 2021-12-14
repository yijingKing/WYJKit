/*
 Created by King on 2021
 Copyright © 2021年 King. All rights reserved.
 */

#import "WYJBaseViewModel.h"
#import "WYJMacroHeader.h"
@implementation WYJBaseViewModel

#pragma makr UITableViewDelegate, UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if (YJArrayNotEmpty(self.dataSource)) {
        if (![self.dataSource.firstObject isKindOfClass:NSArray.class]) {
            return 1;
        }
    }
    return self.dataSource.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (YJArrayNotEmpty(self.dataSource)) {
        if ([self.dataSource.firstObject isKindOfClass:NSArray.class]) {
            return [self.dataSource[section] count];
        }
    }
    return self.dataSource.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.01;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return UIView.alloc.init;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.01;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return UIView.alloc.init;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewCell.alloc.init;
}

- (NSMutableArray *)dataSource {
    if (!_dataSource) {
        _dataSource = NSMutableArray.array;
    }
    return _dataSource;
}
@end
