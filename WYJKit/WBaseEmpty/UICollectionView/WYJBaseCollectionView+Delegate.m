//
//  WYJBaseCollectionView+Delegate.m
//  YJKitDemo
//
//  Created by PZ-IMAC-1 on 2021/9/2.
//  Copyright © 2021 Eugene King. All rights reserved.
//

#import "WYJBaseCollectionView+Delegate.h"

@implementation WYJBaseCollectionView (Delegate)
#pragma make ------ 区数 ------
///区数
- (void)numberOfSectionsInCollectionView:(NumberOfSectionsInCollectionView)numberOfSectionsInCollectionView {
    self.baseDelegate.numberOfSectionsInCollectionView = numberOfSectionsInCollectionView;
}
#pragma make ------ 行数 ------
///行数
- (void)numberOfItemsInSection:(NumberOfItemsInSection)numberOfItemsInSection {
    self.baseDelegate.numberOfItemsInSection = numberOfItemsInSection;
}
#pragma make ------ cell ------
///cell
- (void)cellForItemAtIndexPath:(CellForItemAtIndexPath)cellForItemAtIndexPath {
    self.baseDelegate.cellForItemAtIndexPath = cellForItemAtIndexPath;
}
#pragma make ------ 点击 ------
///点击
- (void)didSelectItemAtIndexPath:(DidSelectItemAtIndexPath)didSelectItemAtIndexPath {
    self.baseDelegate.didSelectItemAtIndexPath = didSelectItemAtIndexPath;
}
#pragma make ------  ------
///行高
- (void)sizeForItemAtIndexPath:(SizeForItemAtIndexPath)sizeForItemAtIndexPath {
    self.baseDelegate.sizeForItemAtIndexPath = sizeForItemAtIndexPath;
}
#pragma make ------ 区头 ------
///区头高
- (void)referenceSizeForHeaderInSection:(ReferenceSizeForHeaderInSection)referenceSizeForHeaderInSection {
    self.baseDelegate.referenceSizeForHeaderInSection = referenceSizeForHeaderInSection;
}
#pragma make ------ 区尾 ------
///区尾高
- (void)referenceSizeForFooterInSection:(ReferenceSizeForFooterInSection)referenceSizeForFooterInSection {
    self.baseDelegate.referenceSizeForFooterInSection = referenceSizeForFooterInSection;
}
#pragma make ------ margin ------
///定义每个Section 的 margin
- (void)insetForSectionAtIndex:(InsetForSectionAtIndex)insetForSectionAtIndex {
    self.baseDelegate.insetForSectionAtIndex = insetForSectionAtIndex;
}
#pragma make ------ 间距 ------
///每个item之间的间距
- (void)minimumInteritemSpacingForSectionAtIndex:(MinimumInteritemSpacingForSectionAtIndex)minimumInteritemSpacingForSectionAtIndex {
    self.baseDelegate.minimumInteritemSpacingForSectionAtIndex = minimumInteritemSpacingForSectionAtIndex;
}
#pragma make ------ 每个section中不同的item之间的行间距 ------
///每个section中不同的item之间的行间距
- (void)minimumLineSpacingForSectionAtIndex:(MinimumLineSpacingForSectionAtIndex)minimumLineSpacingForSectionAtIndex {
    self.baseDelegate.minimumLineSpacingForSectionAtIndex = minimumLineSpacingForSectionAtIndex;
}
#pragma make ------ 区视图 ------
///区视图
- (void)viewForSupplementaryElementOfKind:(ViewForSupplementaryElementOfKind)viewForSupplementaryElementOfKind {
    self.baseDelegate.viewForSupplementaryElementOfKind = viewForSupplementaryElementOfKind;
}
@end
