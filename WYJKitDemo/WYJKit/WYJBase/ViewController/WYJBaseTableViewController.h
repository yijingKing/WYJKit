/*
  Created by 祎 on 2021
  Copyright © 2021年 祎. All rights reserved.
*/

#import <UIKit/UIKit.h>
#import "WYJBaseViewController.h"
#import "WYJBaseTableView.h"
NS_ASSUME_NONNULL_BEGIN

@interface WYJBaseTableViewController : WYJBaseViewController<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic, nullable) WYJBaseTableView * tableView;
/// 当前页数
@property (nonatomic,assign) NSInteger  pageNow;
/// 总页数
@property (nonatomic,assign) NSInteger  totalPage;
/// 是否开启空界面
@property (nonatomic,assign) BOOL isUserEmpty;
/// 是否开启下拉刷新
@property (nonatomic,assign) BOOL isUseRefreshHeader;
/// 是否开启上拉加载
@property (nonatomic,assign) BOOL isUseRefreshFooter;
///// 是否自动预加载下一页功能
//@property (nonatomic,assign) BOOL isAutoRequestMore;
/// 是否关闭上拉加载
@property (nonatomic,assign) BOOL closeRefresh;
/// 是否关闭上拉加载
@property (nonatomic,assign) BOOL closeRefreshMore;
/// 数据数组
@property (nonatomic,strong) NSMutableArray * dataSource;
/// 自动加载百分比(默认80%)
@property (nonatomic,assign) CGFloat  loadingPercentage;
/// 样式(默认UITableViewStyleGrouped)
@property (nonatomic, assign) UITableViewStyle tableViewStyle;
/// 刷新回调
-(void)getRefreshData;
/// 加载回调
-(void)getMoreData;
/// 判断是否是最后一页
/// @param pageNow 当前页
/// @param totalPage 总页数
-(void)dataSetWithPageNow:(NSInteger )pageNow totalPage:(NSInteger)totalPage;
@end

NS_ASSUME_NONNULL_END
