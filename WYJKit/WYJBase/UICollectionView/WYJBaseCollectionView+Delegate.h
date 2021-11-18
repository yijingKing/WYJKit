/*
  Created by 祎 on 2021
  Copyright © 2021年 祎. All rights reserved.
  GitHub: https://github.com/MemoryKing
*/
#import "WYJBaseCollectionView.h"

NS_ASSUME_NONNULL_BEGIN
@interface WYJBaseCollectionView (Delegate)
#pragma make ------ 区数 ------
///区数
- (void)numberOfSectionsInCollectionView:(WYJNumberOfSectionsInCollectionView)numberOfSectionsInCollectionView;
#pragma make ------ 行数 ------
///行数
- (void)numberOfItemsInSection:(WYJNumberOfItemsInSection)numberOfItemsInSection;
#pragma make ------ cell ------
///cell
- (void)cellForItemAtIndexPath:(WYJCellForItemAtIndexPath)cellForItemAtIndexPath;
#pragma make ------ 点击 ------
///点击
- (void)didSelectItemAtIndexPath:(WYJDidSelectItemAtIndexPath)didSelectItemAtIndexPath;
#pragma make ------  ------
///行高
- (void)sizeForItemAtIndexPath:(WYJSizeForItemAtIndexPath)sizeForItemAtIndexPath;
#pragma make ------ 区头 ------
///区头高
- (void)referenceSizeForHeaderInSection:(WYJReferenceSizeForHeaderInSection)referenceSizeForHeaderInSection;
#pragma make ------ 区尾 ------
///区尾高
- (void)referenceSizeForFooterInSection:(WYJReferenceSizeForFooterInSection)referenceSizeForFooterInSection;
#pragma make ------ margin ------
///定义每个Section 的 margin
- (void)insetForSectionAtIndex:(WYJInsetForSectionAtIndex)insetForSectionAtIndex;
#pragma make ------ 间距 ------
///每个item之间的间距
- (void)minimumInteritemSpacingForSectionAtIndex:(WYJMinimumInteritemSpacingForSectionAtIndex)minimumInteritemSpacingForSectionAtIndex;
#pragma make ------ 每个section中不同的item之间的行间距 ------
///每个section中不同的item之间的行间距
- (void)minimumLineSpacingForSectionAtIndex:(WYJMinimumLineSpacingForSectionAtIndex)minimumLineSpacingForSectionAtIndex;
#pragma make ------ 区视图 ------
///区视图
- (void)viewForSupplementaryElementOfKind:(WYJViewForSupplementaryElementOfKind)viewForSupplementaryElementOfKind;


- (void)willDisplayCell:(WYJWillDisplayCollectionViewCell)willDisplayCell;
@end

NS_ASSUME_NONNULL_END
