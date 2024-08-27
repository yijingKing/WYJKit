//
//  UITableView+extension.h
//  LCProduct
//
//  Created by 王祎境 on 2024/7/6.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITableView (WYJExtension)
// 根据类名注册cell
- (void)yi_registerClass:(Class)cellClass;
// 根据类名注册cell
- (void)yi_registerNibClass:(Class)cellClass;
// 根据类名获取cell,如果未注册自动注册
- (nullable __kindof UITableViewCell *)yi_dequeueReusableCellWithClass:(Class)cellClass;
@end

NS_ASSUME_NONNULL_END
