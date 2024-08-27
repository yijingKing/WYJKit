//
//  UITableView+extension.h
//  LCProduct
//
//  Created by 王祎境 on 2024/7/6.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITableView (WYJExtension)
- (void)registerClass:(Class)cellClass;
- (void)registerNibClass:(Class)cellClass;
- (__kindof UITableViewCell *)dequeueReusableCellWithClass:(Class)cellClass;
@end

NS_ASSUME_NONNULL_END
