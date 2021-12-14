/*
 Created by King on 2021
 Copyright © 2021年 King. All rights reserved.
 */

#import "WYJBaseView.h"
#import "BaseTableViewHeader.h"
NS_ASSUME_NONNULL_BEGIN

@interface WYJTableBaseView : WYJBaseView
@property (strong, nonatomic, nullable) WYJBaseTableView * mainTableView;
/// 样式(默认UITableViewStyleGrouped)
@property (nonatomic, assign) UITableViewStyle tableViewStyle;

/// 刷新回调 (调用回调的方法此block失效)
@property (nonatomic,copy) void (^refreshDataBlock)(void);
/// 加载回调( 调用回调的方法此block失效)
@property (nonatomic,copy) void (^moreDataBlock)(void);
/// 刷新回调
-(void)getRefreshData;
/// 加载回调
-(void)getMoreData;

///注册cell
- (void)registTableViewCell:(Class)cell;
///注册cell
- (void)registTableViewCells:(NSArray <Class>*)cells;
///添加tableview
- (void)addTableView;
///添加tableview
- (void)addTableView:(UITableViewStyle)style configuration:(void(^)(UITableView *tableView))block;


@end

NS_ASSUME_NONNULL_END
