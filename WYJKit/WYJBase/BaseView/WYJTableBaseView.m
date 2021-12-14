/*
 Created by King on 2021
 Copyright © 2021年 King. All rights reserved.
 */

#import "WYJTableBaseView.h"
#import "WYJKitHeader.h"
#import <Masonry/Masonry.h>
@interface WYJTableBaseView ()
/// //判断是否加载中
@property (nonatomic ,assign)BOOL isLoading;
@end

@implementation WYJTableBaseView
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self initSubviews];
        [self makeConstraint];
        self.tableViewStyle = UITableViewStyleGrouped;
        [self addTableView];
    }
    return self;
}
#pragma make ------ tableView ------
- (void)registTableViewCell:(Class)cell {
    [self.mainTableView registerClass:cell forCellReuseIdentifier:NSStringFromClass(cell)];
}
- (void)registTableViewCells:(NSArray <Class>*)cells {
    for (Class cell in cells) {
        [self.mainTableView registerClass:cell forCellReuseIdentifier:NSStringFromClass(cell)];
    }
}
//MARK: --- tableView ---
- (void)addTableView {
    [self initTableView:self.tableViewStyle];
}

- (void)addTableView:(UITableViewStyle)style configuration:(void(^)(UITableView *))block {
    [self initTableView:self.tableViewStyle];
    !block ?: block(self.mainTableView);
}

- (void)initTableView:(UITableViewStyle)style {
    self.mainTableView = [WYJBaseTableView.alloc initWithFrame: CGRectZero style: style];
    self.mainTableView.isUserEmpty = self.isUserEmpty;
    self.mainTableView.estimatedRowHeight = 44.0;
    self.mainTableView.estimatedSectionHeaderHeight = 0.01;
    self.mainTableView.estimatedSectionFooterHeight = 0.01;
    self.mainTableView.showsVerticalScrollIndicator = false;
    self.mainTableView.showsHorizontalScrollIndicator = false;
    self.mainTableView.backgroundColor = [UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:1];
    self.mainTableView.tableFooterView = [[UIView alloc] init];
    self.mainTableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    [self addSubview:self.mainTableView];
    [self.mainTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.yi_viewController.navigationController ? YJStatusAndNavHeight : YJStatusHeight);
        make.left.right.mas_equalTo(self);
        make.bottom.mas_equalTo(self.yi_viewController.tabBarController ? YJStatusAndNavHeight : YJStatusHeight);
    }];
    
    @weakify(self);
    if (self.isUseRefreshHeader) {
        [self.mainTableView refreshNormakHeaderWithRefreshingBlock:^{
            @strongify(self);
            [self getBaseRefreshData];
        }];
    }
    if (self.isUseRefreshFooter) {
        [self.mainTableView refreshFooterWithRefreshingBlock:^{
            @strongify(self);
            [self getBaseMoreData];
        }];
    }
}

//刷新 请求接口
- (void)getBaseRefreshData {
    self.isLoading = YES;
    [self getRefreshData];
}
/// 用于子类重写
-(void)getRefreshData {
    BLOCK_SAFE_CALLS(self.refreshDataBlock);
}

#pragma make --- 加载 请求接口 ---
//加载 请求接口
- (void)getBaseMoreData {
    self.isLoading = YES;
    [self getMoreData];
}
/// 用于子类重写
-(void)getMoreData {
    BLOCK_SAFE_CALLS(self.moreDataBlock);
}
/// 判断是否是最后一页
/// @param pageNow 当前页
/// @param totalPage 总页数
-(void)dataSetWithPageNow:(NSInteger )pageNow totalPage:(NSInteger)totalPage {
    self.pageNow = pageNow;
    self.totalPage = totalPage;
    if (self.mainTableView) {
        [self.mainTableView endRefresh];
        if (pageNow >= totalPage || totalPage == 0) {
            [self.mainTableView endRefreshAndNoMoreData];
        }
    } 
    self.isLoading = NO;
}
@end
