/*
  Created by King on 2021
  Copyright © 2021年 King. All rights reserved.
*/

#import <UIKit/UIKit.h>

#import "BaseCollectionViewHeader.h"
NS_ASSUME_NONNULL_BEGIN

@interface WYJBaseView : UIView
/// 是否开启空界面
@property (nonatomic,assign) BOOL isUserEmpty;
/// 是否开启下拉刷新
@property (nonatomic,assign) BOOL isUseRefreshHeader;
/// 是否开启上拉加载
@property (nonatomic,assign) BOOL isUseRefreshFooter;
/// 是否自动预加载下一页功能
@property (nonatomic,assign) BOOL isAutoRequestMore;

/// 当前页数
@property (nonatomic,assign) NSInteger  pageNow;
/// 总页数
@property (nonatomic,assign) NSInteger  totalPage;
/// 数据数组
@property (nonatomic,copy) NSMutableArray * dataSource;
/// 自动加载百分比(默认80%)
@property (nonatomic,assign) CGFloat  loadingPercentage;

/// 界面布局
- (void)initSubviews;
/// 界面约束
- (void)makeConstraint;
@end

NS_ASSUME_NONNULL_END
