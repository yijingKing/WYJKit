/*
  Created by King on 2021
  Copyright © 2021年 King. All rights reserved.
*/

#import <UIKit/UIKit.h>
#import "BaseTableViewHeader.h"
#import "BaseCollectionViewHeader.h"
NS_ASSUME_NONNULL_BEGIN

@interface WYJBaseView : UIView
@property (strong, nonatomic, nullable) WYJBaseTableView * mainTableView;
@property (strong, nonatomic, nullable) WYJBaseCollectionView * mainCollectionView;

/// 是否开启空界面
@property (nonatomic,assign) BOOL isUserEmpty;
/// 是否开启下拉刷新
@property (nonatomic,assign) BOOL isUseRefreshHeader;
/// 是否开启上拉加载
@property (nonatomic,assign) BOOL isUseRefreshFooter;
/// 是否自动预加载下一页功能
@property (nonatomic,assign) BOOL isAutoRequestMore;

/// 样式(默认UITableViewStyleGrouped)
@property (nonatomic, assign) UITableViewStyle tableViewStyle;
/// 当前页数
@property (nonatomic,assign) NSInteger  pageNow;
/// 总页数
@property (nonatomic,assign) NSInteger  totalPage;
/// 数据数组
@property (nonatomic,copy) NSMutableArray * dataSource;
/// 自动加载百分比(默认80%)
@property (nonatomic,assign) CGFloat  loadingPercentage;
#pragma mark ---  添加tableview ---
///添加tableview
- (void)addTableView;
///添加tableview
- (void)addTableView:(UITableViewStyle)style configuration:(void(^)(UITableView *tableView))block;
#pragma mark ---  添加Collection ---
- (void)addCollection;
- (void)addCollection:(UICollectionViewFlowLayout *)flowLayout configuration:(void(^)(UICollectionView *collectionView))block;

/// 点击回调
@property (nonatomic,copy) void (^yi_tapClickBlock)(void);
/// 界面布局
- (void)initSubviews;
/// 界面约束
- (void)makeConstraint;
/// p配置数据
- (void)configurationData:(id)data;
@end

NS_ASSUME_NONNULL_END
