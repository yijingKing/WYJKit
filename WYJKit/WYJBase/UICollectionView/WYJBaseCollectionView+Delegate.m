/*
  Created by King on 2021
  Copyright © 2021年 King. All rights reserved.
*/
#import "WYJBaseCollectionView+Delegate.h"
#import "WYJBaseCollectionViewDelegate.h"
@implementation WYJBaseCollectionView (Delegate)
#pragma make ------ 区数 ------
///区数
- (void)numberOfSectionsInCollectionView:(WYJNumberOfSectionsInCollectionView)numberOfSectionsInCollectionView {
    self.baseDelegate.numberOfSectionsInCollectionView = numberOfSectionsInCollectionView;
}
#pragma make ------ 行数 ------
///行数
- (void)numberOfItemsInSection:(WYJNumberOfItemsInSection)numberOfItemsInSection {
    self.baseDelegate.numberOfItemsInSection = numberOfItemsInSection;
}
#pragma make ------ cell ------
///cell
- (void)cellForItemAtIndexPath:(WYJCellForItemAtIndexPath)cellForItemAtIndexPath {
    self.baseDelegate.cellForItemAtIndexPath = cellForItemAtIndexPath;
}
#pragma make ------ 点击 ------
///点击
- (void)didSelectItemAtIndexPath:(WYJDidSelectItemAtIndexPath)didSelectItemAtIndexPath {
    self.baseDelegate.didSelectItemAtIndexPath = didSelectItemAtIndexPath;
}
#pragma make ------  ------
///行高
- (void)sizeForItemAtIndexPath:(WYJSizeForItemAtIndexPath)sizeForItemAtIndexPath {
    self.baseDelegate.sizeForItemAtIndexPath = sizeForItemAtIndexPath;
}
#pragma make ------ 区头 ------
///区头高
- (void)referenceSizeForHeaderInSection:(WYJReferenceSizeForHeaderInSection)referenceSizeForHeaderInSection {
    self.baseDelegate.referenceSizeForHeaderInSection = referenceSizeForHeaderInSection;
}
#pragma make ------ 区尾 ------
///区尾高
- (void)referenceSizeForFooterInSection:(WYJReferenceSizeForFooterInSection)referenceSizeForFooterInSection {
    self.baseDelegate.referenceSizeForFooterInSection = referenceSizeForFooterInSection;
}
#pragma make ------ margin ------
///定义每个Section 的 margin
- (void)insetForSectionAtIndex:(WYJInsetForSectionAtIndex)insetForSectionAtIndex {
    self.baseDelegate.insetForSectionAtIndex = insetForSectionAtIndex;
}
#pragma make ------ 间距 ------
///每个item之间的间距
- (void)minimumInteritemSpacingForSectionAtIndex:(WYJMinimumInteritemSpacingForSectionAtIndex)minimumInteritemSpacingForSectionAtIndex {
    self.baseDelegate.minimumInteritemSpacingForSectionAtIndex = minimumInteritemSpacingForSectionAtIndex;
}
#pragma make ------ 每个section中不同的item之间的行间距 ------
///每个section中不同的item之间的行间距
- (void)minimumLineSpacingForSectionAtIndex:(WYJMinimumLineSpacingForSectionAtIndex)minimumLineSpacingForSectionAtIndex {
    self.baseDelegate.minimumLineSpacingForSectionAtIndex = minimumLineSpacingForSectionAtIndex;
}
#pragma make ------ 区视图 ------
///区视图
- (void)viewForSupplementaryElementOfKind:(WYJViewForSupplementaryElementOfKind)viewForSupplementaryElementOfKind {
    self.baseDelegate.viewForSupplementaryElementOfKind = viewForSupplementaryElementOfKind;
}
- (void)willDisplayCell:(WYJWillDisplayCollectionViewCell)willDisplayCell {
    self.baseDelegate.willDisplayCell = willDisplayCell;
}
@end
