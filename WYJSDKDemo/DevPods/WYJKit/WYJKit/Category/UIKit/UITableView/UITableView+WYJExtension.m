/*
  Created by 祎 on 2021
  Copyright © 2021年 祎. All rights reserved.
*/

#import "UITableView+WYJExtension.h"

@implementation UITableView (WYJExtension)

- (void)yi_registerClass:(Class)cellClass {
    [self registerClass:cellClass forCellReuseIdentifier:NSStringFromClass(cellClass)];
}
- (nullable __kindof UITableViewCell *)yi_dequeueReusableCellWithClass:(Class)cellClass {
    NSString *identifier = NSStringFromClass(cellClass);
    __kindof UITableViewCell *cell = [self dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        if ([self hasRegisteredClass:cellClass]) {
            cell = [self dequeueReusableCellWithIdentifier:identifier];
        } else {
            NSString *nibName = NSStringFromClass(cellClass);
            if ([[NSBundle mainBundle] pathForResource:nibName ofType:@"nib"]) {
                [self registerNib:[UINib nibWithNibName:nibName bundle:[NSBundle mainBundle]] forCellReuseIdentifier:identifier];
            } else {
                [self registerClass:cellClass forCellReuseIdentifier:identifier];
            }
            cell = [self dequeueReusableCellWithIdentifier:identifier];
        }
    }
    return cell;
}
- (BOOL)hasRegisteredClass:(Class)cellClass {
    NSString *identifier = NSStringFromClass(cellClass);
    return ([self dequeueReusableCellWithIdentifier:identifier] != nil);
}

- (void)yi_registerNibClass:(Class)cellClass {
    [self registerNib:[UINib nibWithNibName:NSStringFromClass(cellClass) bundle:nil] forCellReuseIdentifier:NSStringFromClass(cellClass)];
}

@end
