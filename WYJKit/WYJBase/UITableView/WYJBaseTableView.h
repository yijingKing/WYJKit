/*
  Created by King on 2021
  Copyright © 2021年 King. All rights reserved.
*/


#import <UIKit/UIKit.h>
#import "WYJBaseTableViewDelegate.h"
@interface WYJBaseTableView : UITableView
@property (strong, nonatomic)WYJBaseTableViewDelegate * baseDelegate;
/// 是否开启空界面
@property (nonatomic,assign) BOOL isUserEmpty;
#pragma make ------ empty ------
/// 空页面文本
@property (nonatomic, copy)NSString * emptyTitle;
/// 空页面文本字体
@property (nonatomic, strong)UIFont * emptyTitleFont;
/// 空页面文本颜色
@property (nonatomic, strong)UIColor * emptyTitleColor;
/// 空页面富文本
@property (nonatomic, copy)NSAttributedString * emptyTitleAttributedString;
/// 空页面图片
@property (nonatomic, strong)UIImage * emptyImage;
/// 空页面描述
@property (nonatomic, copy)NSString * emptyDescription;
/// 空页面描述字体
@property (nonatomic, strong)UIFont * emptyDescriptionFont;
/// 空页面描述文本颜色
@property (nonatomic, strong)UIColor * emptyDescriptionColor;
/// 空页面描述富文本
@property (nonatomic, copy)NSAttributedString * emptyDescriptionAttributedString;
/// 空页面背景色
@property (nonatomic, strong)UIColor * emptyBackgroundColor;

#pragma make ------ refresh heder------
/// 影藏刷新时间
@property (nonatomic, assign)BOOL hiddenTime;
/// 影藏刷新状态
@property (nonatomic, assign)BOOL hiddenState;

/// 空界面文本
- (void)showNoSourcePageWithEmpty:(NSString *)msg;

/// 空界面按钮
- (void)showButtonTitleForEmpty:(NSString *)string Click:(void(^)(void))click;

/// 刷新和加载
- (void)refreshHeaderWithRefreshingBlock:(void(^)(void))headerBlock footerWithRefreshingBlock:(void(^)(void))footBlock;

/// 默认刷新
- (void)refreshNormakHeaderWithRefreshingBlock:(void(^)(void))headerBlock;

/// gif刷新
- (void)refreshGifHeaderWithRefreshingBlock:(void(^)(void))headerBlock;

/// 加载
- (void)refreshFooterWithRefreshingBlock:(void(^)(void))footBlock;

/// 结束刷新状态
- (void)endRefresh;

/// 结束刷新并加载无数据
- (void)endRefreshAndNoMoreData;

@end
