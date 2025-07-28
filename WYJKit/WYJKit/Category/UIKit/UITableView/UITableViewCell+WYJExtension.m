//
//  UITableViewCell+WYJExtension.m
//  WYJKit
//
//  Created by 祎 on 2025/7/24.
//

#import "UITableViewCell+WYJExtension.h"

@implementation UITableViewCell (WYJExtension)


- (void)reloadTableView {
    dispatch_async(dispatch_get_main_queue(), ^{
        if ([self.superview isKindOfClass:UITableView.class]) {
            UITableView *tableView = (UITableView *)self.superview;
            [UIView performWithoutAnimation:^{
                [tableView beginUpdates];
                [tableView endUpdates];
            }];
        }
    });
}

@end
