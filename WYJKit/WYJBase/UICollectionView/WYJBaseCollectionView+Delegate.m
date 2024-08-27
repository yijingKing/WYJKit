/*
  Created by 祎 on 2021
  Copyright © 2021年 祎. All rights reserved.
*/
#import "WYJBaseCollectionView+Delegate.h"
#import "WYJBaseCollectionViewDelegate.h"
@implementation WYJBaseCollectionView (Delegate)
#pragma make ------ 区数 ------
///区数
- (void)yi_numberOfSectionsInCollectionView:(WYJNumberOfSectionsInCollectionView)numberOfSectionsInCollectionView {
    [self.baseDelegate setNumberOfSectionsInCollectionView:^NSInteger(UICollectionView * _Nonnull collectionView) {
        return numberOfSectionsInCollectionView(collectionView);
    }];
}
#pragma make ------ 行数 ------
///行数
- (void)yi_numberOfItemsInSection:(WYJNumberOfItemsInSection)numberOfItemsInSection {
    self.baseDelegate.numberOfItemsInSection = numberOfItemsInSection;
    [self.baseDelegate setNumberOfItemsInSection:^NSInteger(UICollectionView * _Nonnull collectionView, NSInteger section) {
        return numberOfItemsInSection(collectionView,section);
    }];
}
#pragma make ------ cell ------
///cell
- (void)yi_cellForItemAtIndexPath:(WYJCellForItemAtIndexPath)cellForItemAtIndexPath {
    [self.baseDelegate setCellForItemAtIndexPath:^UICollectionViewCell * _Nullable(UICollectionView * _Nullable collectionView, NSIndexPath * _Nullable indexPath) {
        return cellForItemAtIndexPath(collectionView,indexPath);
    }];
}
#pragma make ------ 点击 ------
///点击
- (void)yi_didSelectItemAtIndexPath:(WYJDidSelectItemAtIndexPath)didSelectItemAtIndexPath {
    [self.baseDelegate setDidSelectItemAtIndexPath:^(UICollectionView * _Nullable collectionView, NSIndexPath * _Nullable indexPath) {
        didSelectItemAtIndexPath(collectionView,indexPath);
    }];
}
#pragma make ------  ------
///行高
- (void)yi_sizeForItemAtIndexPath:(WYJSizeForItemAtIndexPath)sizeForItemAtIndexPath {
    [self.baseDelegate setSizeForItemAtIndexPath:^CGSize(UICollectionView * _Nonnull collectionView, UICollectionViewLayout * _Nonnull layout, NSIndexPath * _Nonnull indexPath) {
        return sizeForItemAtIndexPath(collectionView,layout,indexPath);
    }];
}
#pragma make ------ 区头 ------
///区头高
- (void)yi_referenceSizeForHeaderInSection:(WYJReferenceSizeForHeaderInSection)referenceSizeForHeaderInSection {
    [self.baseDelegate setReferenceSizeForHeaderInSection:^CGFloat(UICollectionView * _Nonnull collectionView, UICollectionViewLayout * _Nonnull layout, NSInteger section) {
        return referenceSizeForHeaderInSection(collectionView,layout,section);
    }];
}
#pragma make ------ 区尾 ------
///区尾高
- (void)yi_referenceSizeForFooterInSection:(WYJReferenceSizeForFooterInSection)referenceSizeForFooterInSection {
    [self.baseDelegate setReferenceSizeForFooterInSection:^CGFloat(UICollectionView * _Nonnull collectionView, UICollectionViewLayout * _Nonnull layout, NSInteger section) {
        return referenceSizeForFooterInSection(collectionView,layout,section);
    }];
}
#pragma make ------ margin ------
///定义每个Section 的 margin
- (void)yi_insetForSectionAtIndex:(WYJInsetForSectionAtIndex)insetForSectionAtIndex {
    [self.baseDelegate setInsetForSectionAtIndex:^UIEdgeInsets(UICollectionView * _Nonnull collectionView, UICollectionViewLayout * _Nonnull layout, NSInteger section) {
        return insetForSectionAtIndex(collectionView,layout,section);
    }];
}
#pragma make ------ 间距 ------
///每个item之间的间距
- (void)yi_minimumInteritemSpacingForSectionAtIndex:(WYJMinimumInteritemSpacingForSectionAtIndex)minimumInteritemSpacingForSectionAtIndex {
    [self.baseDelegate setMinimumInteritemSpacingForSectionAtIndex:^CGFloat(UICollectionView * _Nonnull collectionView, UICollectionViewLayout * _Nonnull layout, NSInteger section) {
        return minimumInteritemSpacingForSectionAtIndex(collectionView,layout,section);
    }];
}
#pragma make ------ 每个section中不同的item之间的行间距 ------
///每个section中不同的item之间的行间距
- (void)yi_minimumLineSpacingForSectionAtIndex:(WYJMinimumLineSpacingForSectionAtIndex)minimumLineSpacingForSectionAtIndex {
    [self.baseDelegate setMinimumLineSpacingForSectionAtIndex:^CGFloat(UICollectionView * _Nonnull collectionView, UICollectionViewLayout * _Nonnull layout, NSInteger section) {
        return minimumLineSpacingForSectionAtIndex(collectionView,layout,section);
    }];
}
#pragma make ------ 区视图 ------
///区视图
- (void)yi_viewForSupplementaryElementOfKind:(WYJViewForSupplementaryElementOfKind)viewForSupplementaryElementOfKind {
    self.baseDelegate.viewForSupplementaryElementOfKind = viewForSupplementaryElementOfKind;
    [self.baseDelegate setViewForSupplementaryElementOfKind:^UICollectionReusableView * _Nullable(UICollectionView * _Nonnull collectionView, NSString * _Nonnull kind, NSIndexPath * _Nonnull indexPath) {
        return viewForSupplementaryElementOfKind(collectionView,kind,indexPath);
    }];
}
- (void)yi_willDisplayCell:(WYJWillDisplayCollectionViewCell)willDisplayCell {
    [self.baseDelegate setWillDisplayCell:^(UICollectionView * _Nullable collectionView, UICollectionViewCell * _Nonnull cell, NSIndexPath * _Nullable indexPath) {
        return willDisplayCell(collectionView,cell,indexPath);
    }];
}
@end
