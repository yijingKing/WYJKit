/*
  Created by King on 2021
  Copyright © 2021年 King. All rights reserved.
*/
#import "WYJBaseTableViewDelegate.h"


@implementation WYJBaseTableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if (self.numberForSectionBlock) {
        return self.numberForSectionBlock(tableView) ?: 0;
    }
    return 0;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.numberOfRowsInSection) {
        return self.numberOfRowsInSection(tableView,section);
    }
    return 0;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.heightForRowAtIndexPath) {
        return self.heightForRowAtIndexPath(tableView,indexPath);
    }
    return 0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.cellForRowAtIndexPath) {
        return self.cellForRowAtIndexPath(tableView,indexPath);
    }
    return UITableViewCell.alloc.init;
}
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.willDisplayCell) {
        self.willDisplayCell(tableView,cell,indexPath);
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.didSelectRowAtIndexPath) {
        self.didSelectRowAtIndexPath(tableView,indexPath);
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (self.heightForHeaderInSection) {
        return self.heightForHeaderInSection(tableView,section);
    }
    return 0.01;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (self.viewForHeaderInSection) {
        return self.viewForHeaderInSection(tableView,section);
    }
    return UIView.alloc.init;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (self.heightForFooterInSection) {
        return self.heightForFooterInSection(tableView,section);
    }
    return 0.01;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    if (self.viewForFooterInSection) {
        return self.viewForFooterInSection(tableView,section);
    }
    return UIView.alloc.init;
}




@end
