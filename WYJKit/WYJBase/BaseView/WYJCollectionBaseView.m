//
//  WYJCollectionBaseView.m
//  WYJKitDemo
//
//  Created by 祎 on 2021/12/14.
//

#import "WYJCollectionBaseView.h"
#import "WYJKitHeader.h"
#import <Masonry/Masonry.h>
@interface WYJCollectionBaseView ()
/// //判断是否加载中
@property (nonatomic ,assign)BOOL isLoading;
@end

@implementation WYJCollectionBaseView
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self initSubviews];
        [self makeConstraint];
        self.pageNow = 1;
        self.totalPage = 1;
        self.isLoading = YES;
        self.loadingPercentage = 0.8;
        [self addCollection];
    }
    return self;
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
    
    if (self.mainCollectionView) {
        [self.mainCollectionView endRefresh];
        if (pageNow >= totalPage || totalPage == 0) {
            [self.mainCollectionView endRefreshAndNoMoreData];
        }
    }
    self.isLoading = NO;
}

@end
