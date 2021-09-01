/*******************************************************************************
 Copyright (K), 2019 - ~, ╰莪呮想好好宠Nǐつ
 
 Author:        ╰莪呮想好好宠Nǐつ (Wang Yijing)
 E-mail:        1091676312@qq.com
 GitHub:        https://github.com/MemoryKing
 ********************************************************************************/

#import "WYJBaseTableViewDelegate.h"


@implementation WYJBaseTableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if (self.numberForSectionBlock) {
        return self.numberForSectionBlock() ?: 1;
    }
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.numberOfRowsInSection) {
        return self.numberOfRowsInSection(tableView,section);
    }
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.heightForRowAtIndexPath) {
        return self.heightForRowAtIndexPath(tableView,indexPath);
    }
    return 44;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.cellForRowAtIndexPath) {
        return self.cellForRowAtIndexPath(tableView,indexPath);
    }
    return UITableViewCell.alloc.init;
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
