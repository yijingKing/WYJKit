/*
  Created by 祎 on 2021
  Copyright © 2021年 祎. All rights reserved.
*/
#import "WYJBaseCollectionView.h"

NS_ASSUME_NONNULL_BEGIN
@interface WYJBaseCollectionView (Delegate)
#pragma make ------ 区数 ------
///区数
- (void)yi_numberOfSectionsInCollectionView:(WYJNumberOfSectionsInCollectionView)numberOfSectionsInCollectionView;
#pragma make ------ 行数 ------
///行数
- (void)yi_numberOfItemsInSection:(WYJNumberOfItemsInSection)numberOfItemsInSection;
#pragma make ------ cell ------
///cell
- (void)yi_cellForItemAtIndexPath:(WYJCellForItemAtIndexPath)cellForItemAtIndexPath;
#pragma make ------ 点击 ------
///点击
- (void)yi_didSelectItemAtIndexPath:(WYJDidSelectItemAtIndexPath)didSelectItemAtIndexPath;
#pragma make ------  ------
///行高
- (void)yi_sizeForItemAtIndexPath:(WYJSizeForItemAtIndexPath)sizeForItemAtIndexPath;
#pragma make ------ 区头 ------
///区头高
- (void)yi_referenceSizeForHeaderInSection:(WYJReferenceSizeForHeaderInSection)referenceSizeForHeaderInSection;
#pragma make ------ 区尾 ------
///区尾高
- (void)yi_referenceSizeForFooterInSection:(WYJReferenceSizeForFooterInSection)referenceSizeForFooterInSection;
#pragma make ------ margin ------
///定义每个Section 的 margin
- (void)yi_insetForSectionAtIndex:(WYJInsetForSectionAtIndex)insetForSectionAtIndex;
#pragma make ------ 间距 ------
///每个item之间的间距
- (void)yi_minimumInteritemSpacingForSectionAtIndex:(WYJMinimumInteritemSpacingForSectionAtIndex)minimumInteritemSpacingForSectionAtIndex;
#pragma make ------ 每个section中不同的item之间的行间距 ------
///每个section中不同的item之间的行间距
- (void)yi_minimumLineSpacingForSectionAtIndex:(WYJMinimumLineSpacingForSectionAtIndex)minimumLineSpacingForSectionAtIndex;
#pragma make ------ 区视图 ------
///区视图
- (void)yi_viewForSupplementaryElementOfKind:(WYJViewForSupplementaryElementOfKind)viewForSupplementaryElementOfKind;


- (void)yi_willDisplayCell:(WYJWillDisplayCollectionViewCell)willDisplayCell;
@end

NS_ASSUME_NONNULL_END
