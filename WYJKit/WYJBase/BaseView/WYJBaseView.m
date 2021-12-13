/*
  Created by King on 2021
  Copyright © 2021年 King. All rights reserved.
*/

#import "WYJBaseView.h"
#import "WYJKitHeader.h"
#import <Masonry/Masonry.h>
@interface WYJBaseView ()
/// //判断是否加载中
@property (nonatomic ,assign)BOOL isLoading;
@end

@implementation WYJBaseView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self initSubviews];
        [self makeConstraint];
        self.tableViewStyle = UITableViewStyleGrouped;
        self.pageNow = 1;
        self.totalPage = 1;
        self.isLoading = YES;
        self.loadingPercentage = 0.8;
        ///添加单击手势监听
        UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapGesture:)];
        singleTap.numberOfTouchesRequired = 1; //手指数
        singleTap.numberOfTapsRequired = 1; //tap次数
        [self addGestureRecognizer:singleTap];
    }
    return self;
}


#pragma make ------ tableView ------
//MARK: --- tableView ---
- (void) addTableView {
    [self initTableView:self.tableViewStyle];
}

- (void) addTableView:(UITableViewStyle)style configuration:(void(^)(UITableView *))block {
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
    
    [self.mainTableView willDisplayCell:^(UITableView * _Nullable tableView, UITableViewCell * _Nonnull cell, NSIndexPath * _Nullable indexPath) {
        @strongify(self);
        if (self.isLoading) {
            return;
        }
        if (!self.isUseRefreshFooter) {
            return;
        }
        if (!self.isAutoRequestMore) {
            return;
        }
        if (self.pageNow >= self.totalPage) {
            return;
        }
        NSInteger current = indexPath.section  * self.dataSource.count + indexPath.row;
        NSInteger count = self.dataSource.count;
        if (current > count * 0.8) {
            [self getBaseMoreData];
        }
    }];
    [self tableViewDefultDelete];
}

- (void)tableViewDefultDelete {
    @weakify(self);
    [self.mainTableView numberForSection:^NSInteger(UITableView * _Nonnull tableView) {
        @strongify(self);
        if (YJArrayNotEmpty(self.dataSource)) {
            if (![self.dataSource.firstObject isKindOfClass:NSArray.class]) {
                return 1;
            }
        }
        return self.dataSource.count;
    }];
    [self.mainTableView numberOfRowsInSection:^NSInteger(UITableView * _Nonnull tableView, NSInteger section) {
        @strongify(self);
        if (YJArrayNotEmpty(self.dataSource)) {
            if ([self.dataSource.firstObject isKindOfClass:NSArray.class]) {
                return [self.dataSource[section] count];
            }
        }
        return self.dataSource.count;
    }];
}
#pragma make ------ collection ------
//MARK: --- collection ---
- (void)addCollection {
    UICollectionViewFlowLayout * layout = [UICollectionViewFlowLayout.alloc init];
    [self initCollectionView:layout];
}

- (void)addCollection:(UICollectionViewFlowLayout *)flowLayout configuration:(void(^)(UICollectionView *))block {
    [self initCollectionView:flowLayout];
    !block ?: block(self.mainCollectionView);
}
- (void)initCollectionView:(UICollectionViewFlowLayout *)flowLayout {

    self.mainCollectionView = [WYJBaseCollectionView.alloc initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    self.mainCollectionView.isUserEmpty = self.isUserEmpty;
    self.mainCollectionView.alwaysBounceVertical = YES;//当不够一屏的话也能滑动
    self.mainCollectionView.showsVerticalScrollIndicator = NO;
    self.mainCollectionView.showsHorizontalScrollIndicator = NO;
    [self.mainCollectionView setBackgroundColor:[UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:1]];
    [self.mainCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([UICollectionViewCell class])];

    [self.mainCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.yi_viewController.navigationController ? YJStatusAndNavHeight : YJStatusHeight);
        make.left.right.mas_equalTo(self);
        make.bottom.mas_equalTo(self.yi_viewController.tabBarController ? YJStatusAndNavHeight : YJStatusHeight);
    }];
    
    @weakify(self);
    if (self.isUseRefreshHeader) {
        [self.mainCollectionView refreshHeaderWithRefreshingBlock:^{
            @strongify(self);
            [self getBaseRefreshData];
        }];
    }
    if (self.isUseRefreshFooter) {
        [self.mainCollectionView refreshFooterWithRefreshingBlock:^{
            @strongify(self);
            [self getBaseMoreData];
        }];
    }
    [self.mainCollectionView willDisplayCell:^(UICollectionView * _Nullable collectionView, UICollectionViewCell * _Nonnull cell, NSIndexPath * _Nullable indexPath) {
        @strongify(self);
        if (self.isLoading) {
            return;
        }
        if (!self.isUseRefreshFooter) {
            return;
        }
        if (!self.isAutoRequestMore) {
            return;
        }
        if (self.pageNow >= self.totalPage) {
            return;
        }
        NSInteger current = indexPath.section  * self.dataSource.count + indexPath.row;
        NSInteger count = self.dataSource.count;
        if (current > count * 0.8) {
            [self getBaseMoreData];
        }
    }];
    
    [self collectionViewDefultDelete];
}
- (void)collectionViewDefultDelete {
    @weakify(self);
    [self.mainCollectionView numberOfSectionsInCollectionView:^NSInteger(UICollectionView * _Nonnull collectionView) {
        @strongify(self);
        if (YJArrayNotEmpty(self.dataSource)) {
            if (![self.dataSource.firstObject isKindOfClass:NSArray.class]) {
                return 1;
            }
        }
        return self.dataSource.count;
    }];
    [self.mainCollectionView numberOfItemsInSection:^NSInteger(UICollectionView * _Nonnull collectionView, NSInteger section) {
        @strongify(self);
        if (YJArrayNotEmpty(self.dataSource)) {
            if ([self.dataSource.firstObject isKindOfClass:NSArray.class]) {
                return [self.dataSource[section] count];
            }
        }
        return self.dataSource.count;
    }];
}
#pragma make --- 刷新 ---
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
    
    if (self.mainTableView) {
        [self.mainTableView endRefresh];
        if (pageNow >= totalPage || totalPage == 0) {
            [self.mainTableView endRefreshAndNoMoreData];
        }
    } else if (self.mainCollectionView) {
        [self.mainCollectionView endRefresh];
        if (pageNow >= totalPage || totalPage == 0) {
            [self.mainCollectionView endRefreshAndNoMoreData];
        }
    }
    self.isLoading = NO;
}

#pragma make --- 属性 ---
- (NSMutableArray *)dataSource {
    if (!_dataSource) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}








- (void)tapGesture:(UITapGestureRecognizer *)tap {
    if (self.yi_tapClickBlock) {
        self.yi_tapClickBlock();
    }
}

- (void)initSubviews {
    
}

- (void)makeConstraint {
    
}

- (void)configurationData:(id)data {
    
}

@end
