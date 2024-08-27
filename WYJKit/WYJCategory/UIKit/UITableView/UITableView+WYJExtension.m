//
//  UITableView+extension.m
//  LCProduct
//
//  Created by 王祎境 on 2024/7/6.
//

#import "UITableView+WYJExtension.h"

@implementation UITableView (WYJExtension)

- (void)registerClass:(Class)cellClass {
    [self registerClass:cellClass forCellReuseIdentifier:NSStringFromClass(cellClass)];
}
- (__kindof UITableViewCell *)dequeueReusableCellWithClass:(Class)cellClass {
    return [self dequeueReusableCellWithIdentifier:NSStringFromClass(cellClass)];
}

- (void)registerNibClass:(Class)cellClass {
    [self registerNib:[UINib nibWithNibName:NSStringFromClass(cellClass) bundle:nil] forCellReuseIdentifier:NSStringFromClass(cellClass)];
}

@end
