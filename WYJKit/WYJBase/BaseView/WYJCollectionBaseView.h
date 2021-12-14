//
//  WYJCollectionBaseView.h
//  WYJKitDemo
//
//  Created by 祎 on 2021/12/14.
//

#import "WYJBaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface WYJCollectionBaseView : WYJBaseView
@property (strong, nonatomic, nullable) WYJBaseCollectionView * mainCollectionView;
/// 刷新回调 (调用回调的方法此block失效)
@property (nonatomic,copy) void (^refreshDataBlock)(void);
/// 加载回调( 调用回调的方法此block失效)
@property (nonatomic,copy) void (^moreDataBlock)(void);
/// 刷新回调
-(void)getRefreshData;
/// 加载回调
-(void)getMoreData;

///添加Collection
- (void)addCollection;
///添加Collection
- (void)addCollection:(UICollectionViewFlowLayout *)flowLayout configuration:(void(^)(UICollectionView *collectionView))block;
/// 判断是否是最后一页
/// @param pageNow 当前页
/// @param totalPage 总页数
-(void)dataSetWithPageNow:(NSInteger )pageNow totalPage:(NSInteger)totalPage;


@end

NS_ASSUME_NONNULL_END
