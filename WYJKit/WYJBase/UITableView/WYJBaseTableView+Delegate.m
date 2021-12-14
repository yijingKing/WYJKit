/*
  Created by King on 2021
  Copyright © 2021年 King. All rights reserved.
*/
#import "WYJBaseTableView+Delegate.h"
@implementation WYJBaseTableView (Delegate)

- (void)yi_numberForSection:(WYJNumberForSection)numberForSectionBlock {
    [self.baseDelegate setNumberForSectionBlock:^NSInteger(UITableView * _Nonnull tableView) {
        return numberForSectionBlock(tableView);
    }];
}
- (void)yi_numberOfRowsInSection:(WYJNumberOfRowsInSection)numberOfRowsInSection {
    [self.baseDelegate setNumberOfRowsInSection:^NSInteger(UITableView * _Nonnull tableView, NSInteger section) {
        return numberOfRowsInSection(tableView,section);
    }];
}
- (void)yi_cellForRowAtIndexPath:(WYJCellForRowAtIndexPath)cellForRowAtIndexPath {
    [self.baseDelegate setCellForRowAtIndexPath:^UITableViewCell * _Nullable(UITableView * _Nullable tableView, NSIndexPath * _Nullable indexPath) {
        return cellForRowAtIndexPath(tableView,indexPath);
    }];
}
- (void)yi_didSelectRowAtIndexPath:(WYJDidSelectRowAtIndexPath)didSelectRowAtIndexPath {
    [self.baseDelegate setDidSelectRowAtIndexPath:^(UITableView * _Nullable tableView, NSIndexPath * _Nullable indexPath) {
        didSelectRowAtIndexPath(tableView,indexPath);
    }];
}
- (void)yi_heightForRowAtIndexPath:(WYJHeightForRowAtIndexPath)heightForRowAtIndexPath {
    [self.baseDelegate setHeightForRowAtIndexPath:^CGFloat(UITableView * _Nonnull tableView, NSIndexPath * _Nonnull indexPath) {
        return heightForRowAtIndexPath(tableView,indexPath);
    }];
}
- (void)yi_heightForHeaderInSection:(WYJHeightForHeaderInSection)heightForHeaderInSection {
    [self.baseDelegate setHeightForHeaderInSection:^CGFloat(UITableView * _Nonnull tableView, NSInteger section) {
        return heightForHeaderInSection(tableView,section);
    }];
}
- (void)yi_heightForFooterInSection:(WYJHeightForFooterInSection)heightForFooterInSection {
    [self.baseDelegate setHeightForFooterInSection:^CGFloat(UITableView * _Nonnull tableView, NSInteger section) {
        return heightForFooterInSection(tableView,section);
    }];
}
- (void)yi_viewForHeaderInSection:(WYJViewForHeaderInSection)viewForHeaderInSection {
    [self.baseDelegate setViewForHeaderInSection:^UIView * _Nullable(UITableView * _Nonnull tableView, NSInteger section) {
        return viewForHeaderInSection(tableView,section);
    }];
}
- (void)yi_viewForFooterInSection:(WYJViewForFooterInSection)viewForFooterInSection {
    [self.baseDelegate setViewForFooterInSection:^UIView * _Nullable(UITableView * _Nonnull tableView, NSInteger section) {
        return viewForFooterInSection(tableView,section);
    }];
}
- (void)yi_willDisplayCell:(WYJWillDisplayCell)willDisplayCell {
    [self.baseDelegate setWillDisplayCell:^(UITableView * _Nullable tableView, UITableViewCell * _Nonnull cell, NSIndexPath * _Nullable indexPath) {
        willDisplayCell(tableView,cell,indexPath);
    }];
}
@end
