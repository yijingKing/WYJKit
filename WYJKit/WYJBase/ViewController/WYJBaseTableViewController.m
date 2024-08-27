//
//  BaseTableViewController.m
//  LCProduct
//
//  Created by 王祎境 on 2024/7/5.
//

#import "WYJBaseTableViewController.h"
#import <Masonry/Masonry.h>
#import <MJRefresh/MJRefresh.h>
#import "WYJKitHeader.h"

@interface WYJBaseTableViewController ()
/// //判断是否加载中
@property (nonatomic ,assign)BOOL isLoading;

@end

@implementation WYJBaseTableViewController
- (void)viewDidLoad {
    self.tableViewStyle = UITableViewStyleGrouped;
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.view);
        make.top.mas_equalTo(self.mas_topLayoutGuideBottom);
        make.bottom.mas_equalTo(self.view);
    }];
    @weakify(self);
    [self.tableView refreshNormakHeaderWithRefreshingBlock:^{
        @strongify(self);
        [self getBaseRefreshData];
    }];
    [self.tableView refreshFooterWithRefreshingBlock:^{
        @strongify(self);
        [self getBaseMoreData];
    }];
    self.isUserEmpty = YES;
    self.tableView.emptyTitle = @"暂无数据";
    self.tableView.emptyBackgroundColor = UIColor.clearColor;
    [self.view sendSubviewToBack:self.tableView];
    [self.tableView yi_registerClass:WYJBaseTableViewCell.class];
    [self.tableView yi_registerClass:WYJBaseTitleTableViewCell.class];
    
}
- (void)setIsUserEmpty:(BOOL)isUserEmpty {
    _isUserEmpty = isUserEmpty;
    self.tableView.isUserEmpty = isUserEmpty;
}
- (void)reloadViewData {
    [self getRefreshData];
}
- (void)setCloseRefresh:(BOOL)closeRefresh {
    _closeRefresh = closeRefresh;
    if (closeRefresh) {
        self.tableView.mj_header = nil;
    } else {
        @weakify(self);
        [self.tableView refreshNormakHeaderWithRefreshingBlock:^{
            @strongify(self);
            [self getBaseRefreshData];
        }];
    }
}
- (void)setCloseRefreshMore:(BOOL)closeRefreshMore {
    _closeRefreshMore = closeRefreshMore;
    if (self.closeRefreshMore) {
        self.tableView.mj_footer = nil;
    } else {
        @weakify(self);
        [self.tableView refreshFooterWithRefreshingBlock:^{
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
}
#pragma make --- 加载 请求接口 ---
//加载 请求接口
- (void)getBaseMoreData {
    self.isLoading = YES;
    [self getMoreData];
}
/// 用于子类重写
-(void)getMoreData {
}
/// 判断是否是最后一页
/// @param pageNow 当前页
/// @param totalPage 总页数
-(void)dataSetWithPageNow:(NSInteger )pageNow totalPage:(NSInteger)totalPage {
    self.pageNow = pageNow;
    self.totalPage = totalPage;
    if (self.tableView) {
        [self.tableView endRefresh];
        if (pageNow >= totalPage || totalPage == 0) {
            [self.tableView endRefreshAndNoMoreData];
        }
    }
    self.isLoading = NO;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [WYJBaseTableViewCell new];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.01;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.01;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return UIView.new;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return UIView.new;
}

- (WYJBaseTableView *)tableView {
    if (!_tableView) {
        _tableView = [[WYJBaseTableView alloc] initWithFrame:CGRectZero style:self.tableViewStyle];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.isUserEmpty = self.isUserEmpty;
        _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, YJSCREEN_WIDTH, YJBottomHeight)];
    }
    return _tableView;
}
- (NSMutableArray *)dataSource {
    if (!_dataSource) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}
@end
