//
//  WYJBaseViewModel.m
//  WYJKitDemo
//
//  Created by 祎 on 2021/12/14.
//

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
